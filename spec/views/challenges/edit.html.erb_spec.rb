require 'rails_helper'

RSpec.describe "challenges/edit", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!(
      name: "MyString",
      description: "MyText",
      status: 0,
      tasks_attributes: [{
        flag: "MyFlag1",
        question: "MyQuestion1"
      },{
        flag: "MyFlag2",
        question: "MyQuestion2"
      }]
    ))
  end

  it "renders the edit challenge form" do
    render

    assert_select "form[action=?][method=?]", challenge_path(@challenge), "post" do

      assert_select "input[name=?]", "challenge[name]"

      assert_select "textarea[name=?]", "challenge[description]"

      assert_select "select[name=?]", "challenge[status]"
      @challenge.tasks.each_with_index do |task, index|
        assert_select "textarea[name=?]", "challenge[tasks_attributes][#{index}][question]"
        assert_select "input[name=?]", "challenge[tasks_attributes][#{index}][flag]"
      end
    end
  end
end
