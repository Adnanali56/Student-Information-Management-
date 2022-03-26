/**
 * 
 */
function sendFormData(){
	const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "July", "Aug", "Sep", "Oct", "Nov", "Decm"
];

const d = new Date();
 
	let today=d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate();
	let formDate=document.getElementById("dt");
	formDate.value=today;
	let formMonth=document.getElementById("mt");
	formMonth.value=monthNames[d.getMonth()];
	let myForm=document.getElementById("attForm");
	myForm.submit();
}