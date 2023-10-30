// nhat

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);


const sliders = $$(".sliderbar-item");
const slideLeft = $(".slidebar_move-left");
const slideRight = $(".slidebar_move-right");

initSlider();

function initSlider() {
  const indicatior = $(".slidebar_indicator-list");
  var html;
  if(sliders.length===1){
    html = `
    <li class="slidebar_indicator-item active"><i class="fa-solid fa-circle"></i></li>
    `
  } else {
    html = `
    <li class="slidebar_indicator-item active"><i class="fa-solid fa-circle"></i></li>
    `
    for(let i=1; i< sliders.length;i++){
      html += `
    <li class="slidebar_indicator-item"><i class="fa-solid fa-circle"></i></li>
    `
    }
  }
  indicatior.innerHTML=html;
  const showSliders = $$(".slidebar_indicator-item");

  slideLeft.onclick = function () {
    changeSliderToLeft(sliders, showSliders);
  }
  slideRight.onclick = function () {
    changeSliderToRight(sliders, showSliders);
  }


}






function changeSliderToRight(sliders, showSliders) {

  var index;
  var len = sliders.length;
  for (var i= 0; i < len; i++) {
    if(sliders[i].classList.contains('active')) {
      index = i;
      break;
    }
  }
  sliders[index].classList.remove('active');
  showSliders[index].classList.remove('active');
  if(index === (len-1)){
    index = 0;
    sliders[index].classList.add('active');
    showSliders[index].classList.add('active');

  } else {
    sliders[++index].classList.add('active');
    showSliders[index].classList.add('active');

  }


}

function changeSliderToLeft(sliders, showSliders) {
  var index;
  var len = sliders.length;
  for (var i= 0; i < len; i++) {
    if(sliders[i].classList.contains('active')) {
      index = i;
      break;
    }
  }
  sliders[index].classList.remove('active');
  showSliders[index].classList.remove('active');

  if(index === 0){
    index = len-1;
    sliders[index].classList.add('active');
    showSliders[index].classList.add('active');

  } else {
    sliders[--index].classList.add('active');
    showSliders[index].classList.add('active');

  }


}
