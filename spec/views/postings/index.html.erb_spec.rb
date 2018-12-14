require 'rails_helper'

RSpec.describe "postings/index", type: :view do
  before(:each) do
    assign(:postings, [
      Posting.create!(
        :user => nil,
        :meteorite => nil,
        :weight => 2.5,
        :cost => 3
      ),
      Posting.create!(
        :user => nil,
        :meteorite => nil,
        :weight => 2.5,
        :cost => 3
      )
    ])
  end

  it "renders a list of postings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
