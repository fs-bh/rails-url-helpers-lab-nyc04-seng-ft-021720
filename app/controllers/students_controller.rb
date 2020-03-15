class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def activate
    toggle_activation(set_student)
    redirect_to action: 'show', id: params[:id]
  end


  private

    def set_student
      @student = Student.find(params[:id])
    end

    def toggle_activation(student)
      student.toggle(:active).save
    end
end