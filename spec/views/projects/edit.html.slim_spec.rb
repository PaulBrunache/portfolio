require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "MyString",
      :slim_html => "MyText",
      :sass => "MyText",
      :coffeescript => "MyText",
      :compliled_html => "MyText",
      :compiled_css => "MyText",
      :compiled_js => "MyText"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "textarea#project_slim_html[name=?]", "project[slim_html]"

      assert_select "textarea#project_sass[name=?]", "project[sass]"

      assert_select "textarea#project_coffeescript[name=?]", "project[coffeescript]"

      assert_select "textarea#project_compliled_html[name=?]", "project[compliled_html]"

      assert_select "textarea#project_compiled_css[name=?]", "project[compiled_css]"

      assert_select "textarea#project_compiled_js[name=?]", "project[compiled_js]"
    end
  end
end
