require 'rails_helper'

RSpec.describe "home/about.html.erb", type: :view do
  it "renders welcome text" do
    render
    expect(rendered).to match("This app was made by Artur Jaakman for the AWAD individual assessment.")
  end
end
