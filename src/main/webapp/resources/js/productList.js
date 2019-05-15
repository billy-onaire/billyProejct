/*
    상품 리스트 출력 페이지 자바스크립트
    작성자 : 윤석호
    최종 수정일 : 2019/05/14
*/

let chosenPage = 1; // 페이징 선택 값
let listCount = 6; // 한 페이지에 보여질 게시물 수
let minPrice = 0; // 최소 가격 설정
let maxPrice = 100000; // 최대 가격 설정
let subCategories = []; // 하위 카테고리 배열
let mainCategory = ""; // 상위 카테고리
let sortby = "1 DESC NULLS LAST";

// 정렬 및 갯수 출력 방식 선택
const listTabs = document.querySelectorAll('.nice-select ul');
listTabs[0].addEventListener('click', (e) => {
    sortby = e.target.getAttribute('data-value');
    requestProductListAjax();
});
listTabs[1].addEventListener('click', (e) => {
    listCount = e.target.getAttribute('data-value');
    requestProductListAjax();
});


// 가격 제한 설정 변경용 자바 스크립트
function targetPrice(min, max) {
    minPrice = min;
    maxPrice = max;
    requestProductListAjax();
}

// 서브 카테고리 변경용 자바 스크립트
const catagoryRadios = document.querySelectorAll('.catagories-menu input[name="item"]');
const subCatagory = document.querySelector('.widget-desc');
for (let i = 0; i < catagoryRadios.length; i++) {
    catagoryRadios[i].addEventListener('change', () => {
        chosenPage = 1; // 현재 페이지 초기화
        while (subCatagory.firstChild) {
            subCatagory.removeChild(subCatagory.firstChild);
        }
        mainCategory = catagoryRadios[i].value;
        subCategories = []; // 다른 메인 카테고리 선택 시 초기화
        let sub = [];
        if (catagoryRadios[i].value === 'living')
            sub = [{ cno: 1, cname: "생활용품" }, { cno: 2, cname: "주방용품" }, { cno: 3, cname: "가구/인테리어" }, { cno: 4, cname: "키덜트/취미" }];
        else if (catagoryRadios[i].value === 'sports')
            sub = [{ cno: 11, cname: "야구용품" }, { cno: 12, cname: "농구용품" }, { cno: 13, cname: "축구용품" }, { cno: 14, cname: "트레이닝/기타" }];
        else if (catagoryRadios[i].value === 'electronics')
            sub = [{ cno: 21, cname: "핸드폰" }, { cno: 22, cname: "컴퓨터" }, { cno: 23, cname: "스피커" }, { cno: 24, cname: "모니터/영상기기" }, { cno: 25, cname: "카메라/주변기기" }, { cno: 26, cname: "계절가전" }];
        else if (catagoryRadios[i].value === 'clothes')
            sub = [{ cno: 31, cname: "여성의류" }, { cno: 32, cname: "남성의류" }, { cno: 33, cname: "여성신발" }, { cno: 34, cname: "남성신발" }, { cno: 35, cname: "여성가방/잡화" }, { cno: 36, cname: "남성가방/잡화" }];
        else if (catagoryRadios[i].value === 'kids')
            sub = [{ cno: 41, cname: "출산/돌 기념품" }, { cno: 42, cname: "장난감" }, { cno: 43, cname: "아동의류" }, { cno: 44, cname: "임부복/소품" }, { cno: 45, cname: "유아안전/실내용품" }, { cno: 46, cname: "수유용품" }];
        else if (catagoryRadios[i].value === 'etc')
            sub = [{ cno: 50, cname: "기타" }]

        createSubMenus(sub);

        let pushData = {
            pcategory_name: mainCategory,
            page: chosenPage,
            listCount: listCount,
            sub_pcategory_no: subCategories,
            minPrice: minPrice,
            maxPrice: maxPrice,
            sort: sortby
        }
        history.pushState(pushData, 'page', 'showlist.do#category='+mainCategory);

        requestProductListAjax();
    })
}
// 서브메뉴 DOM 생성
function createSubMenus(sub) {
    for (let i = 0; i < sub.length; i++) {
        const formCheck = document.createElement('div');
        const checkbox = document.createElement('input');
        const label = document.createElement('label');

        formCheck.classList = "form-check";
        checkbox.classList = "form-check-input";
        label.classList = "form-check-label";

        checkbox.setAttribute('type', 'checkbox');
        checkbox.setAttribute('value', sub[i].cno);
        checkbox.setAttribute('id', sub[i].cno);
        checkbox.setAttribute('checked', true);

        label.setAttribute('for', sub[i].cno);
        label.textContent = sub[i].cname;

        const form = subCatagory.appendChild(formCheck);
        form.appendChild(checkbox);
        form.appendChild(label);

        subCategories.push(checkbox.value);

        checkbox.addEventListener('change', (event) => {
            if (event.target.checked)
                subCategories.push(event.target.value);
            else
                subCategories.splice(subCategories.indexOf(event.target.value), 1); // 배열 요소 삭제 (인덱싱 -> splice 사용)
            requestProductListAjax();
        })
    }
}

