function get_run_step_id(elem) {
  var id = elem.closest(".run_step_row").data("id");
  return id;
}

$("#run_steps_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  var id = get_run_step_id($(this));
  var case_id = $(this).closest(".run_step_row").data("run_case_id");
  var delete_url = case_id + "/run_steps/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.run_step_row').remove();
});

