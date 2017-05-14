class CreateMonologues < ActiveRecord::Migration
  def change
    create_table :monologues do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
