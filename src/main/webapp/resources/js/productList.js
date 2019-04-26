let chosenPage = 1;
let listCount = 12;
let minPrice = 0;
let maxPrice = 100000;
let sub = [];

// 서브 카테고리 변경용 자바 스크립트
const catagoryRadios = document.querySelectorAll('.catagories-menu input[name="item"]');
const subCatagory = document.querySelector('.widget-desc');
for(let i = 0; i < catagoryRadios.length; i++){
    catagoryRadios[i].addEventListener('change', ()=>{
        while(subCatagory.firstChild){
            subCatagory.removeChild(subCatagory.firstChild);
        }
        
        if(catagoryRadios[i].value === 'living'){
            const sub = [{cno:1, cname:"생활용품"},{cno:2, cname:"주방용품"},{cno:3,cname:"가구/인테리어"},{cno:4,cname:"키덜트/취미"}];
            for(let i = 0; i < sub.length; i++){
                const formCheck = document.createElement('div');
                const checkbox = document.createElement('input');
                const label = document.createElement('label');

                formCheck.classList = "form-check";
                checkbox.classList= "form-check-input";
                label.classList = "form-check-label";

                checkbox.setAttribute('type','checkbox');
                checkbox.setAttribute('value',sub[i].cno);
                checkbox.setAttribute('id',sub[i].cno);
                label.setAttribute('for',sub[i].cno);

                label.textContent = sub[i].cname;
                const form = subCatagory.appendChild(formCheck);
                form.appendChild(checkbox);
                form.appendChild(label);
                console.log("created!");
            }
        }
    })
}

function requestProductListAjax(){
    const xhr = new XMLHttpRequest();

    xhr.onload = ()=>{
        const products = JSON.parse(xhr.responseText);
        
        for(let i = 0; i < products.list.length; i++){
            const listRow = document.getElementById('product_list_row');
        
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
            productPrice.textContent = numberWithCommas(products.list[i].price)+"원";
            productName.textContent = products.list[i].pname;
            
            const wrapper = listRow.appendChild(gridDiv).appendChild(singleProductWrapper);
            const imageSection = wrapper.appendChild(productImg);
            imageSection.appendChild(mainImg);
            
            mainImg.setAttribute('src','/myapp/resources/files/product/'+products.list[i].img);
            
            const descSection = wrapper.appendChild(description);
            const metaDataSection = descSection.appendChild(productMetaData);
            metaDataSection.appendChild(divLine);
            metaDataSection.appendChild(productPrice);
            metaDataSection.appendChild(productName);
            // const ratingSection = descSection.appendChild(ratingDiv).appendChild(ratingBox);
            
            // const ratingIndex = products[i].rating/2;
            
            // for(let i = 0; i < ratingIndex; i++){
            //     const starIcon = document.createElement('i');
            //     starIcon.classList = "fa fa-star";
            //     starIcon.setAttribute('aria-hidden','true');
            //     ratingSection.appendChild(starIcon);
            // }
            // if(ratingIndex%2 === 0.5){
            //     ratingSection.removeChild(ratingSection.firstChild)
            //     const starIcon = document.createElement('i');
            //     starIcon.classList = "fa fa-star-half-o";
            //     starIcon.setAttribute('aria-hidden','true');
            //     ratingSection.appendChild(starIcon);
            // }
        }
    }
    
    const requestData = {
        pcategory_name: 12,
        sub_pcategory_name: 23,
        page : chosenPage,
        listCount: listCount,


    }
    xhr.open('POST','getProductList.do');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(requestData));
}

// 숫자 세자리마다 ,찍기 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 페이지 로드시 AJAX 실행
document.addEventListener('DOMContentLoaded',() =>{
    requestProductListAjax();
})