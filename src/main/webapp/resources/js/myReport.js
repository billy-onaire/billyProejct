const table1 = document.querySelector('#table_report1'); 
const table2 = document.querySelector('#table_report2'); 

table2.style.display = "none";

const listTabs = document.querySelector('.nice-select ul');
listTabs.addEventListener('click', (e) => {
    
    if(e.target.getAttribute('data-value') === '1'){
        table2.style.display = "none";
        table1.style.display = "block";
    } else {
        table2.style.display = "block";
        table1.style.display = "none";
    }
    
});