class ProjectsController < ApplicationController
    # Make sure that the Student is Signed-in before exceuting the selected actions
    before_action :authenticate_student!, only:[:index, :show, :edit, :destroy]

    # Find a Project by the ID from params, before executing any of the specified actions
    before_action :find_project, only: [:show, :edit, :update, :destroy]

    # Make sure that the Student is authorized before the specified actions
    before_action :check_authroization, only: [:show, :edit, :update, :destroy]

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

    def edit
        # Render the 'edit' view and pass it the Project found by ID
        @project
    end

    def update
        # Update the project with the parameters from the 'edit' Form
        if @project.update(project_params)
            # If the update was successfully saved in the DB, redirect to the project 'show'
            redirect_to @project
        else
            # In case the update operation wasn't successful, render the 'edit' form again
            render :edit
        end
    end

    def destroy
        # Delete the Project found by ID from the DB
        @project.destroy

        # After the Project is deleted, redirect to projects 'index'
        redirect_to projects_path
    end

    private
        def project_params
            # Select which parameters of the Project model are permitted to be changed
            params.require(:project).permit(:name, :description, :project_img, :link, :github_link)
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
