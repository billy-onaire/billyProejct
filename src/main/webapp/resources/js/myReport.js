const table1 = document.querySelector('#table_report1'); 
const table2 = document.querySelector('#table_report2'); 

table2.style.display = "none";

const listTabs = document.querySelector('.nice-select ul');
listTabs.addEventListener('click', (e) => {
    console.log(e.target.getAttribute('data-value'));
    if(e.target.getAttribute('data-value') === '1'){
        table2.style.display = "none";
        table1.style.display = "table";
    } else {
        table2.style.display = "table";
        table1.style.display = "none";
    }
    
});

function goReportAdmin(){
    location.href = "goReportAdmin.do";
}