function get_run_case_id(elem) {
  var id = elem.closest(".run_case_row").data("id");
  return id;
}

$("#run_cases_table").delegate(".delete", "click", function(event){
  event.preventDefault();
  var id = get_run_case_id($(this));
  console.log(id);
  var run_id = $(this).closest(".run_case_row").data("run_id");
  var delete_url = run_id + "/run_cases/" + id;
  $.ajax({
    type: "DELETE",
    url: delete_url
  });
  $(this).closest('.run_case_row').remove();
});

