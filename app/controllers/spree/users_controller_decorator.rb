Spree::UsersController.class_eval do
  skip_before_action :set_current_order, only: :show
  prepend_before_action :load_object, only: [:show, :edit, :update]
  prepend_before_action :authorize_actions, only: [:new]
  before_filter :require_auth, only: [:orders, :invoices, :addresses]

  def invoices
    @invoice = Invoice.where(user: spree_current_user).first_or_initialize
    if params.include?(:invoice)
      @invoice.update_attributes(invoice_params)
      if @invoice.save
        redirect_to '/account/invoices', notice: Spree.t('invoice_updated')
      end
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:invoice, :company_name, :nsn, :address, :city, :tax_registry_number, :mol)
  end
end
