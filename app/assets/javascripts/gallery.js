$(window).load(function() {
  Gallery.loadIsotope();
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
      resizeable: true,
      resizesContainer: true
    });

    $('#filters a').click(function(){
      var selector = $(this).attr('data-filter');
      $container.isotope({ filter: selector });
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
  }
}
