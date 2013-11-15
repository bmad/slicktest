function get_run_step_id(elem) {
  var id = elem.closest(".run_step_row").data("id");
  return id;
}

$("#run_step_note_modal").on('show.bs.modal', function (e) {

    var case_id = $(e.relatedTarget).data("case_id");
    var step_id = $(e.relatedTarget).data("step_id");
    var get_url = case_id + "/run_steps/" + step_id + "/edit";

     $.get(get_url, function(data) {
       $("#run_step_note_modal .modal-body").html(data);
       $("#step_note").focus();
     });
});

$("#run_steps_table").delegate(".radio input", "change", function(event) {
  event.preventDefault();
  var status = $(this).val();
  var id = get_run_step_id($(this));
  var case_id = $(this).closest(".run_step_row").data("run_case_id");
  var update_url = case_id + "/run_steps/" + id;
  $.ajax({
    type: "PUT",
    url: update_url,
    data: "status=" + status,
    success: function(data) {
      $("#percent_completed").text(data.percent_completed  + "%");
    }
  });
  update_checkbox_color($(this));

});

function update_checkbox_color(elem) {
  var parent_div = elem.closest(".radio");
  parent_div.addClass("checked");
  parent_div.siblings().removeClass("checked");
}
