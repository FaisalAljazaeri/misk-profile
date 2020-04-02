class StudentsController < ApplicationController
    # Find student by ID and save it in @student, for the actions that require it
    before_action :find_student, only: [:show, :edit, :update]

    def index
        # Render 'index' view and pass it all students
        @students = Student.all
    end

    def show
        # Render 'show' view and send it @student found by id
        @student 
    end

    def edit
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

    def new
        # Render the 'new' view and pass it a new Student object
        @student = Student.new
    end

    def create
        # Create a new Student object using the data submitted by the 'new' form
        @student = Student.new(student_params)

        if @student.save(student_params)
            redirect_to @student
        else
            redirect_to :new
        end
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
end
