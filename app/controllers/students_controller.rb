class StudentsController < ApplicationController
    # Check if a Student is authenticated before these actions
    before_action :authenticate_student!, only: [:edit, :update, :skills, :remove_skill, :add_skill]
    # Find student by ID and save it in @student, for the actions that require it
    before_action :find_student, only: [:show, :edit, :update, :destroy, :skills, :remove_skill, :add_skill]
    # Check for filters on the Index action and pass students based on filtering criteria
    before_action :select_students, only: [:index]

    def index
        # Render 'index' view and pass it all skills
        @skills = Skill.all

        # Select the students based on any filtering criteria
        @students

        # Pass the selected skills to the view so they can be checked by default
        @selected_skills

        # Pass the selected course ID to the view so it can be selected by default
        @selected_course
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
        @unselected_skills = Skill.all.select { |skill| !@student.skills.include?(skill) }
    end

    def remove_skill
        # Check if the logged-in student is authorized before rendering the view
        check_authroization
        
        @student.skills.delete(Skill.find(params[:skill_id]))
    end

    def add_skill
        # Check if the logged-in student is authorized before rendering the view
        check_authroization

        # Add Skill by ID to the current student
        StudentSkill.create(student_id: @student.id, skill_id: params[:skill_id])
    end

    private
        def find_student
            # Find student by id from the params
            @student = Student.find(params[:id])
        end

        def student_params
            # Select which parameters of the student model are permitted to be changed
            params.require(:student).permit(:first_name, :last_name, :avatar, :summary, :linkedin_link, :github_link)
        end

        def select_students
            # Get the ID of the selected course
            @selected_course = params[:course].to_i

            # If the course ID is 0, that means that "ALL" courses are included
            if @selected_course == 0
                @students = Student.all
            else
                # Select only students who belong to the selected course
                @students = Student.where(course_id: @selected_course).all
            end

            # If there are any selected skills/course, select only the students
            # who have all the selected skills and belong to the specified course
            if params[:skill_ids]
                # Convert all string skill IDs to integers
                @selected_skills = params[:skill_ids].map { |id| id.to_i }
                
                # Select only the students who have all the specified skills from the params
                @students = @students.select do |st|
                    @selected_skills.all? { |skill| st.skills.ids.include?(skill) }
                end
            else
                # If no skills were specified, pass an empty array for skills
                @selected_skills = []
            end
        end

        def check_authroization
            # If a logged-in student go to a route that they don't have an autherization for, 
            # they will be redirected to the root path and dispalyed flah message 'Not Authorized!'
            if current_student != @student
                flash[:alert] = 'Not Authorized!'
                redirect_to root_path
            end
        end
end
