$(document).ready(function(){

  var first_rows = $('#active-shrimps tbody tr');

  function sortTable(){

    var rows = first_rows.get();

    rows.sort(function(a, b) {

      var A = parseInt($(a).children('td').eq(2).text());
      var B = parseInt($(b).children('td').eq(2).text());

      if(A < B) {
        return 1;
      }

      if (A > B) {
        return -1;
      }

      return 0;
    });

    $.each(rows, function(index, row) {
      $('#active-shrimps').children('tbody').append(row);
    });
  }

  $("#sort").click(function(){
    if ($('#sort').prop('checked')) {
      sortTable();
    } else {
     $('#active-shrimps').children('tbody').append(first_rows);
    }
  });
});
