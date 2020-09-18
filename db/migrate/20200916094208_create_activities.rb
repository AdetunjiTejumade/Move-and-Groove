class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.text :activity_name
      t.date :date
      t.string :duration
      t.references :user, index: true
      
      t.timestamps
    end
  end
end

#20200916094208