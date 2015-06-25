require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :section => "",
      :number => "",
      :name => "",
      :description => "",
      :length => "",
      :user => nil
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input#course_section[name=?]", "course[section]"

      assert_select "input#course_number[name=?]", "course[number]"

      assert_select "input#course_name[name=?]", "course[name]"

      assert_select "input#course_description[name=?]", "course[description]"

      assert_select "input#course_length[name=?]", "course[length]"

      assert_select "input#course_user_id[name=?]", "course[user_id]"
    end
  end
end
