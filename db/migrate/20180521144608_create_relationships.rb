class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :follower
      t.references :followed
      

      t.timestamps
    end
  end
end
