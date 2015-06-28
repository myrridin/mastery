class OfferingsController < ApplicationController
  before_action :set_scheduled_course, only: [:show, :edit, :update, :destroy]

  def index
    @offerings = Offering.all
  end

  def show
  end

  def new
    @offering = Offering.new
  end

  def edit
  end

  def create
    @offering = Offering.new(scheduled_course_params)

    if @offering.save
      redirect_to @offering, notice: 'Scheduled course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @offering.update(scheduled_course_params)
      redirect_to @offering, notice: 'Scheduled course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @offering.destroy
    redirect_to scheduled_courses_url, notice: 'Scheduled course was successfully destroyed.'
  end

  # Main user dashboard
  def dashboard

  end

  private
    def set_scheduled_course
      @offering = Offering.find(params[:id])
    end

    def scheduled_course_params
      params.require(:offering).permit(:course, :size, :scheduled_on, :location, :user_id)
    end
end
