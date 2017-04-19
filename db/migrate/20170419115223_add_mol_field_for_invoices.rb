class AddMolFieldForInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :mol, :string, null: false, default: ''
    add_column :spree_orders, :mol, :string, default: ''    
  end
end
