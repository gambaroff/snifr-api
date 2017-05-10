class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    def change
      create_table :users do |t|
        t.string :name
        t.string :email
        t.st_point :lonlat, geographic: true

        t.timestamps
      end
    end
  end

  def down
    drop_table :users
  end
end
