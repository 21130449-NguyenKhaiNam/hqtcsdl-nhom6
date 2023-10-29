
const userInfor = document.querySelector("#user-infor_function");
const userSetting = document.querySelector("#user-setting_function");
const userSettingForm = document.querySelector("#user-setting_form");
const  userInforForm = document.querySelector("#personal-information-form");
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
