class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :invoice_number
      t.float :current_due
      t.float :past_due
      t.float :total_due
      t.date :due_date
      t.references :account, index: true

      t.timestamps
    end
  end
end
