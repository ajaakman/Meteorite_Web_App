require 'rails_helper'

RSpec.describe "meteorites/edit", type: :view do
  before(:each) do
    @meteorite = assign(:meteorite, Meteorite.create!(
      :name => "MyString",
      :meteorite_class => "MyString",
      :mass => 1.5,
      :year => 1,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit meteorite form" do
    render

    assert_select "form[action=?][method=?]", meteorite_path(@meteorite), "post" do

      assert_select "input[name=?]", "meteorite[name]"

      assert_select "input[name=?]", "meteorite[meteorite_class]"

      assert_select "input[name=?]", "meteorite[mass]"

      assert_select "input[name=?]", "meteorite[year]"

      assert_select "input[name=?]", "meteorite[latitude]"

      assert_select "input[name=?]", "meteorite[longitude]"
    end
  end
end
