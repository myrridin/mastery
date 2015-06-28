require 'rails_helper'

RSpec.describe "offerings/edit", type: :view do
  before(:each) do
    @offering = assign(:offering, Offering.create!(
      :course => "",
      :size => "",
      :scheduled_on => "",
      :location => "",
      :user => nil
    ))
  end

  it "renders the edit offering form" do
    render

    assert_select "form[action=?][method=?]", scheduled_course_path(@offering), "post" do

      assert_select "input#scheduled_course_course[name=?]", "offering[course]"

      assert_select "input#scheduled_course_size[name=?]", "offering[size]"

      assert_select "input#scheduled_course_scheduled_on[name=?]", "offering[scheduled_on]"

      assert_select "input#scheduled_course_location[name=?]", "offering[location]"

      assert_select "input#scheduled_course_user_id[name=?]", "offering[user_id]"
    end
  end
end
