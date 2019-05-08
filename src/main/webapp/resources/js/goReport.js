let cno = 1;
let rContent;
let id;
let pno;

document.getElementById('rdate').valueAsDate = new Date(); // 날짜 오늘로 초기화

const rcategories = document.querySelectorAll('.nice-select ul li'); // 신고 카테고리

for(let i = 0; i < rcategories.length; i++){
    // 카테고리 드랍다운 선택 
    rcategories[i].addEventListener('click',(e)=>{
        const summary= document.querySelector('.summary-table li:nth-child(4) span:last-child');
        summary.textContent = e.target.textContent;
    })
}

const comment = document.querySelector('#comment');

comment.addEventListener('keyup',()=>{
    // 신고 상세 내용
    const summary = document.querySelector('.summary-table li:nth-child(5) span:last-child');
    summary.textContent = comment.value;
})

const reportBtn = document.querySelector('#reportBtn');

reportBtn.addEventListener('click',()=>{
    const xhr = new XMLHttpRequest();

    xhr.onload = () =>{
        console.log("connected");
    }
    const requestData = {
        rcategory_no: 1,
        report_content: 233,
        report_id:23,
        product_no:1
    }


    xhr.open('POST',"addReport.do");
    xhr.setRequestHeader('Content-Type','application/json');
    xhr.send(JSON.stringify(requestData));
})