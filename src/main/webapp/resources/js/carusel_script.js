const carouselWidth = $(".carousel-inner")[0].scrollWidth;
let cardWidth = $(".carousel-item").width();
let scrollPosition = 0;
$("#carouselExampleControls .carousel-control-next").on("click", function () {
    if (scrollPosition < carouselWidth - cardWidth * 4) {
        scrollPosition += cardWidth;
        $("#carouselExampleControls .carousel-inner").animate(
            {scrollLeft: scrollPosition},
            600
        );
    }
});
$("#carouselExampleControls .carousel-control-prev").on("click", function () {
    if (scrollPosition > 0) {
        scrollPosition -= cardWidth;
        $("#carouselExampleControls .carousel-inner").animate(
            {scrollLeft: scrollPosition},
            600
        );
    }
});