$(window).load(function() {
  Gallery.loadIsotope();
  Gallery.albumListWatchers();
  Gallery.setPreviousAlbum();
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
      pauseOnInteraction: false,
      resizeable: true,
      resizesContainer: true,
      swipe: 'disabled'
    });

    $('#filters a').click(function(){
      var selector = $(this).attr('data-filter');
      $container.isotope({ filter: selector });
      //$container.isotope('reloadItems').isotope();
      return false;
    });
  },

  albumListWatchers: function() {
    albumItems = '.album-all-item a, .album-list-item a';

    $(albumItems).click(function() {
      $(albumItems).parent().removeClass('active');
      if($(this).parent().hasClass('album-list-item')){
        $(this).parent().addClass('active');
        $.post("/set_gallery_session?gallery=" + $(this).attr("data-filter").replace(".", ""));
      } else {
        $.post("/set_gallery_session?gallery=");
      }
    });
  },

  setPreviousAlbum: function() { /*TODO:#only on main gallery page*/
    if(window.location.pathname == "/gallery") {
      var previousGallery = $.get("/get_gallery_session", function(response) {
        prevGallery = response["previousGallery"];
        galleryAlbumClass = "." + prevGallery

        if(prevGallery == "" || prevGallery == "*") {
          $('a[data-filter="*"]').click();
        } else {
          $('a[data-filter=\'' + galleryAlbumClass + '\']').click();
        }
      });
    }
  }
}
