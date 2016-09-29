
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $("#paginator a").on("click", function() {
    $.getScript(this.href);
    return false;
  });

  $("#job-search").keyup(function() {
    $.get($("#job-search").attr("action"), $("#job_search").serialize(), null, "script");
    return false;
  });
});
