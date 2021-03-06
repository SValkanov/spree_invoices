Spree::OrdersController.class_eval do
  def update
    redirect_to '/account/invoices' if ( params[:invoice] && !spree_current_user )
    if @order.contents.update_cart(order_params)
      if @order.invoice? && spree_current_user
        @invoice = Invoice.where(user: spree_current_user).first_or_initialize
        @invoice.company_name = @order.company_name
        @invoice.address = @order.address
        @invoice.city = @order.city
        @invoice.nsn = @order.nsn
        @invoice.tax_registry_number = @order.tax_registry_number
        @invoice.mol = @order.mol
        @invoice.save
      end
      respond_with(@order) do |format|
        format.html do
          if params.has_key?(:checkout)
            @order.next if @order.cart?
            redirect_to checkout_state_path(@order.checkout_steps.first)
          else
            redirect_to cart_path
          end
        end
      end
    else
      respond_with(@order)
    end
  end

  def edit
    @order = current_order || Spree::Order.incomplete.
                            includes(line_items: [variant: [:images, :option_values, :product]]).
                            find_or_initialize_by(guest_token: cookies.signed[:guest_token])
    associate_user
    @invoice = Invoice.where(user: spree_current_user).first_or_initialize
    @order.company_name = @invoice.company_name
    @order.address = @invoice.address
    @order.city = @invoice.city
    @order.mol = @invoice.mol
    @order.nsn = @invoice.nsn
    @order.tax_registry_number = @invoice.tax_registry_number
  end
  private

  def order_params
    if params[:order]
      params[:order].permit(*permitted_order_attributes, :invoice, :company_name, :nsn, :address, :city, :tax_registry_number, :mol)
    else
      {}
    end
  end
end
