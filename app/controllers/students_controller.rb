class StudentsController < ApplicationController
    # Check if a Student is authenticated before these actions
    before_action :authenticate_student!, only: [:edit, :update, :skills]
    # Find student by ID and save it in @student, for the actions that require it
    before_action :find_student, only: [:show, :edit, :update, :destroy, :skills, :remove_skill]

    def index
        # Render 'index' view and pass it all students
        @students = Student.all
    end

    def show
        # Render 'show' view and send it @student found by id
        @student 
    end

    def edit
        # Check if the logged-in student is authorized before rendering the view
        check_authroization

        # Render 'edit' view and send it @student found by id
        @student
    end

    def update
        # Update the student record with the information form the submitted 'edit' form
        if @student.update(student_params)
            # If the update was successfull and saved in the DB, redirect to the student 'show'
            redirect_to @student
        else
            # In case the update operation wasn't successful, render the 'edit' form again
            render :edit
        end
    end

    def destroy
        # Delete the student found by ID from the DB
        @student.delete

        # After the delete redirect to the 'index' view
        redirect_to students_path
    end

    # Renders a view where a student can add/remove skills from their profile
    def skills
        # Check if the logged-in student is authorized before rendering the view
        check_authroization

        # Find a student's selected skills
        @selected_skills = @student.skills
        # Find all skills that aren't selected by the student
        @unselected_skills = Skill.unselected_by(@student)
    end

    def remove_skill
        # Check if the logged-in student is authorized before rendering the view
        check_authroization
        
        puts @student.skills.find(params[:skill_id]).delete
    end

    private
        def find_student
            # Find student by id from the params
            @student = Student.find(params[:id])
        end

        def student_params
            # Select which parameters of the student model are permitted to be changed
            params.require(:student).permit(:first_name, :last_name, :img)
        end

        def check_authroization
            # If a logged-in student go to a route that they don't have an autherization for, 
            # they will be redirected to the root path and dispalyed flah message 'Not Authorized!'
            if current_student != @student
                flash[:notice] = 'Not Authorized!'
                redirect_to root_path
            end
        end
end
