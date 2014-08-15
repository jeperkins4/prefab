$ ->
  $("#<%= file_name.pluralize %>").dataTable
    sDom: "<'row'<'col-md-7'l><'col-md-5'f>r>t<'row'<'col-md-7'i><'col-md-5'p>>"
    sPaginationType: "bootstrap"
    bAutoWidth: false
    bProcessing: true
    bServerSide: true
    sAjaxSource: $("#<%= file_name.pluralize %>").data('source')
