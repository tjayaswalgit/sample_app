require 'spec_helper'

describe "faqs/index" do
  before(:each) do
    assign(:faqs, [
      stub_model(Faq,
        :question => "Question",
        :answer => "MyText",
        :category_id => 1
      ),
      stub_model(Faq,
        :question => "Question",
        :answer => "MyText",
        :category_id => 1
      )
    ])
  end

  it "renders a list of faqs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
