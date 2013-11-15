function get_run_id(elem) {
  var id = elem.closest(".run_row").data("id");
  return id;
}

$("#runs_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  if (confirm("Are you sure?") != true) { return false; }
  var id = get_run_id($(this));
  var delete_url = "runs/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.run_row').remove();
});

$("#new_run_modal").on('show.bs.modal', function () {

  $.get("runs/new", function(data) {
    $("#new_run_modal .modal-body").html(data);
    $("#run_name").focus();
  });

});
