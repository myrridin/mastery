require 'rails_helper'

RSpec.describe "scheduled_courses/edit", type: :view do
  before(:each) do
    @scheduled_course = assign(:scheduled_course, ScheduledCourse.create!(
      :course => "",
      :size => "",
      :scheduled_on => "",
      :location => "",
      :user => nil
    ))
  end

  it "renders the edit scheduled_course form" do
    render

    assert_select "form[action=?][method=?]", scheduled_course_path(@scheduled_course), "post" do

      assert_select "input#scheduled_course_course[name=?]", "scheduled_course[course]"

      assert_select "input#scheduled_course_size[name=?]", "scheduled_course[size]"

      assert_select "input#scheduled_course_scheduled_on[name=?]", "scheduled_course[scheduled_on]"

      assert_select "input#scheduled_course_location[name=?]", "scheduled_course[location]"

      assert_select "input#scheduled_course_user_id[name=?]", "scheduled_course[user_id]"
    end
  end
end
