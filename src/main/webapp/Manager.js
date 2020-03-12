let nav01 =document.getElementById("nav01");
let nav02 =document.getElementById("nav02");
let nav03 =document.getElementById("nav03");
let nav04 =document.getElementById("nav04");
let timeObj = document.getElementById("time");
let reimbTable = document.getElementById("reimb-table");
let tableBody = document.getElementById("table-body");
let empTable = document.getElementById("empTable-body");
let requestFilter = document.getElementById("request-filter");
let reimbObj;
let empObj;
let modalBody = document.getElementById("modal_");
const reimbURL = "http://localhost:8081/Project01/rest/reim/1";
const empURL = "http://localhost:8081/Project01/rest/emp/1";
//fetching reimbursement requests details

setTimeout(onStart(), 5000);
setTimeout(onStart(), 2000);

$("#reimb-table").hide();
$("#manage-request").hide();
$("#emp-table").hide();
clockDisplay();

requestFilter.addEventListener('click', ()=>{
	let radioChoice = $('input[name="resolved"]:checked').val();	
	switch(radioChoice){		
		case "approve":
				let obj1 = reimbObj.filter(status =>{
				return status.requestStatus == "accpet"});
			displayRequest(obj1);
			break;
		case "reject":
			let obj2 = reimbObj.filter(status =>{
				return status.requestStatus == "deny"});
			displayRequest(obj2);
			break;
		default:
			break;
	}		
})


nav01.addEventListener('click', ()=>{
	$("#reimb-table").hide();
	$("#manage-request").hide();
	$("#emp-table").hide();
	$("#welcome-page").show();
})


nav02.addEventListener('click', ()=>{
	onStart();
	$("#welcome-page").hide();
	$("#reimb-table").hide();
	$("#emp-table").hide();
	$("#manage-request").show();
})


nav03.addEventListener('click', ()=>{
	onStart();
	$("#welcome-page").hide();
	$("#manage-request").hide();
	$("#emp-table").hide();
	displayRequest(reimbObj);

	$("#reimb-table").show();
	
})


nav04.addEventListener('click', ()=>{
	onStart();
	$("#welcome-page").hide();
	$("#reimb-table").hide();
	$("#manage-request").hide();
	displayEmployee(empObj);
	$("#emp-table").show();
})

function displayEmployee(empObj){
	$("#empTable-body").children().remove();
	for(emp of empObj){
		let tableRow = document.createElement("tr");
		let empId = document.createElement("td");
		let empName = document.createElement("td");
		let empPhone = document.createElement("td");
		let empEmail = document.createElement("td");
		let empAddress = document.createElement("td");
		let empButton = document.createElement("input");
		
		empButton.setAttribute("value","view");
		empButton.setAttribute("title","view my requests");
		empButton.setAttribute("type","button");
		empButton.setAttribute("style","margin-top: 10px;");
		empButton.setAttribute("id",emp.empId);
		empButton.setAttribute("data-toggle","modal");
		empButton.setAttribute("data-target","#view-modal");
		
		empId.innerText= emp.empId;
		empName.innerText= emp.fullName;
		empPhone.innerText = emp.telephone;
		empEmail.innerText = emp.email;
		empAddress.innerText =`${emp.street}, ${emp.city}, ${emp.state}, ${emp.zipcode}, ${emp.country}`;
		tableRow.appendChild(empId);
		tableRow.appendChild(empName);
		tableRow.appendChild(empPhone);
		tableRow.appendChild(empEmail);
		tableRow.appendChild(empAddress);
		tableRow.appendChild(empButton);
		empTable.appendChild(tableRow);	
		
		empButton.addEventListener('click', (ev)=>{
			$("#modal_").children().remove();
			let orderList = document.createElement("ol");
			
			orderList.setAttribute("class","list-group");
			for(reimb of reimbObj.reverse()){			
				if(reimb.empId == ev.target.id){
					let viewLi = document.createElement("li");
					viewLi.setAttribute("title", `Reason: ${reimb.expenseDescription}, Reimburse: $${reimb.reimbAmount}, Type: ${reimb.expenseType}`);
					viewLi.setAttribute("class","list-group-item");
					viewLi.innerText =`CreatedBy: ${reimb.createdBy} | Date: ${reimb.dateTime} | Expense: $${reimb.expenseCost} | Status: ${reimb.requestStatus}`;				
					orderList.appendChild(viewLi);				
					modal_.appendChild(orderList);				
				}
			}
		})
		

	}
}



function displayRequest(reimbObj){	
	$("#table-body").children().remove();
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
		expense.innerText= "$"+reimb.expenseCost;
		reimbCost.innerText = "$"+reimb.reimbAmount;
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

function onStart(){
	fetch(reimbURL)
	.then((response)=>{
		return response.json();
	})
	.then((jsonData)=>{
		reimbObj = jsonData;
		displayRequest(reimbObj);
	})
	//fetching employee details
	fetch(empURL)
	.then((response)=>{
		return response.json();
	})
	.then((jsonData)=>{
		empObj = jsonData;
	})
	
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