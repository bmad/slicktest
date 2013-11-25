function get_user_id(elem) {
  var id = elem.closest(".user_row").data("id");
  return id;
}

$("#users_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  if (confirm("Are you sure?") != true) { return false; }

  var id = get_user_id($(this));
  var delete_url = "users/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.user_row').remove();
});

$("#new_user_modal").on('show.bs.modal', function () {

  $.get("users/new", function(data) {
    $("#new_user_modal .modal-body").html(data);
    $("#user_name").focus();
  });

});

