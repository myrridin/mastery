class OfferingsController < ApplicationController

  before_filter :set_offering, only: [:show, :sign_up, :drop, :destroy]

  def index
    @offerings = Offering.where("scheduled_at >= ?", Time.now).order(:scheduled_at).paginate(page: params[:page], per_page: 10)
  end

  def new
    @offering = Offering.new
  end

  def show
  end

  def sign_up
    @offering = Offering.find params[:id]

    if @offering.signed_up == @offering.size
      redirect_to :back, alert: "Sorry, but that class appears to be full."
      return
    end

    if current_user.signed_up_for? @offering
      redirect_to :back, alert: "You're already signed up for that course."
      return
    end

    if current_user.sign_up_for(@offering)
      redirect_to :back, notice: "You have successfully signed up for this class."
    else
      redirect_to :back, alert: "There was an error signing up for that class. Please try again."
    end
  end

  def drop
    if current_user.signed_up_for? @offering
      current_user.drop_offering @offering
      redirect_to :back, notice: "You have successfully dropped this class."
    else
      redirect_to :back, alert: "You were not signed up for that class."
    end
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

  # TODO Should only be able to destroy if admin probably
  def destroy
    if @offering.destroy
      redirect_to offerings_path, notice: "Class was successfully deleted."
    else
      redirect_to offerings_path, alert: "Could not delete class. Please try again."
    end
  end

  private
    def set_offering
      @offering = Offering.find params[:id]
    end

    def scheduled_course_params
      params.require(:offering).permit(:course_id, :size, :scheduled_at, :location)
    end
end
