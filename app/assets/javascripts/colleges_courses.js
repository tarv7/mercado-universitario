/*
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
  // $('#university_select').click(() => request_data("/colleges.json", "#university_select", "#college_select"));
  // $('#college_select').click(() => request_data("/courses.json", "#college_select", "#course_select"));
});
*/

function request_data(url, dad_id, children_id) {
  $.ajax({
      url: url, // this will be routed
      type: 'GET',
      data: {
        university_id: $(dad_id).val(),
        college_id: $(dad_id).val(),
      },
      async: true,
      dataType: "json",
      error: console.log('erro ao buscar dado'),
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