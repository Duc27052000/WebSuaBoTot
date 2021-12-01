var common = {
    init: function () {
        common.registerEvent();
    },
    registerEvent: function () {
        $("#woocommerce-product-search-field-0").autocomplete({
            minLength: 0,
            source: function (request, response) {
                $.ajax({
                    url: "/Product/ListName",
                    dataType: "json",
                    data: {
                        q: request.term
                    },
                    success: function (res) {
                        response(res.data);
                    }
                });
            },
            focus: function (event, ui) {
                $("#woocommerce-product-search-field-0").val(ui.item.label);
                return false;
            },
            select: function (event, ui) {
                $("#woocommerce-product-search-field-0").val(ui.item.label);
                return false;
            }
        })
            .autocomplete("instance")._renderItem = function (ul, item) {
                return $("<li>")
                    .append("<a>" + item.label + "</a>")
                    .appendTo(ul);
            };
    }
}
common.init();