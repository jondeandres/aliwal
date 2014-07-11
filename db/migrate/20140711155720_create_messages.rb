class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :group_id
      t.string :author
      t.text :value

      t.timestamps
    end
  end
end
