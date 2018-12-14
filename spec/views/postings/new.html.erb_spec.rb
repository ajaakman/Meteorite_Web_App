require 'rails_helper'

RSpec.describe "postings/new", type: :view do
  before(:each) do
    assign(:posting, Posting.new(
      :user => nil,
      :meteorite => nil,
      :weight => 1.5,
      :cost => 1
    ))
  end

  it "renders new posting form" do
    render

    assert_select "form[action=?][method=?]", postings_path, "post" do

      assert_select "input[name=?]", "posting[user_id]"

      assert_select "input[name=?]", "posting[meteorite_id]"

      assert_select "input[name=?]", "posting[weight]"

      assert_select "input[name=?]", "posting[cost]"
    end
  end
end
