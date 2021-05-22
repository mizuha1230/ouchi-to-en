class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.text :activity_content, null: false
      t.string :contact
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
