require 'sinatra/base'
require "sinatra/cookies"

require 'erector'
require 'deck/slide'
require 'deck/slide_deck'
require 'deck/rack_app'

# add "lib" dir to Ruby load path
here = ::File.expand_path(File.dirname(__FILE__))
lib = "#{here}/lib"
$: << lib

require 'util'
require "hash_extensions"
# require_all(lib)

require 'site'
require 'app_page'
require 'tracks_table'
require 'tracks_sidebar'
require 'markdown_widget'

module AppHelpers
  def page_title object, extra = nil
    [
        (object.display_name rescue object.to_s),
        extra,
        "- Code Like This"
    ].compact.join(' ')
  end
end

class App < Sinatra::Base
  helpers Sinatra::Cookies

  include Erector::Mixin
  include AppHelpers

  before do
    Thread.current[:development_mode] = (request.host =~ /^localhost$/)
  end

  after do
    Thread.current[:development_mode] = nil
  end

  def site
    @site ||= create_site
  end

  def page(thing: , sidebar: false, breadcrumbs: false)
    ThingPage.new(thing: thing, site: site, warning: @warning, sidebar: sidebar, breadcrumbs: breadcrumbs)
  end

  get '/host' do
    content_type "text/plain"
    {
        SERVER_NAME: request.env["SERVER_NAME"],
        host: request.host,
    }.ai
  end

  class Tracks < Thing
    def view
      TracksSidebar.new(tracks: @site.tracks, current: nil)
    end
  end

  get '/lessons' do
    page(thing: Tracks.new(site: site)).to_html
  end

  get '/' do
    page(
        thing: site,
        sidebar: true
        ).to_html
  end

  get "/lessons/:track" do
    page(thing: track).to_html
  end

  get "/lessons/:track/:lesson.slides" do
    # slides are signified with a dot instead of a slash so that relative file references don't break

    track = site.track_named(params[:track])

    if track
      file = File.join(lesson.dir, "#{params[:lesson]}.md")

      if not File.exist?(file)
        not_found
        return
      end

      slides = Deck::Slide.from_file(file)

      # final slide is nav
      slides << begin
        slide = Deck::Slide.new(slide_id: '_next')

        lesson = track.lesson_named(params[:lesson])

        slide << lesson.view.to_html(content_method_name: :labs)
        slide << lesson.view.to_html(content_method_name: :next_lesson_button)
        slide << lesson.view.to_html(content_method_name: :previous_lesson_button)

        slide << "<p><a href='#{lesson.href}'>Outline</a></p>"
        slide
      end
    end

    deck_page = Deck::SlideDeck.new(:slides => slides,
                                    :title => page_title(lesson, "Slides"),
                                    :stylesheets => [
                                        # "/css/github-markdown.css",
                                        "/css/slides.css",
                                    ],
    )
    deck_page.to_html
  end

  get "/lessons/:track/:file.:ext" do
    send_file(File.join(track_dir, "#{params[:file]}.#{params[:ext]}"))
  end

  get "/lessons/:track/:lesson" do
    page(thing: lesson).to_html
  end

  get "/projects" do
    page(thing: site.projects).to_html
  end

  get "/projects/:file.:ext" do
    path = File.join(here, "public", "projects", "#{params[:file]}.#{params[:ext]}")
    send_file(path)
  end

  get "/projects/:project_name" do
    project = Project.new(name: params[:project_name])
    page(thing: project).to_html
  end

  get "/schedule" do
    if (site && site.schedule)
      page(thing: site.schedule).to_html
    else
      not_found
    end
  end

  get "/topics/:topic_name" do
    # todo: make this actually work
    topic = Topic.new(name: params[:topic_name])
    page(
        title: "Topic: #{topic.display_name}",
        widget: Topic::View.new(site: site, target: topic)
    ).to_html
  end

  def track_dir
    track.dir
  end

  def track
    begin
      Track.named(params[:track])
    rescue NameError => e
      $stderr.puts(e)
      $stderr.puts "\t" + e.backtrace.join("\n\t")
      not_found
    end
  end

  def lesson
    track.lesson_named(params[:lesson] || params[:file])
  end

  private

  def create_site
    if params['site']
      sitename = params['site']
      response.set_cookie(:site, :value => sitename,
                          :expires => Time.now + 3600*12)
    elsif cookies['site']
      sitename = cookies['site']
    else
      sitename = request.host
    end

    site = [CodeLikeThis, Bootcamp, JavascriptNights].map(&:new).detect do |site|
      site.host? sitename
    end
    if site.nil?
      @warning = "No site found for #{sitename}; using CodeLikeThis content."
      site = CodeLikeThis.new
    end
    site
  end

  def here
    File.expand_path(File.dirname(__FILE__))
  end

end

