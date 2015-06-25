require 'rails_helper'

RSpec.describe "scheduled_courses/show", type: :view do
  before(:each) do
    @scheduled_course = assign(:scheduled_course, ScheduledCourse.create!(
      :course => "",
      :size => "",
      :scheduled_on => "",
      :location => "",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
