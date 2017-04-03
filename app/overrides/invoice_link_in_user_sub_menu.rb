Deface::Override.new(virtual_path: "spree/shared/_user_sub_menu",
                     name: "add_invoice_link",
                     insert_bottom: "[data-hook='user-sub-menu']",
                     text:
                        '
                        <li <%= "class=selected" if params[:action] == "invoices"%>>
                          <%= link_to Spree.t(:invoices), "/account/invoices"%>
                        </li>
                        ')
