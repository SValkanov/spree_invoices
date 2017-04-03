class AddInvoiceTable < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :user, index: true
      t.string :company_name, null: false, default: ''
      t.string :nsn, default: ''
      t.string :tax_registry_number, default: ''
      t.string :address, null: false, default: ''
      t.string :city, null: false, default: ''
      t.timestamps null: false
    end
    add_column :spree_orders, :invoice, :boolean, default: false
    add_column :spree_orders, :company_name, :string, default: ''
    add_column :spree_orders, :tax_registry_number, :string, default: ''
    add_column :spree_orders, :address, :string, default: ''
    add_column :spree_orders, :city, :string, default: ''
    add_column :spree_orders, :nsn, :string, default: ''
  end
end
