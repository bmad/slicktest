function get_run_id(elem) {
  var id = elem.closest(".run_row").data("id");
  return id;
}

$("#runs_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  var id = get_run_id($(this));
  var delete_url = "runs/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.run_row').remove();
});

$("#new_run_modal").on('show', function () {

  $.get("runs/new", function(data) {
    $("#new_run_modal .modal-body").html(data);
  });

});

$("#new_project input[type='submit']").click(function(e) {
  e.preventDefault();

  $.ajax({
    type: "POST",
    url: "projects",
    data: $("#new_project").serialize(),
    success: function(msg) {
      location.reload();
    },
    error: function(data, status, error) {
      $("#new_project_modal .modal-body").html(data);
    }
  });

});
