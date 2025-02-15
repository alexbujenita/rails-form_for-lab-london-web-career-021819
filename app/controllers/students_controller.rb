class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
  end

  def create
    @student = Student.create(first_name: params[:student_first_name], last_name: params[:student_last_name])

    redirect_to stud_path(@student)
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(post_params(:first_name, :last_name))

    redirect_to stud_path(@student)
  end

  private

  def post_params(*args)
    params.require(:student).permit(*args)
  end
end
