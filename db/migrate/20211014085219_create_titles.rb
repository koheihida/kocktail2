class CreateTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.references :keyword          ,   null: false, foreign_key: true
      t.integer    :decoration_id
      t.timestamps
    end
  end
end
