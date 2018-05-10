require 'erector'
require 'thing'
require 'views'

class Project < Thing
  def self.projects_dir
    @@projects_dir ||= begin
      app_dir = File.expand_path(File.dirname(File.dirname(__FILE__)))
      File.join(app_dir, "public", "projects")
    end
  end

  def self.all
    # for now, just get all projects ever
    pattern = '*.md'
    Dir[File.join(File.absolute_path(projects_dir), pattern)].sort.map do |file|
      file.slice! /^#{projects_dir}\//
      file.slice! /\.md$/
      Project.new(name: file)
    end
  end

  #todo: unit test this hash-or-string-to-object magic
  def self.from_json project_info
    project_info = {name: project_info} if project_info.is_a? String
    project_info.symbolize_keys!
    Project.new(**project_info)
  end

  # is this project optional? default: false
  attr_reader :optional

  # where the project is located; nil means it's in here
  def from
    @from
  end

  def projects_dir
    @projects_dir || Project.projects_dir
  end

  def content_file
    File.new(File.join(projects_dir, "#{@name}.md"))
  end

  # todo: use OO, not switch statement, for 'From' href and icon
  # todo: more unit tests around all these cases
  def href
    case from
    when nil
      @href || "/projects/#{name}"
    when 'CodeCademy'
      @href
    when 'FreeCodeCamp'
      if @href
        if @href =~ /^\// #  allow partial paths e.g. /basic-javascript/introduction-to-javascript
          "https://beta.freecodecamp.org/en/challenges#{@href}"
        else  
          @href
        end
      else
        "https://beta.freecodecamp.org/en/challenges/basic-javascript/introduction-to-javascript"
      end
    else
      @href
    end
  end


  # def link
  #   Link.new(name: name, href: href, description: description, from: from)
  # end

  def icon
    if from
      case from.downcase
      when 'freecodecamp'
        '/images/fcc-fire-white.png'
      when 'codecademy'
        '/images/codecademy-logo-400x400.jpg'
      end
    end
  end

  def content
    @content || File.read(content_file)
  end

  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    include Views

    needs :target
    attr_reader :target

    def content
      text raw(from_markdown(target.content))
    end

  end

end
