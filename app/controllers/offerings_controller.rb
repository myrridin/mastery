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

  def create
    @offering = Offering.new(scheduled_course_params)

    if @offering.save
      redirect_to @offering, notice: 'Scheduled course was successfully created.'
    else
      render :new
    end
  end

  # Main user dashboard
  def dashboard
    @offerings = {
        signed_up: current_user.signed_up_for,
        starting_soon: Offering.available.order(:scheduled_at).limit(5)
    }
  end

  private
    def set_scheduled_course
      @offering = Offering.find(params[:id])
    end

    def scheduled_course_params
      params.require(:offering).permit(:course, :size, :scheduled_at, :location, :user_id)
    end
end
