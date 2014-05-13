$(window).load(function() {
  Gallery.loadIsotope();
  Gallery.albumListWatchers();
});

Gallery = {

  loadIsotope: function() {
    var $container = $('.photo-gallery');

    $container.isotope({
      //containerClass: 'gallery',
      containerStyle: 'position: static;',
      filter: '*',
      itemSelector: '.photo',
      layoutMode : 'masonry',
      masonry: {
        columnWidth: 256
      },
      resizeable: true,
      resizesContainer: true
    });

    $('#filters a').click(function(){
      var selector = $(this).attr('data-filter');
      $container.isotope({ filter: selector });
      //$container.isotope('reloadItems').isotope();
      return false;
    });
//
//    $container.find('.photo').hover(
//      function() {
//        $(this).css({ height: "+=100" });
//        // note that element is passed in, not jQuery object
//        $container.isotope( 'shiftColumnOfItem', this );
//      },
//      function() {
//        $(this).css({ height: "-=100" });
//        $container.isotope( 'shiftColumnOfItem', this );
//      }
//    );
  },

  albumListWatchers: function() {
    albumItems = '.album-all-item a, .album-list-item a';

    $(albumItems).click(function() {
      $(albumItems).parent().removeClass('active');
      if($(this).parent().hasClass('album-list-item')){
        $(this).parent().addClass('active');
      }
    })
  }
}
