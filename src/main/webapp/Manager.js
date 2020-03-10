let nav01 =document.getElementById("nav01");
let nav02 =document.getElementById("nav02");
let nav03 =document.getElementById("nav03");
let nav04 =document.getElementById("nav04");
let timeObj = document.getElementById("time");
clockDisplay();

nav01.addEventListener('click', ()=>{
	console.log("nav01 click");
	$("#welcome-page").show();
})


nav02.addEventListener('click', ()=>{
	console.log("nav02 click");
	$("#welcome-page").hide();
})


nav03.addEventListener('click', ()=>{
	console.log("nav03 click");
	$("#welcome-page").hide();
})


nav04.addEventListener('click', ()=>{
	console.log("nav04 click");
	$("#welcome-page").hide();
})


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