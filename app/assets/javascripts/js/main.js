$(document).ready(function(){


WebFontConfig = {
  google: { families: [ 'Lato:300i,400,400i,700,700i,900,900i', 'Open+Sans:300,300i,400,400i,600,600i,700,700i' ] } };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') + '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();
  

 var forEach=function(t,o,r){if("[object Object]"===Object.prototype.toString.call(t))for(var c in t)Object.prototype.hasOwnProperty.call(t,c)&&o.call(r,t[c],c,t);else for(var e=0,l=t.length;l>e;e++)o.call(r,t[e],e,t)};
 var $burguer = document.getElementById('burguer');
 var $menu = document.getElementById('menu');
 var links = document.querySelectorAll(".item-link");
 
 function toggleMenu(){
    $menu.classList.toggle('active');
    $burguer.classList.toggle('is-active');
 };
 
$burguer.addEventListener('click',toggleMenu);
 
if (links.length > 0) {
  forEach(links, function(link) {
    link.addEventListener("click", toggleMenu);
  });
};

$(".single-item").slick({
  dots: true,
  arrows: false,
  fade: true,
  autoplay: true,
  autoplaySpeed: 3000,
  adaptiveHeight: true,
  adaptiveWidth: true,
  centerMode: true,
  infinite: true,
  speed: 2200,
  cssEase: 'linear',
  centerPadding:false,
});


$('.carousel').flickity({
  autoPlay: 1000,
  prevNextButtons: false,
  pageDots: true,
  wrapAround: false,
  setGallerySize: false,
  percentPosition: false,  
  pauseAutoPlayOnHover: false,
});





});

