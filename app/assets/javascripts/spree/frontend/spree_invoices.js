// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'
$(document).ready(function(){
  var checkbox = document.getElementById('order_invoice');
  var comapany_name_label = document.getElementById('order_company_name_label');
  var company_name = document.getElementById('order_company_name');
  var nsn_label = document.getElementById('order_nsn_label');
  var nsn = document.getElementById('order_nsn');
  var address_label = document.getElementById('order_address_label');
  var address = document.getElementById('order_address');
  var city_label = document.getElementById('order_city_label');
  var city = document.getElementById('order_city');
  var tax_number = document.getElementById('order_tax_registry_number')
  var tax_number_label = document.getElementById('order_tax_label');
  var elements = [company_name, nsn, address, city, comapany_name_label, nsn_label, address_label, city_label, tax_number, tax_number_label];
  if (checkbox.checked){
    showInvoiceFields(elements);
  }else{
    hideInvoiceFields(elements);
  }
  checkbox.onchange = function() {
     if(this.checked) {
       showInvoiceFields(elements);
     } else {
       hideInvoiceFields(elements);
     }
  };

  function hideInvoiceFields(elements){
    elements.forEach(function(element) {
      element.style.display = 'none';
    });
  }
  function showInvoiceFields(elements){
    elements.forEach(function(element) {
      element.style.display = 'block';
    });
  }
});
