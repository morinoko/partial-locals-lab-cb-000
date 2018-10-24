class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    if params[:search_query]
      @students = Student.all.search(params[:search_query])
      render 'index'
    else
      @students = Student.all
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end

end
