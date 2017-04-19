Spree::Order.class_eval do
  validates_presence_of :company_name, :address, :city, :mol, :nsn, :tax_registry_number, if: :invoice?

  validates_length_of :company_name, minimum: 2, maximum: 30, if: :invoice?
  validates_length_of :address, minimum: 4, maximum: 100, if: :invoice?
  validates_length_of :city, minimum: 2, maximum: 15, if: :invoice?
  validates_length_of :mol, minimum: 2, maximum: 30, if: :invoice?
  validates_length_of :nsn, minimum: 9, maximum: 15, if: :invoice?
  validates_length_of :tax_registry_number, minimum: 9, maximum: 11, if: :invoice?
end
