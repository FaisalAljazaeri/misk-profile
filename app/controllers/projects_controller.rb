class ProjectsController < ApplicationController
    before_action :authenticate_student!, only:[:index]

    def index
        # Render view 'index' and pass it list of all projects for the current student
        @projects = current_student.projects.all
    end

    def new
        # Render the 'new' view and pass it a project object
        @project = Project.new
    end

    def create
        # Create a new Project with the recived data from the 'new' form
        @project = Project.new(project_params)

        # Assign the Project created to the currently logged-n student
        @project.student = current_student

        # Save the new Project object to the DB
        if @project.save
            # If the save is successfull, redirect to the projects index
            redirect_to projects_path
        else
            # If the save failed, Render the 'new' view again
            render :new
        end
    end

    private
        def project_params
            # Select which parameters of the Project model are permitted to be changed
            params.require(:project).permit(:name, :description, :img, :link)
        end
end
