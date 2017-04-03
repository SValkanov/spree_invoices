class Invoice < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class.to_s

  validates_presence_of :company_name, :address, :city
  validates_length_of :company_name, minimum: 2, maximum: 30
  validates_length_of :address, minimum: 4, maximum: 100
  validates_length_of :city, minimum: 2, maximum: 15

  validate :presence_of_tax_registry_number_or_nsn

  def presence_of_tax_registry_number_or_nsn
    if !self.tax_registry_number.empty? && !self.nsn.empty?
      errors.add(:tax_registry_number, Spree.t('tax_number_and_nsn_error'))
    else
      unless self.tax_registry_number.empty?
        validates_presence_of :tax_registry_number
        validates_length_of :tax_registry_number, minimum: 2, maximum: 20
      else
        validates_presence_of :nsn
        validates_length_of :nsn, minimum: 1, maximum: 15
      end
    end
  end
end
