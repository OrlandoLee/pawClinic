class AddPasswordDigestToPetOwners < ActiveRecord::Migration
  def change
    add_column :pet_owners, :password_digest, :string
  end
end
