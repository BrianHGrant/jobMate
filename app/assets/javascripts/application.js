
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require highcharts
//= require chartkick

$(document).on('turbolinks:load', function() {
  $("#paginator a").on("click", function() {
    $.getScript(this.href);
    return false;
  });

  $("#job-search").keyup(function() {
    $.get($("#job-search").attr("action"), $("#job_search").serialize(), null, "script");
    return false;
    event.preventDefault();
  });

  $("#compare").click(function() {
    $(".job-scan").show();
    $("#hide-compare").show();
    $("#compare").hide();
  })
  $("#hide-compare").click(function() {
    $(".job-scan").hide();
    $("#hide-compare").hide();
    $("#compare").show();
  })

  $(".event-contact").click(function() {
    $("#event_contact_select").show();
    $("#event_job_select").hide();
  })
  $(".event-job").click(function() {
    $("#event_job_select").show();
    $("#event_contact_select").hide();
  })
});
