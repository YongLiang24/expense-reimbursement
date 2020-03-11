let nav01 =document.getElementById("nav01");
let nav02 =document.getElementById("nav02");
let nav03 =document.getElementById("nav03");
let nav04 =document.getElementById("nav04");
let timeObj = document.getElementById("time");
let reimbTable = document.getElementById("reimb-table");
let tableBody = document.getElementById("table-body");
let requestFilter = document.getElementById("request-filter");
let reimbObj;
const reimbURL = "http://localhost:8080/Project01/rest/reim/1";

fetch(reimbURL)
.then((response)=>{
	return response.json();
})
.then((jsonData)=>{
	reimbObj = jsonData;
	displayRequest(reimbObj);
})

$("#reimb-table").hide();
$("#manage-request").hide();
clockDisplay();

requestFilter.addEventListener('click', ()=>{
	
	let radioChoice = $('input[name="resolved"]:checked').val();
		
})


nav01.addEventListener('click', ()=>{
	$("#reimb-table").hide();
	$("#manage-request").hide();
	$("#welcome-page").show();
})


nav02.addEventListener('click', ()=>{
	$("#welcome-page").hide();
	$("#reimb-table").hide();
	$("#manage-request").show();
})


nav03.addEventListener('click', ()=>{
	$("#welcome-page").hide();
	$("#manage-request").hide();
	$("#reimb-table").show();
	
})


nav04.addEventListener('click', ()=>{
	$("#welcome-page").hide();
	$("#reimb-table").hide();
	$("#manage-request").hide();
})


function displayRequest(reimbObj){

	
	for(let reimb of reimbObj){	
		let tableRow = document.createElement("tr");
		let createdBy = document.createElement("td");
		let createdDate = document.createElement("td");
		let expense = document.createElement("td");
		let reimbCost = document.createElement("td");
		let reason = document.createElement("td");
		let status = document.createElement("td");
		createdBy.innerText = reimb.createdBy;
		createdDate.innerText = reimb.dateTime;
		expense.innerText= reimb.expenseCost;
		reimbCost.innerText = reimb.reimbAmount;
		reason.innerText = reimb.expenseDescription;
		status.innerText = reimb.requestStatus;
		
		tableRow.appendChild(createdBy);
		tableRow.appendChild(createdDate);
		tableRow.appendChild(expense);
		tableRow.appendChild(reimbCost);
		tableRow.appendChild(reason);
		tableRow.appendChild(status);	
		tableBody.appendChild(tableRow);
	}
	 
}


//clock display
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
//clock ends