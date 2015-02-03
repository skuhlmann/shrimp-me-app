$(document).ready(
  function(){
    $('#searchbox').keyup(
      function(){
      var searchText = $(this).val();

       if (searchText.length > 0) {
         $('tbody tr page-title:contains('+searchText+')')
          .addClass('searchResult');
         $('.searchResult')
          .not(':contains('+searchText+')')
          .removeClass('searchResult');

          $('tbody tr')
            .not(':contains('+searchText+')')
            .addClass('hidden');
          $('.hide:contains('+searchText+')')
            .removeClass('hidden');

          $('.hidden').hide();
          $('.searchResult').show();

       }

       else if (searchText.length == 0) {
         $('.searchResult').removeClass('searchResult');
         $('.hidden').removeClass('hidden');
         $('tr').show();
       }
    });
});

