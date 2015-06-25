class ScheduledCoursesController < ApplicationController
  before_action :set_scheduled_course, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_courses
  def index
    @scheduled_courses = ScheduledCourse.all
  end

  # GET /scheduled_courses/1
  def show
  end

  # GET /scheduled_courses/new
  def new
    @scheduled_course = ScheduledCourse.new
  end

  # GET /scheduled_courses/1/edit
  def edit
  end

  # POST /scheduled_courses
  def create
    @scheduled_course = ScheduledCourse.new(scheduled_course_params)

    if @scheduled_course.save
      redirect_to @scheduled_course, notice: 'Scheduled course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /scheduled_courses/1
  def update
    if @scheduled_course.update(scheduled_course_params)
      redirect_to @scheduled_course, notice: 'Scheduled course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scheduled_courses/1
  def destroy
    @scheduled_course.destroy
    redirect_to scheduled_courses_url, notice: 'Scheduled course was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_course
      @scheduled_course = ScheduledCourse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_course_params
      params.require(:scheduled_course).permit(:course, :size, :scheduled_on, :location, :user_id)
    end
end
