class ProjectsController < ApplicationController
    # Make sure that the Student is Signed-in before exceuting the selected actions
    before_action :authenticate_student!, only:[:index]

    # Find a Project by the ID from params, before executing any of the specified actions
    before_action :find_project, only: [:show]

    # Make sure that the Student is authorized before the specified actions
    before_action :check_authroization, only: [:show]

    def index
        # Render view 'index' and pass it list of all projects for the current student
        @projects = current_student.projects.all
    end

    def show
        # Render the 'show' view and pass it the Project found by ID.
        @project
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

        def find_project
            # Find a Project by the ID from the url params
            @project = Project.find(params[:id])
        end

        def check_authroization
            # If a logged-in student go to a route that they don't have an autherization for, 
            # they will be redirected to the root path and dispalyed flash message 'Not Authorized!'
            if current_student != @project.student
                flash[:alert] = 'Not Authorized!'
                redirect_to root_path
            end
        end
end
