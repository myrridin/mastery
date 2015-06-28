require 'rails_helper'

RSpec.describe "offerings/index", type: :view do
  before(:each) do
    assign(:offerings, [
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

  it "renders a list of offerings" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
