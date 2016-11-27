
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

  $("#attach_contact").click(function() {
    if( $(this).is(':checked')) {
      $("#status_contact_form").show();
      $("#attached_contact").val('true');
      console.log($("#attached_contact").val());
    } else {
      $("#status_contact_form").hide();
      $("#attached_contact").val('false');
      console.log($("#attached_contact").val());
    }
  })
  $("#status_applied").change(function() {
    var value = $("#status_applied").val();
    console.log(value);
    if(value === 'true') {
      $("#app_date").show();
    }
    else {
      $("#app_date").hide();
    }
  })
  $("#clear").click(function() {
    $("#last_name").val('');
    $("#first_name").val('');
    $("#phone").val('');
    $("#email").val('');
    $("#relationship").val('');
    $("#position").val('');
    $("#linkedIn").val('');
  });
});
