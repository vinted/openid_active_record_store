class CreateOpenidNonces < ActiveRecord::Migration

  def self.up
    create_table :openid_nonces do |t|
      t.integer   :timestamp
      t.string    :salt
      t.string    :target, :size => 32
      t.text      :server_url
      t.timestamps
    end
  end

  def self.down
    drop_table :openid_nonces
  end

end
