require 'rails_helper'

RSpec.describe "meteorites/show", type: :view do
  before(:each) do
    @meteorite = assign(:meteorite, Meteorite.create!(
      :name => "Name",
      :meteorite_class => "Class",
      :mass => 2.5,
      :year => 3,
      :latitude => 4.5,
      :longitude => 5.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Class/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
  end
end
