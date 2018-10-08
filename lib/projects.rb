require 'thing'

class Projects < Thing

  def view
    ProjectsView.new(projects: @projects)
  end

  class ProjectsView < Erector::Widget
    include Views

    # todo: show which track(s) each project is in
    # todo: sort by schedule
    def content
      h1 "Projects"
      ul do
        @projects.each do |project|
          li do
            widget project.link_view(show_description: true)
          end
        end
      end
    end
  end

end

