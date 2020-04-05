class ProjectsController < ApplicationController
    before_action :authenticate_student!, only:[:index]

    def index
        # Render view 'index' and pass it list of all projects for the current student
        @projects = current_student.projects.all
    end
end
