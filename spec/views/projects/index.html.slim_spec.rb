require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :name => "Name",
        :slim_html => "MyText",
        :sass => "MyText",
        :coffeescript => "MyText",
        :compliled_html => "MyText",
        :compiled_css => "MyText",
        :compiled_js => "MyText"
      ),
      Project.create!(
        :name => "Name",
        :slim_html => "MyText",
        :sass => "MyText",
        :coffeescript => "MyText",
        :compliled_html => "MyText",
        :compiled_css => "MyText",
        :compiled_js => "MyText"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
