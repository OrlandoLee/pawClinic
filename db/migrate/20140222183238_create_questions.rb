class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :pet_owner_id
      t.string :content
      t.string :category

      t.timestamps
    end
  end
end
