$(document).ready(function() {
  var request_data = function(url, dad_id, children_id) {
    $.ajax({
        url: url, // this will be routed
        type: 'GET',
        data: {
          university_id: $(dad_id).val(),
          college_id: $(dad_id).val(),
        },
        async: true,
        dataType: "json",
        error: function(XMLHttpRequest, errorTextStatus, error){
                  alert("Failed: "+ errorTextStatus+" ;"+error);
              },
        success: function(data){
          // here we iterate the json result
          $(`${children_id} option`).remove();
          $(`#course_select option`).remove();
          $(children_id).append(new Option("", null));
          for(var i in data)
          {
            var id = data[i].id;
            var name = data[i].name;
            $(children_id).append(new Option(name, id));
          }
        }
      });
  }
$('#university_select').click(() => request_data("/colleges.json", "#university_select", "#college_select"));
$('#college_select').click(() => request_data("/courses.json", "#college_select", "#course_select"));
});
/*
$(document).ready(function() {
  $('#college_select').click(function() {
      $.ajax({
          url: "/courses.json", // this will be routed
          type: 'GET',
          data: {
            college_id: $("#college_select").val()
          },
          async: true,
          dataType: "json",
          error: function(XMLHttpRequest, errorTextStatus, error){
                    alert("Failed: "+ errorTextStatus+" ;"+error);
                },
          success: function(data){
            // here we iterate the json result
            $("#course_select option").remove();
            for(var i in data)
            {
              var id = data[i].id;
              var name = data[i].name;
              $("#course_select").append(new Option(name, id));
            }
          }
        });
    });
  });
  */