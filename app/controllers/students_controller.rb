class StudentsController < ApplicationController
    # Find student by ID and save it in @student, for the actions that require it
    before_action :find_student, only: [:show]

    def index
        # Render 'index' view and pass it all students
        @students = Student.all
    end

    def show
        # Render 'show' view and send it @student found by id
        @student 
    end

    private
        def find_student
            # Find student by id from the params
            @student = Student.find(params[:id])
        end
end
