// Call the dataTables jQuery plugin
$( document ).on('turbolinks:load', function() {
  $('#dataTable').DataTable(
      {
        "lengthChange": false

});
});
