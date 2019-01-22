require "#{Dir.pwd}/ruby_test/common"

# http://railsdoc.com/references/create_table
class CreateHeadlines < ActiveRecord::Migration[5.2]
  create_table :headlines do |t|
    t.column :title, :text
    t.column :label, :string
    t.timestamps
  end
end
