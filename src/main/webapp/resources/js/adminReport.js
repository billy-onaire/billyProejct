function getAdminReportInfo(){
    const xhr = new XMLHttpRequest();

    xhr.onload = ()=>{
        
    }
    xhr.open('GET','getAdminReportInfo.do');
    xhr.setRequestHeader('Content-Type','x-www-form-urlencoded');
    xhr.send();
}

document.addEventListener('DOMContentLoaded',()=>{
    getAdminReportInfo();
})