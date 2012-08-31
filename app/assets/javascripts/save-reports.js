$(document).ready(
     function(){
          $("a#reports-navlist").bind("ajax:success",
                   function(evt, data, status, xhr){
                        $("div#report-html-content").html(data);
           }).bind("ajax:error", function(evt, data, status, xhr){
                    //do something with the error here
                    $("div#errors p").text(data);
           });
});

  $(function () {
    $('#reports-navlist a:last').tab('show');
  })

