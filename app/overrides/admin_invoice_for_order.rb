Deface::Override.new(virtual_path: "spree/admin/orders/_line_items",
                     name: "add_admin_invoice_view_for_order",
                     insert_after: "[data-hook='line_items']",
                     text:
'
<% if order.invoice? %>
  <h4>Invoice details</h4>
  <p>company_name: <%=order.company_name%></p>
  <p>nsn: <%=order.nsn%></p>
  <p>tax_registry_number: <%= order.tax_registry_number %></p>
  <p>address: <%=order.address%></p>
  <p>city: <%=order.city%></p>
<% end %>
')
