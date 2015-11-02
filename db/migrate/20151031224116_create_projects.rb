class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :slim
      t.text :sass
      t.text :coffee
      t.text :compiled_html
      t.text :compiled_css
      t.text :compiled_js

      t.timestamps null: false
    end
  end
end
