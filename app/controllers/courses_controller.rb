class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create

    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: "Yeah the course was created."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "Updated like a fresh coat of paint."
    else
      render :new
    end
  end

  def show

  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "Course was deleted my good sir"
  end

private

def set_course
  @course = Course.find(params[:id])
end

def course_params
  params.require(:course).permit(:title, :tod)
end

end
