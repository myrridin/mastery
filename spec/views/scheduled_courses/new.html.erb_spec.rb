require 'rails_helper'

RSpec.describe "scheduled_courses/new", type: :view do
  before(:each) do
    assign(:scheduled_course, ScheduledCourse.new(
      :course => "",
      :size => "",
      :scheduled_on => "",
      :location => "",
      :user => nil
    ))
  end

  it "renders new scheduled_course form" do
    render

    assert_select "form[action=?][method=?]", scheduled_courses_path, "post" do

      assert_select "input#scheduled_course_course[name=?]", "scheduled_course[course]"

      assert_select "input#scheduled_course_size[name=?]", "scheduled_course[size]"

      assert_select "input#scheduled_course_scheduled_on[name=?]", "scheduled_course[scheduled_on]"

      assert_select "input#scheduled_course_location[name=?]", "scheduled_course[location]"

      assert_select "input#scheduled_course_user_id[name=?]", "scheduled_course[user_id]"
    end
  end
end
