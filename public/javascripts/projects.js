function get_project_id(elem) {
  var id = elem.closest(".project_row").data("id");
  return id;
}

$("#projects_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  var id = get_project_id($(this));
  var delete_url = "projects/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.project_row').remove();
});

$("#new_project_modal").on('show', function () {

  $.get("projects/new", function(data) {
    $("#new_project_modal .modal-body").html(data);
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
