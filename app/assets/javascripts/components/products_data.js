$(document).ready(function() {
  var $warehouseProdcutsPath = "/warehouse/:warehouse_id/products";
  var $warehouseField = $("#order_warehouse_id");
  var $productsField = $("#order_product_id");

  $warehouseField.on('change', function() {
    $.ajax({
      url: $warehouseProdcutsPath.replace(":warehouse_id", $warehouseField.val()),
      type: "GET",
      success: function(data) {
        $productsField.empty();
        $.each(data, function(index,product) {
          $productsField.append($("<option></option>")
             .attr("value", product["id"]).text(product["title"]));
        });
      }
    })
  });
});
