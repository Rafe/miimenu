class AddCredientialsToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications , :credentials, :string
  end
end
