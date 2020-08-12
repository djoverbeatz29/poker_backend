class RemoveDefaultFromPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:players, :password_digest, nil)
  end
end
