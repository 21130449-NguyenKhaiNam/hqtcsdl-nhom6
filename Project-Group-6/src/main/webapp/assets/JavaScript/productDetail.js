// nhat

function plusQty() {
  const qty = document.querySelector('.product-qty-input');
  let num = parseInt(qty.value);
  num++;
  qty.value = num;
}

function minusQty() {
  const qty = document.querySelector('.product-qty-input');
  let num = parseInt(qty.value);
  if(num > 1) {
    qty.value = num - 1;
  }
  else {
    qty.value = 1;
  }
}


const plusBtn = document.querySelector('.btn-plus-qty');


plusBtn.addEventListener('click', plusQty);


const minusBtn = document.querySelector('.btn-minus-qty');

minusBtn.addEventListener('click', minusQty);
