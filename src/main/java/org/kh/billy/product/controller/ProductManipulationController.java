package org.kh.billy.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.product.model.service.ProductManipulationService;
import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.PageMaker;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.ProductForList;
import org.kh.billy.product.model.vo.ProductForUpdate;
import org.kh.billy.product.model.vo.SettingList;
import org.kh.billy.productcategory.model.service.ProductCategoryService;
import org.kh.billy.productcategory.model.vo.ProductCategory;
import org.kh.billy.productimg.model.service.ProductImgService;
import org.kh.billy.productimg.model.vo.ProductImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductManipulationController {
	
	@Autowired
	private ProductCategoryService productCategoryService;
	
	@Autowired
	private ProductImgService productImgService;
	
	@Autowired
	private ProductManipulationService pms;
	
	@RequestMapping(value="productinsertmain.do")
	public String addProduct() {
		return "product/productInsert";
	} 
	
	@RequestMapping(value="myproductlist.do")
	public String myProductList(Criteria cri, Model mv) {
		//https://to-dy.tistory.com/90?category=700248 참고
		String userId = "user01";
		int count = pms.selectProductCount(userId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		cri.setSeller_id(userId);
		//System.out.println(cri);
		//System.out.println(pageMaker);
		/*System.out.println(member);*/
		/*String userId = member.getUser_id();*/
		
		//System.out.println("메스드는 들어가지는지?");
		
		ArrayList<Product> list = pms.selectProductList(cri);
		System.out.println("리스트 확인 : " + list);
		mv.addAttribute("list", list);
		mv.addAttribute("pageMaker", pageMaker);
		return "product/myProductList";
	}
	
	@RequestMapping(value="productinsert.do", method=RequestMethod.POST)
	public String productInsert(Product product, @RequestParam("sel1") String pcategory_name, @RequestParam("sel2") String sub_pcategory_name,@RequestParam(name="fileUpload[]") MultipartFile[] file/*String[] args*/, HttpServletRequest request) throws IllegalStateException, IOException{
		System.out.println(product);
		/*System.out.println(args.length);
		for(int i=0; i<args.length;i++) {
			System.out.println(args[i]);
		}*/
		//System.out.println("받아온 가격정보 확인 : ");
		
		ProductCategory productCategory = new ProductCategory();
		ProductImg productImg = new ProductImg();
		
		
		productCategory.setPcategory_name(pcategory_name);
		productCategory.setSub_pcategory_name(sub_pcategory_name);
		int pcategory_no = productCategoryService.selectProductCategory(productCategory);
		//System.out.println("카테고리 번호 확인 : " + pcategory_no);
		product.setCategory_code(pcategory_no);
		int index = file.length;
		/*productInput.jsp 에 사진업로드하는 네모칸만큼 갯수를 잡아주기 때문에 
		 * file.length로 for문을 돌릴 경우 파일이 하나 더 생김. 
		 * 그러므로 사진 갯수가 3개 이하일 경우 for문이 한번 수행 못하게 해야 함*/
		if(file.length < 4)	
			index = file.length - 1;
		for(int i=0; i<index; i++) {
			//System.out.println("사진 갯수 : " + index);
			//System.out.println(file[i].getOriginalFilename());
			//System.out.println(System.nanoTime());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf(".") + 1);
			if(i == 0)
				productImg.setFirst_img(fileRename);
			if(i == 1)
				productImg.setSecond_img(fileRename);
			if(i == 2)
				productImg.setThird_img(fileRename);
			if(i == 3)
				productImg.setFourth_img(fileRename);
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/files/product");
			file[i].transferTo(new File(savePath + "\\" + fileRename));
			/* + "." + file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf(".") + 1)*/
			/*String savePath = request.getSession().getServletContext().getRealPath("/resources/files/test");
			file[i].transferTo(new File(savePath + "\\" + file[i].getOriginalFilename()));*/
		}
		//System.out.println(productImg);
		productImgService.insertProductImg(productImg);//result 값이 1보다 작을 때 처리 해야 함
		int img_no = productImgService.selectProductImgNo(productImg.getFirst_img());
		product.setImg_no(img_no);
		product.setSeller_id("user01");
		//System.out.println("이미지 키값 확인 : " + img_no);
		//System.out.println("입력 전 상품정보 확인 : "+product);
		pms.insertProduct(product);
		/*if(productInsertService.insertProduct(product) > 0)
			System.out.println("상품등록 성공");
		else
			System.out.println("상품등록 실패");*/
		return "home";
		//파일명 rename 처리 진행
		//새로운 파일명 만들기 : "년월일시분초.확장자"
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date currentTime = new Date(System.currentTimeMillis());
		
		String renameFileName = sdf.format(currentTime) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		//현재시간.확장자
		
		//System.out.println(renameFileName);
		
		//java.io.File의 renameTo() 사용함
		File originFile = new File(savePath+"\\"+originalFileName);
		File renameFile = new File(savePath+"\\"+renameFileName);*/
		
	}
	
	/*@RequestMapping(value="productinput.do",method=RequestMethod.POST)
	public String productInput(Product product, @RequestParam(name="fileUpload[]") List<MultipartFile> file) throws IllegalStateException, IOException{
		System.out.println(product);
		System.out.println(args.length);
		for(int i=0; i<args.length;i++) {
			System.out.println(args[i]);
		}
		for(int i=0; i<file.size();i++) {
			System.out.println(file.get(i).getOriginalFilename());
		}
		return "home";
	}*/
	
	@RequestMapping("myproductupdateview.do")
	public ModelAndView selectMyUpdateView(ModelAndView mv, @RequestParam(name="product_no") int productNo) {
		ProductForUpdate product = pms.selectMyProduct(productNo);
		product.setPcategory_name(product.getPcategory_name().toUpperCase());
		System.out.println("상품확인 : " + product);
		mv.addObject("product",product);
		mv.setViewName("product/productUpdate");
		return mv;
	}
	
	@RequestMapping(value="myproductupdate.do",method=RequestMethod.POST)
	public String updateMyProduct(ProductForUpdate product, @RequestParam(name="files1") MultipartFile file1, @RequestParam(name="files2") MultipartFile file2, @RequestParam(name="files3") MultipartFile file3, @RequestParam(name="files4") MultipartFile file4, 
							@RequestParam(name="imgfile[]") String[] img, HttpServletRequest request) throws IllegalStateException, IOException {//, @RequestParam(name="") MultipartFile[] file
		System.out.println("수정할 상품 : " + product);
		//product.setProduct_no(productNo);
		System.out.println(img.length);
		/*System.out.println("수정안된 사진1 이름 : " + img[0]);*/
		/*if(img[1] !=null)
			System.out.println("수정안된 사진2 이름 : " + img[1]);
		if(img[2] !=null)
			System.out.println("수정안된 사진3 이름 : " + img[2]);
		if(img[3] !=null)
			System.out.println("수정안된 사진4 이름 : " + img[3]);*/
		for(int i=0; i<img.length;i++) {
			System.out.println("기존의" + i + "번째 사진 이름 : "+img[i]);
		}
		//기존의 사진 1 2 3 4 2번 을 삭제하고 컨트롤러로 전송하면 img.length는 3이고  1 3 4 사진 전송//p태그 밖으로 꺼냈음
		//ProductForUpdate oldProduct = pms.selectMyProduct(productNo);
		//System.out.println("기존의 상품 확인"+oldProduct);
		//System.out.println("바꿀 사진 확인 : " + oldProduct.getFirst_img());
		
		
		System.out.println("******************");
		System.out.println("");		
		System.out.println("******************");
		
		System.out.println("1번 사진 내용 확인 : "+file1);
		System.out.println("1번 사진 사진 파일명 확인 : " + file1.getOriginalFilename());
		System.out.println("------------");
		System.out.println(file1.getOriginalFilename());
		System.out.println(file2.getOriginalFilename());
		System.out.println(file3.getOriginalFilename());
		System.out.println(file4.getOriginalFilename());
		System.out.println("-------------");
		
		
		ProductImg productImg = new ProductImg();
		File file = new File("resources/files/product");
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/product");
		file.delete();
		if(!img[0].equals("")) {
			System.out.println("기존 사진 그대로 사용 - > 1번째 사진 확인 : " + img[0]);
			productImg.setFirst_img(img[0]);
		} 		//1번 사진은 무조건 있기 떄문에 file1.getoriginalFilename()이 비었는지 확인하지 않음
		else {
			System.out.println("새로운 1번 사진 사용 : " + file1.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file1.getOriginalFilename().substring(file1.getOriginalFilename().lastIndexOf(".") + 1);
			productImg.setFirst_img(fileRename);
			file1.transferTo(new File(savePath + "\\" + fileRename));
			System.out.println("바뀐 1번 사진 이름 확인 : " + fileRename);
			file = new File(savePath + "\\" + product.getFirst_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 1번 사진 이름 확인 : " + product.getFirst_img());
			file.delete();
		}
		
		if(!img[1].equals("")) {		//기존의 2번 사진이 있으면 productImg set
			System.out.println("기존 사진 그대로 사용 - > 2번째 사진 확인 : " + img[1]);
			productImg.setSecond_img(img[1]);
		}else if(file2.getOriginalFilename().equals("")) {
			System.out.println("2번 사진 없음");
		}else {//새로운 사진을 입력했을 시
			System.out.println("새로운 2번 사진 사용 : " + file2.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file2.getOriginalFilename().substring(file2.getOriginalFilename().lastIndexOf(".") + 1);
			productImg.setSecond_img(fileRename);
			file1.transferTo(new File(savePath + "\\" + fileRename));
			System.out.println("바뀐 2번 사진 이름 확인 : " + fileRename);
			file = new File(savePath + "\\" + product.getSecond_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 2번 사진 이름 확인 : " + product.getSecond_img());
			file.delete();
		}
		if(!img[2].equals("")) {		//기존의 3번 사진이 있으면 productImg set
			System.out.println("기존 사진 그대로 사용 - > 3번째 사진 확인 : " + img[2]);
			productImg.setThird_img(img[2]);
		}else if(file3.getOriginalFilename().equals("")) {
			System.out.println("3번 사진 없음");
		}else {//새로운 사진을 입력했을 시
			System.out.println("새로운 3번 사진 사용 : " + file3.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file3.getOriginalFilename().substring(file3.getOriginalFilename().lastIndexOf(".") + 1);
			productImg.setThird_img(fileRename);
			file1.transferTo(new File(savePath + "\\" + fileRename));
			System.out.println("바뀐 3번 사진 이름 확인 : " + fileRename);
			file = new File(savePath + "\\" + product.getThird_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 3번 사진 이름 확인 : " + product.getThird_img());
			file.delete();
		}if(!img[3].equals("")) {		//기존의 4번 사진이 있으면 productImg set
			System.out.println("기존 사진 그대로 사용 - > 4번째 사진 확인 : " + img[3]);
			productImg.setFourth_img(img[3]);
		}else if(file4.getOriginalFilename().equals("")) {
			System.out.println("4번 사진 없음");
		}else {//새로운 사진을 입력했을 시
			System.out.println("새로운 4번 사진 사용 : " + file4.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file4.getOriginalFilename().substring(file4.getOriginalFilename().lastIndexOf(".") + 1);
			productImg.setFourth_img(fileRename);
			file1.transferTo(new File(savePath + "\\" + fileRename));
			System.out.println("바뀐 4번 사진 이름 확인 : " + fileRename);
			file = new File(savePath + "\\" + product.getFourth_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 4번 사진 이름 확인 : " + product.getFourth_img());
			file.delete();
		}
		/*for(int i=0; i<4; i++) {
			if(img[i] != null)
				System.out.println("기존 사진 그대로 사용 - > " + i + "번째 사진 확인 : " + img[i]);
			else if(file2.getOriginalFilename().equals("")) {
				System.out.println(i+"번 사진 없음");
			}
			else
				System.out.println(i+"번 사진 사진확인 : " + file2.getOriginalFilename());
		}*/
		
		
		productImg.setImg_no(product.getImg_no());
		
		int result = pms.updateMyProduct(product);
		//return "redirect:myproductlist.do?userid=" + product.getSeller_id();
		return "redirect:myproductlist.do";
	}
	
	@RequestMapping(value="myproductdelete.do",method=RequestMethod.POST)
	public String deleteProduct(Product product) {
		int productNo = product.getProduct_no();
		int result = pms.deleteProduct(productNo);
		return "redirect:myproductlist.do?userid=" + product.getSeller_id();
	}
	
}
