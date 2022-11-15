class CreateCunsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :cunsumers do |t|

      t.timestamps
    end
  end
end
