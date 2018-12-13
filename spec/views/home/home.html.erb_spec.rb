require 'rails_helper'

RSpec.describe "home/home.html.erb", type: :view do
  it "renders welcome text" do
    render
    expect(rendered).to match("Welcome to Artur's APP")
  end
end
