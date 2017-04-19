class Invoice < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class.to_s

  validates_presence_of :company_name, :address, :city, :mol, :nsn, :tax_registry_number

  validates_length_of :company_name, minimum: 2, maximum: 30
  validates_length_of :address, minimum: 4, maximum: 100
  validates_length_of :city, minimum: 2, maximum: 15
  validates_length_of :mol, minimum: 2, maximum: 30
  validates_length_of :nsn, minimum: 9, maximum: 15
  validates_length_of :tax_registry_number, minimum: 9, maximum: 11
end
