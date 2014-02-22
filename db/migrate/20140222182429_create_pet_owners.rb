class CreatePetOwners < ActiveRecord::Migration
  def change
    drop_table :pet_owners
    create_table :pet_owners do |t|
      t.string :username
      t.string :email
      t.string :pet

      t.timestamps
    end
  end
end
