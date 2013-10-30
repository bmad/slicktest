function get_step_id(elem) {
  var id = elem.closest(".step_row").data("id");
  return id;
}

$("#steps_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  if (confirm("Are you sure?") != true) { return false; }
  var id = get_step_id($(this));
  var project_id = $(this).closest(".step_row").data("project_id");
  var case_id = $(this).closest(".step_row").data("case_id");
  var delete_url = case_id + "/steps/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.step_row').remove();
});

$("#new_step_modal").on('show.bs.modal', function () {

  var project_id = $("#new_step_modal_btn").data('project_id');
  var case_id = $("#new_step_modal_btn").data('case_id');
  var get_url = case_id + "/steps/new";

  $.get(get_url, function(data) {
    $("#new_step_modal .modal-body").html(data);
  });

});

$("#new_step input[type='submit']").click(function(e) {
  e.preventDefault();

  var project_id = $("#new_step_modal_btn").data('project_id');
  var case_id = $("#new_step_modal_btn").data('case_id');
  var new_url = case_id + "/steps";

  $.ajax({
    type: "POST",
    url: new_url,
    data: $("#new_step").serialize(),
    success: function(msg) {
      location.reload();
    },
    error: function(data, status, error) {
      $("#new_step_modal .modal-body").html(data);
    }
  });

});
