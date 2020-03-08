let nav01 = document.getElementById("nav01");
let nav02 = document.getElementById("nav02");
let nav03 = document.getElementById("nav03");
let nav04 = document.getElementById("nav04");
let timeObj = document.getElementById("time");

$("#personal-info").hide();
$("#request-card").hide();
clockDisplay();
nav01.addEventListener('click', function(){


    $("#personal-info").hide();
    $("#request-card").hide();
    $("#welcome-page").show();

})

nav02.addEventListener('click', function(){
	$("#personal-info").hide();
    $("#welcome-page").hide();
    $("#request-card").show();

})

nav03.addEventListener('click', function(){

	$("#personal-info").hide();
    $("#welcome-page").hide();
    $("#request-card").hide();

})

nav04.addEventListener('click', function(){

   
    $("#welcome-page").hide();
    $("#request-card").hide();
    $("#personal-info").show();
    

})

//Welcome page


function addZero(t) {
    if (t < 10) {
      t = "0" + t;
    }
    return t;
  }
function clockDisplay(){ 
    let d = new Date();
    let hours = d.getHours();
    if(hours >12){
    	hours = hours -12;
    }
    hours = addZero(hours);
    let minutes = addZero(d.getMinutes());
    let seconds = addZero(d.getSeconds());
   
    timeObj.innerText=`${hours}:${minutes}:${seconds}`;
}
setInterval(clockDisplay,1000);
