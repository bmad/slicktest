function get_project_id(elem) {
  var id = elem.closest(".project_row").data("id");
  return id;
}

$("#projects_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  if (confirm("Are you sure?") != true) { return false; }

  var id = get_project_id($(this));
  var delete_url = "projects/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.project_row').remove();
});

$("#new_project_modal").on('show.bs.modal', function () {

  $.get("projects/new", function(data) {
    $("#new_project_modal .modal-body").html(data);
    $("#project_name").focus();
  });

});

