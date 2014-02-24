class AddIndexToPetOwnersEmail < ActiveRecord::Migration
  def change
    add_index :pet_owners, :email, unique: true
  end
end
