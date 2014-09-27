class AddXmlDoc2Card < ActiveRecord::Migration
  def change
    add_column :cards, :xml_doc, :text
  end
end
