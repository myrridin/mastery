require 'rails_helper'

RSpec.describe "scheduled_courses/index", type: :view do
  before(:each) do
    assign(:scheduled_courses, [
      ScheduledCourse.create!(
        :course => "",
        :size => "",
        :scheduled_on => "",
        :location => "",
        :user => nil
      ),
      ScheduledCourse.create!(
        :course => "",
        :size => "",
        :scheduled_on => "",
        :location => "",
        :user => nil
      )
    ])
  end

  it "renders a list of scheduled_courses" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
