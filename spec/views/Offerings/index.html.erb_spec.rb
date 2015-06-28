require 'rails_helper'

RSpec.describe "Offerings/index", type: :view do
  before(:each) do
    assign(:Offerings, [
      Offering.create!(
        :course => "",
        :size => "",
        :scheduled_on => "",
        :location => "",
        :user => nil
      ),
      Offering.create!(
        :course => "",
        :size => "",
        :scheduled_on => "",
        :location => "",
        :user => nil
      )
    ])
  end

  it "renders a list of Offerings" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
