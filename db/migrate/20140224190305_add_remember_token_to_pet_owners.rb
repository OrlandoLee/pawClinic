class AddRememberTokenToPetOwners < ActiveRecord::Migration
  def change
    add_column :pet_owners, :remember_token, :string
  end
end
