require 'rails_helper'

RSpec.describe "ScheduledCourses", type: :request do
  describe "GET /offerings" do
    it "works! (now write some real specs)" do
      get scheduled_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
