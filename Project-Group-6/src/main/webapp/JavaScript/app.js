
const userInfor = document.querySelector("#user-infor_function");
const userSetting = document.querySelector("#user-setting_function");
const userSettingForm = document.querySelector("#user-setting_form");
const  userInforForm = document.querySelector("#personal-information-form");

const passwords = document.querySelectorAll("input[type='password']");
const btnChangePassword = document.querySelector("#btn-change_password");

function isValid(){
    try{
    if(passwords[0].value !== '' && passwords[1].value !== '' && passwords[2].value === passwords[1].value){
        btnChangePassword.classList.remove("disabled");
        btnChangePassword.attributes.removeNamedItem("disabled");
        console.log("hello");
    }
    else{
        btnChangePassword.classList.add("disabled");
        btnChangePassword.setAttribute("disabled",'');
    }}
    catch (e) {
        console.log("continue");
    }
}

userInfor.addEventListener("click", function (){
    console.log("run1");
    userSettingForm.classList.add("d-none");
    userInforForm.classList.remove("d-none");
})

userSetting.addEventListener("click", function (){
    console.log("run");
    userInforForm.classList.add("d-none");
    userSettingForm.classList.remove("d-none");

})



for(let i = 0 ; i < passwords.length ; i++) {
    passwords[i].addEventListener("input", function () {
        console.log("runInput");
        isValid();
    })
}