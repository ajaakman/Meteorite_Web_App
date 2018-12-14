require 'rails_helper'

RSpec.describe "postings/edit", type: :view do
  before(:each) do
    let!(:user){create(:user)}
    let!(:meteorite){create(:meteorite)}
    @posting = assign(:posting, Posting.create!(
      :user => 1,
      :meteorite => 1,
      :weight => 1.5,
      :cost => 1
    ))
  end

  it "renders the edit posting form" do
    render

    assert_select "form[action=?][method=?]", posting_path(@posting), "post" do

      assert_select "input[name=?]", "posting[user_id]"

      assert_select "input[name=?]", "posting[meteorite_id]"

      assert_select "input[name=?]", "posting[weight]"

      assert_select "input[name=?]", "posting[cost]"
    end
  end
end