function requestProductListAjax(data) {
    const xhr = new XMLHttpRequest();
    const listRow = document.getElementById('product_list_row');
    while (listRow.firstChild) {
        listRow.removeChild(listRow.firstChild);
    }

    xhr.onload = () => {
        
        const products = JSON.parse(xhr.responseText);

        for (let i = 0; i < products.list.length; i++) {

            const gridDiv = document.createElement('div');
            const singleProductWrapper = document.createElement('div');
            const productImg = document.createElement("div");
            const mainImg = document.createElement('img');

            const description = document.createElement('div');
            const productMetaData = document.createElement('div');
            const divLine = document.createElement('div');
            const productPrice = document.createElement('p');
            const productName = document.createElement('h6');
            const ratingDiv = document.createElement('div');
            const ratingBox = document.createElement('div');

            gridDiv.classList = "col-12 col-sm-6 col-md-12 col-xl-6";
            singleProductWrapper.classList = "single-product-wrapper";
            productImg.classList = "product-img";

            description.classList = "product-description d-flex align-items-center justify-content-between";
            productMetaData.classList = "product-meta-data";
            divLine.classList = "line";
            productPrice.classList = "product-price";
            ratingDiv.classList = "ratings-cart text-right";
            ratingBox.classList = "ratings";
            productPrice.textContent = numberWithCommas(products.list[i].price) + "원";
            productName.textContent = products.list[i].pname;

            const wrapper = listRow.appendChild(gridDiv).appendChild(singleProductWrapper);
            const imageSection = wrapper.appendChild(productImg);
            imageSection.appendChild(mainImg);

            mainImg.setAttribute('src', '/billy/resources/files/product/' + products.list[i].img);

            const descSection = wrapper.appendChild(description);
            const metaDataSection = descSection.appendChild(productMetaData);
            metaDataSection.appendChild(divLine);
            metaDataSection.appendChild(productPrice);
            metaDataSection.appendChild(productName);
            const ratingSection = descSection.appendChild(ratingDiv).appendChild(ratingBox);

            const ratingIndex = products.list[i].rating;
            const restRating = ratingIndex - Math.floor(ratingIndex);

            for (let i = 0; i < ratingIndex; i++) {
                const starIcon = document.createElement('i');
                starIcon.classList = "fa fa-star";
                starIcon.setAttribute('aria-hidden', 'true');
                ratingSection.appendChild(starIcon);
            }
            if (restRating >= 0.5) {
                ratingSection.removeChild(ratingSection.firstChild)
                const starIcon = document.createElement('i');
                starIcon.classList = "fa fa-star-half-o";
                starIcon.setAttribute('aria-hidden', 'true');
                ratingSection.appendChild(starIcon);
            }
            // 상세보기 처리
            singleProductWrapper.addEventListener('click', () => {
                location.href = "pdetail.do?pno=" + products.list[i].pno;
                //location.href = "goReport.do?pno="+products.list[i].pno;
            });

        }


        // 페이징 처리 섹션
        const pagination = document.querySelector('.pagination');
        while (pagination.firstChild) {
            pagination.removeChild(pagination.firstChild);
        }

        for (let i = products.page.start; i <= products.page.end; i++) {

            const pageItem = document.createElement('li');
            const pageLink = document.createElement('a');

            pageItem.classList = "page-item";
            pageLink.classList = "page-link";

            pageLink.textContent = i;

            pagination.appendChild(pageItem).appendChild(pageLink);

            pageItem.addEventListener('click', () => {
                chosenPage = i;
                let pushData = {
                    pcategory_name: mainCategory,
                    page: chosenPage,
                    listCount: listCount,
                    sub_pcategory_no: subCategories,
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                    sort: sortby
                }
                history.pushState(pushData, 'page', 'showlist.do#page='+i);
                requestProductListAjax();
            })
        }

    }

    const requestData = {
        pcategory_name: mainCategory,
        page: chosenPage,
        listCount: listCount,
        sub_pcategory_no: subCategories,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sort: sortby
    }
    xhr.open('POST', 'getProductList.do');
    xhr.setRequestHeader('Content-Type', 'application/json');
    if(data){
        xhr.send(JSON.stringify(data));
    } else {
        xhr.send(JSON.stringify(requestData));
    }
}

// 숫자 세자리마다 ,찍기 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 페이지 로드시 AJAX 실행
document.addEventListener('DOMContentLoaded', () => {
    const tempUrl = window.location.search.substring(1);
    
    if (tempUrl) {
        const cv = tempUrl.split('=');
        console.log(cv[1]);
        switch (cv[1]) {
            case 'living': document.querySelector('#living').click(); break;
            case 'sports': document.querySelector('#sports').click(); break;
            case 'electronics': document.querySelector('#electronics').click(); break;
            case 'clothes': document.querySelector('#clothes').click(); break;
            case 'kids': document.querySelector('#kids').click(); break;
            case 'etc': document.querySelector('#etc').click(); break;
        }
    } else {
        const dBtn = document.querySelector('#living');
        if(!dBtn.checked){
            document.querySelector('#living').click();
        } else {
            document.querySelector('#etc').click();
            document.querySelector('#living').click();
        }
    }
    let pushData = {
        pcategory_name: mainCategory,
        page: chosenPage,
        listCount: listCount,
        sub_pcategory_no: subCategories,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sort: sortby
    }
    history.pushState(pushData, 'page', 'showlist.do#page=1');
})

window.onpopstate = ()=>{
    requestProductListAjax(history.state);
}








