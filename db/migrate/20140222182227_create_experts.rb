class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :username
      t.integer :level
      t.integer :question_answered
      t.string :email

      t.timestamps
    end
  end
end
