let chosenPage = 1;
const listCount = 10;

function getAdminReportInfo(){
    const xhr = new XMLHttpRequest();

    xhr.onload = ()=>{
        const report = JSON.parse(xhr.responseText);
        
        const table = document.querySelector('#adminTable');
        
        for(let i = 0; i < report.list.length; i++){
            const tr = document.createElement('tr');
            const infos = {
                rno: report.list[i].rno,
                cno: report.list[i].cno,
                content: report.list[i].content,
                rid: report.list[i].rid,
                rdate: report.list[i].rdate,
                pno: report.list[i].pno,
                qid: report.list[i].qid
            }

            for(let j in infos){
                const td = document.createElement('td');
                td.textContent = infos[j];
                tr.appendChild(td);
            }
            const btd = document.createElement('td');
            const button1 = document.createElement('button');
            button1.classList ="btn btn-warning";
            button1.textContent = '신고 승인';
            btd.appendChild(button1);
            button1.addEventListener('click',(e)=>{
                e.stopPropagation();
                const result = confirm('승인하시겠습니까?');
                if(result === true){
                    location.href = "reportApproval.do?rno="+infos.rno+"&rid="+infos.rid;
                } else {
                    
                }
            })

            const button2 = document.createElement('button');
            button2.classList ="btn btn-warning";
            button2.textContent = '승인 거절';
            btd.appendChild(button2);
            tr.appendChild(btd);
            button2.addEventListener('click',(e)=>{
                e.stopPropagation();
                const result = confirm('승인을 거절하시겠습니까??');
                if(result === true){
                    location.href = 'reportDisapproval.do?rno='+infos.rno;
                } else {
                    
                }
            })
            
            
                tr.addEventListener('click',()=>{
                    location.href="pdetail.do?pno="+infos.pno;
                })
            
                
            
            table.appendChild(tr);
        }
        const pagination = document.querySelector('.pagination');
        while (pagination.firstChild) {
            pagination.removeChild(pagination.firstChild);
        }

        for (let i = report.page.start; i <= report.page.end; i++) {

            const pageItem = document.createElement('li');
            const pageLink = document.createElement('a');

            pageItem.classList = "page-item";
            pageLink.classList = "page-link";

            pageLink.textContent = i;

            pagination.appendChild(pageItem).appendChild(pageLink);

            pageItem.addEventListener('click', () => {
                chosenPage = i;
                requestProductListAjax();
            })
        }
    }
    const requestData = {
        page: chosenPage,
        listCount: listCount
    }

    xhr.open('POST','getAdminReportInfo.do');
    xhr.setRequestHeader('Content-Type','application/json');
    xhr.send(JSON.stringify(requestData));
}

document.addEventListener('DOMContentLoaded',()=>{
    getAdminReportInfo();
})