Deface::Override.new(virtual_path: "spree/orders/edit",
                     name: "add_invoice_fields_in_order",
                     insert_before: "[data-hook='cart_buttons']",
                     text:
'
<%= order_form.check_box :invoice %>
<label id="order_invoice_label"><%= Spree.t(:invoice)%></label>
      <% if spree_current_user %>
        <% if spree_current_user.invoice %>
          <%= link_to Spree.t("edit_your_invoice"), "/account/invoices" %>
        <% else %>
          <%= link_to Spree.t("create_invoice"), "/account/invoices" %>
        <% end %>
      <% else %>
        <%= link_to Spree.t("create_invoice"), "/signup" %>
      <% end %>
          <% if spree_current_user && spree_current_user.invoice %>
            <label id="order_company_name_label"><%= Spree.t("company_name") %></label>
            <%= order_form.text_field :company_name, value: @order.company_name %>
            <label id="order_nsn_label"><%= Spree.t("nsn") %></label>
            <%= order_form.text_field :nsn, value: @order.nsn %>
            <label id="order_tax_label"><%= Spree.t("tax_registry_number") %></label>
            <%= order_form.text_field :tax_registry_number, value: @order.tax_registry_number %>
            <label id="order_mol_label"><%= Spree.t("mol") %></label>
            <%= order_form.text_field :mol, value: @order.mol %>
            <label id="order_address_label"><%= Spree.t("address") %></label>
            <%= order_form.text_field :address, value: @order.address %>
            <label id="order_city_label"><%= Spree.t("city") %></label>
            <%= order_form.text_field :city, value: @order.city %>
          <% else %>
            <label id="order_company_name_label"><%= Spree.t("company_name") %></label>
            <%= order_form.text_field :company_name %>
            <label id="order_nsn_label"><%= Spree.t("nsn") %></label>
            <%= order_form.text_field :nsn %>
            <label id="order_tax_label"><%= Spree.t("tax_registry_number") %></label>
            <%= order_form.text_field :tax_registry_number %>
            <label id="order_mol_label"><%= Spree.t("mol") %></label>
            <%= order_form.text_field :mol %>
            <label id="order_address_label"><%= Spree.t("address") %></label>
            <%= order_form.text_field :address %>
            <label id="order_city_label"><%= Spree.t("city") %></label>
            <%= order_form.text_field :city %>
          <% end %>
')
