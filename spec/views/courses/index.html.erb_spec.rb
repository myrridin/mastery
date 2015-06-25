require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :section => "",
        :number => "",
        :name => "",
        :description => "",
        :length => "",
        :user => nil
      ),
      Course.create!(
        :section => "",
        :number => "",
        :name => "",
        :description => "",
        :length => "",
        :user => nil
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
