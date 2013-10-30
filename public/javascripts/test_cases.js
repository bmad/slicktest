function get_case_id(elem) {
  var id = elem.closest(".case_row").data("id");
  return id;
}

$("#cases_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  if (confirm("Are you sure?") != true) { return false; }

  var id = get_case_id($(this));
  var project_id = $(this).closest(".case_row").data("project_id");
  var delete_url = project_id + "/test_cases/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.case_row').remove();
});

$("#new_case_modal").on('show.bs.modal', function () {

  var project_id = $("#new_case_modal_btn").data('project_id');
  var get_url = project_id + "/test_cases/new";

  $.get(get_url, function(data) {
    $("#new_case_modal .modal-body").html(data);
    $("#test_case_name").focus();
  });

});

$("#new_test_case input[type='submit']").click(function(e) {
  e.preventDefault();
  var project_id = $("#new_case_modal_btn").data('project_id');

  $.ajax({
    type: "POST",
    url: project_id + "/test_cases",
    data: $("#new_test_case").serialize(),
    success: function(msg) {
      location.reload();
    },
    error: function(data, status, error) {
      $("#new_case_modal .modal-body").html(data);
    }
  });

});
