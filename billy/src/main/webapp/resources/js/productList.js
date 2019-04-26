const products = [
    {
        productNo: 1,
        name: "pizza",
        image1: "https://images.pexels.com/photos/2147192/pexels-photo-2147192.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2128738/pexels-photo-2128738.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "50,000원",
        rating: 10
    },
    {
        productNo: 2,
        name: "computer",
        image1: "https://images.pexels.com/photos/2123345/pexels-photo-2123345.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2104140/pexels-photo-2104140.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "20,000원",
        rating: 8
    },
    {
        productNo: 3,
        name: "potatoes",
        image1: "https://images.pexels.com/photos/4316/technology-computer-chips-gigabyte.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2124885/pexels-photo-2124885.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "40,000원",
        rating: 9
    },
    {
        productNo: 4,
        name: "Pumkins 대여",
        image1: "https://images.pexels.com/photos/792345/pexels-photo-792345.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2124885/pexels-photo-2124885.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "10,000원",
        rating: 5
    },
    {
        productNo: 5,
        name: "pizza",
        image1: "https://images.pexels.com/photos/2147192/pexels-photo-2147192.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2128738/pexels-photo-2128738.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "50,000원",
        rating: 10
    },
    {
        productNo: 6,
        name: "computer",
        image1: "https://images.pexels.com/photos/2123345/pexels-photo-2123345.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2104140/pexels-photo-2104140.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "20,000원",
        rating: 8
    },
    {
        productNo: 7,
        name: "potatoes",
        image1: "https://images.pexels.com/photos/4316/technology-computer-chips-gigabyte.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2124885/pexels-photo-2124885.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "40,000원",
        rating: 9
    },
    {
        productNo: 8,
        name: "Pumkins 대여",
        image1: "https://images.pexels.com/photos/792345/pexels-photo-792345.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        image2: "https://images.pexels.com/photos/2124885/pexels-photo-2124885.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        price: "10,000원",
        rating: 5
    }
]
for(let i = 0; i < products.length; i++){
    const listRow = document.getElementById('product_list_row');

    const gridDiv = document.createElement('div');
    const singleProductWrapper = document.createElement('div');
    const productImg = document.createElement("div");
    const mainImg = document.createElement('img');
    const hovImg = document.createElement('img');
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
    hovImg.classList = "hover-img";
    description.classList = "product-description d-flex align-items-center justify-content-between";
    productMetaData.classList = "product-meta-data";
    divLine.classList = "line";
    productPrice.classList = "product-price";
    ratingDiv.classList = "ratings-cart text-right";
    ratingBox.classList = "ratings";
    productPrice.textContent = products[i].price;
    productName.textContent = products[i].name;
    
    const wrapper = listRow.appendChild(gridDiv).appendChild(singleProductWrapper);
    const imageSection = wrapper.appendChild(productImg);
    imageSection.appendChild(mainImg);
    imageSection.appendChild(hovImg);
    mainImg.setAttribute('src',products[i].image1);
    hovImg.setAttribute('src',products[i].image2);
    const descSection = wrapper.appendChild(description);
    const metaDataSection = descSection.appendChild(productMetaData);
    metaDataSection.appendChild(divLine);
    metaDataSection.appendChild(productPrice);
    metaDataSection.appendChild(productName);
    const ratingSection = descSection.appendChild(ratingDiv).appendChild(ratingBox);
    
    const ratingIndex = products[i].rating/2;
    console.log(ratingIndex);
    console.log(ratingIndex%2);
    for(let i = 0; i < ratingIndex; i++){
        const starIcon = document.createElement('i');
        starIcon.classList = "fa fa-star";
        starIcon.setAttribute('aria-hidden','true');
        ratingSection.appendChild(starIcon);
    }
    if(ratingIndex%2 === 0.5){
        ratingSection.removeChild(ratingSection.firstChild)
        const starIcon = document.createElement('i');
        starIcon.classList = "fa fa-star-half-o";
        starIcon.setAttribute('aria-hidden','true');
        ratingSection.appendChild(starIcon);
    }
}

const catagoryRadios = document.querySelectorAll('.catagories-menu input[name="item"]');
const subCatagory = document.querySelector('.widget-desc');
for(let i = 0; i < catagoryRadios.length; i++){
    catagoryRadios[i].addEventListener('change', ()=>{
        while(subCatagory.firstChild){
            subCatagory.removeChild(subCatagory.firstChild);
        }
        const formCheck = document.createElement('div');
        formCheck.classList = "form-check";
        const checkbox = document.createElement('input');
        checkbox.setAttribute('type','checkbox');
        checkbox.classList= "form-check-input";

        if(catagoryRadios[i].value === 'living'){
            subCatagory.appendChild(formCheck).appendChild(checkbox);
        }
    })
}