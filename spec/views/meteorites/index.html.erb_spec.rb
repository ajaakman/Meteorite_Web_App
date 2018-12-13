require 'rails_helper'

RSpec.describe "meteorites/index", type: :view do
  before(:each) do
    assign(:meteorites, [
      Meteorite.create!(
        :name => "Name",
        :class => "Class",
        :mass => 2.5,
        :year => 3,
        :latitude => 4.5,
        :longitude => 5.5
      ),
      Meteorite.create!(
        :name => "Name",
        :class => "Class",
        :mass => 2.5,
        :year => 3,
        :latitude => 4.5,
        :longitude => 5.5
      )
    ])
  end

  it "renders a list of meteorites" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Class".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
  end
end
