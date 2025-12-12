// 包裹在$(function(){})中，确保页面DOM加载完成后再执行AJAX请求
$(function() {
  $.ajax({
    url: "GetCatalog",
    dataType: "json",
    async: true,
    data: {},
    type: "POST",
    success: function(data) {
      // 分类信息
      if (data.catalog != null && data.catalog.length > 0) { // 加长度判断，避免空数据渲染
        $.each(data.catalog, function(i, n) {
          $("#catalog-list").append("<li><a href='BookList?catalogId=" + n.catalogId + "'>" + n.catalogName + "(" + n.catalogSize + ")</a></li>");
        });
      }
    }
  });
});