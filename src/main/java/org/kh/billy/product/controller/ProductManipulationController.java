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
import org.kh.billy.socialuser.model.service.SocialUserService;
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
	private SocialUserService socialService;
	
	@Autowired
	private ProductManipulationService pms;
	
	@RequestMapping(value="productinsertmain.do")
	public String addProduct(HttpServletRequest request) {
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
		mv.addObject("product",product);
		mv.setViewName("product/productUpdate");
		return mv;
	}
	
	@RequestMapping(value="myproductupdate.do",method=RequestMethod.POST)
	public String updateMyProduct(ProductForUpdate product) {
		System.out.println("수정할 상품 : " + product);
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
