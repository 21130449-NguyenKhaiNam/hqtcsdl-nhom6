const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const updateBtn = $('.btn-up-cus');
const saveChangedBtn =$('.ad_func-save-btn');
const banBtn =$('.btn-ban-cus');
const modalOverlay =$('.modal__overlay');
const yesBanBtn =$('.yes-confirm');
const cancelBanBtn =$('.no-confirm');
const sendPwdBtn =$('.btn-pwd-cus');

updateBtn.addEventListener('click',getInfo);
saveChangedBtn.addEventListener('click',saveChanged);
banBtn.addEventListener('click',confirmBan);
yesBanBtn.addEventListener('click',yesBan);
modalOverlay.addEventListener('click',noBan);
cancelBanBtn.addEventListener('click',noBan);
sendPwdBtn.addEventListener('click',sendPwd);


function getInfo() {
    const nameInput = $('#cus-name').value = $('.cus_name').innerText;
    const kindInput = $('#cus-kind').value = $('.cus_kind').innerText;
    const phoneInput = $('#cus-phone').value = $('.cus_phone').innerText;
    const emailInput = $('#cus-email').value = $('.cus_email').innerText;
    const addressInput = $('#cus-address').value = $('.cus_address').innerText;

    $('.ad_func-save-btn').classList.add('active');
}

function saveChanged() {
    const name = $('.cus_name').innerText =$('#cus-name').value;
    const kind = $('.cus_kind').innerText = $('#cus-kind').value;
    const phone = $('.cus_phone').innerText = $('#cus-phone').value;
    const email = $('.cus_email').innerText = $('#cus-email').value;
    const address = $('.cus_address').innerText = $('#cus-address').value;

    const nameInput = $('#cus-name').value ="";
    const kindInput = $('#cus-kind').value = "";
    const phoneInput = $('#cus-phone').value = "";
    const emailInput = $('#cus-email').value = "";
    const addressInput = $('#cus-address').value = "";

    $('.ad_func-save-btn').classList.remove('active');
}

function  init() {
    if($('.disabled-showing').classList.contains('active')){
        $('.btn-up-cus').style.display='none';
        $('.btn-ban-cus').style.display='none';
        $('.btn-pwd-cus').style.display='none';
    }
}

function confirmBan() {
    $('.confirm-ban').classList.add('active')
}

function noBan() {
    $('.confirm-ban').classList.remove('active');
}

function yesBan() {
    $('.confirm-ban').classList.remove('active');
    $('.disabled-showing').classList.add('active');
    init();
}

function sendPwd() {
    alert("Đã gửi mật khẩu tới email " + $('.cus_email').innerText);
}
