class AddRememberTokenToExperts < ActiveRecord::Migration
  def change
    add_column :experts, :remember_token, :string
  end
end
