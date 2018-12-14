require 'rails_helper'

RSpec.describe "cart/cart.html.erb", type: :view do
  it "renders cart text" do
    render
    expect(rendered).to match("Your Orders")
  end
end
