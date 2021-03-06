let cno = 1;
let rContent = "";
const id = document.getElementById('rid').value;
const pno = document.querySelector('.summary-table li:first-child span:last-child').textContent;
document.getElementById('rdate').valueAsDate = new Date(); // 날짜 오늘로 초기화
const requestId = document.querySelector('#request__id').value;

const rcategories = document.querySelectorAll('.nice-select ul li'); // 신고 카테고리

for (let i = 0; i < rcategories.length; i++) {
    // 카테고리 드랍다운 선택 
    rcategories[i].addEventListener('click', (e) => {
        const summary = document.querySelector('.summary-table li:nth-child(4) span:last-child');
        summary.textContent = e.target.textContent;
        cno = e.target.getAttribute('data-value');
    })
}

const comment = document.querySelector('#comment');

comment.addEventListener('keyup', () => {
    // 신고 상세 내용
    const summary = document.querySelector('.summary-table li:nth-child(5) span:last-child');
    summary.textContent = comment.value;
    rContent = comment.value;
})

const reportBtn = document.querySelector('#reportBtn');

function goAddReport(){
    if(rContent.length < 10){
        comment.focus();
        return;
    }

    const requestData = {
        report_no: 0,
        rcategory_no: cno,
        report_content: rContent,
        report_id: id,
        report_date: 0,
        product_no: pno,
        request_id: requestId
    }

    const xhr = new XMLHttpRequest();

    xhr.onload = () => {
        const popup = document.querySelector('.modal-content');
        popup.style.display = "block";

        // 클로징 처리
        const mCloses = document.querySelectorAll('.m-close');
        for (let i = 0; i < mCloses.length; i++) {
            mCloses[i].addEventListener('click', () => {
                popup.style.display = "none"; // 팝업 내리기 
                location.href = 'main.do';            
            });
        }
        const modalText = document.getElementById('modal-text');

        if (xhr.responseText === 'ok') {
            modalText.textContent = "신고 신청이 접수 완료되었습니다.";
        } else {
            modalText.textContent = "신고 신청에 실패했습니다. 관리자에게 문의하세요.";
        }
    }

    xhr.open('POST', "addReport.do");
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(requestData));
}

reportBtn.addEventListener('click', goAddReport,true);


document.addEventListener('DOMContentLoaded',()=>{
    const xhr = new XMLHttpRequest();
    xhr.onload = () =>{
        if(xhr.responseText == 'ok'){
            
        } else {
            reportBtn.style.display ="none";
            const newBtn = document.createElement('a');
            newBtn.classList = "btn amado-btn w-100";
            newBtn.textContent = "REPORT CLOSED";
            newBtn.style.backgroundColor = "grey";
            const summary = document.querySelector('.summary-table li:nth-child(5) span:last-child');
            summary.textContent = '이미 신고된 계정입니다.';
            document.querySelector('.cart-btn').appendChild(newBtn);
        }
    }
    const requestData = {
        report_id : id,
        request_id : requestId
    }
    console.log(requestData);
    xhr.open('POST', "checkReport.do");
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(requestData));
})


