// nhat

function plusQty() {
  const qty = document.querySelector('.product-qty-input');
  let num = parseInt(qty.value);
  num++;
  qty.value = num;
}

function minusQty() {
  // console.log("1");
  const qty = document.querySelector('.product-qty-input');
  let num = parseInt(qty.value);
  num--;
  if(num>=0) {
    qty.value = num;
  }
  else {
    qty.value = 0;
  }
}


const plusBtn = document.querySelector('.btn-plus-qty');


plusBtn.addEventListener('click', plusQty);


const minusBtn = document.querySelector('.btn-minus-qty');

minusBtn.addEventListener('click', minusQty);
