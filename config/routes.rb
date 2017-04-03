Spree::Core::Engine.routes.draw do
  match 'account/invoices' => 'users#invoices', via: [:get, :put]
end
