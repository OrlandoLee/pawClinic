class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :expert_id
      t.string :content
      t.integer :question_id

      t.timestamps
    end
  end
end
