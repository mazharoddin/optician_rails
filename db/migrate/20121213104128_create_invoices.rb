class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.timestamp :date
      t.references :patient, :limit => 80
      t.string :name, :limit => 255
      t.string :address, :limit => 255
      t.string :city, :limit => 80
      t.string :state, :limit => 10
      t.string :postal_code, :limit => 20
      t.string :country, :limit => 60
      t.decimal :total
      t.decimal :paid
      t.decimal :balance

      t.timestamps
    end
    add_index :invoices, :patient_id
  end
end
