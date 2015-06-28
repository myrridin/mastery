require 'rails_helper'

RSpec.describe "Offerings/new", type: :view do
  before(:each) do
    assign(:offering, Offering.new(
      :course => "",
      :size => "",
      :scheduled_on => "",
      :location => "",
      :user => nil
    ))
  end

  it "renders new offering form" do
    render

    assert_select "form[action=?][method=?]", scheduled_courses_path, "post" do

      assert_select "input#scheduled_course_course[name=?]", "offering[course]"

      assert_select "input#scheduled_course_size[name=?]", "offering[size]"

      assert_select "input#scheduled_course_scheduled_on[name=?]", "offering[scheduled_on]"

      assert_select "input#scheduled_course_location[name=?]", "offering[location]"

      assert_select "input#scheduled_course_user_id[name=?]", "offering[user_id]"
    end
  end
end
