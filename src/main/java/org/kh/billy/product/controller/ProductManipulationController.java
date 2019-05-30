package org.kh.billy.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	private ProductManipulationService pms;
	
	@RequestMapping(value="productinsertmain.do")
	public String addProduct(HttpServletRequest request) {
			return "product/productInsert";
	} 
	
	@RequestMapping(value="myproductlist.do")
	public String myProductList(Criteria cri, Model mv, HttpSession session) {
		//https://to-dy.tistory.com/90?category=700248 참고
		String userId = ((Member) session.getAttribute("loginMember")).getUser_id();
		
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
		//System.out.println("리스트 확인 : " + list);
		for(Product p: list) {
			System.out.println(p);
			p.setDatecal(String.valueOf(p.getProduct_startdate()).substring(5, 10) +"~"+ String.valueOf(p.getProduct_enddate()).substring(5, 10));
		}
		mv.addAttribute("list", list);
		mv.addAttribute("pageMaker", pageMaker);
		return "product/myProductList";
	}
	
	@RequestMapping(value="productinsert.do", method=RequestMethod.POST)
	public String productInsert(Product product, @RequestParam("sel1") String pcategory_name, @RequestParam("sel2") String sub_pcategory_name,
			@RequestParam(name="files1") MultipartFile file1, @RequestParam(name="files2",defaultValue="") MultipartFile file2, @RequestParam(name="files3",defaultValue="") MultipartFile file3, @RequestParam(name="files4",defaultValue="") MultipartFile file4, 
			HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		System.out.println(product);
		
		
		ProductCategory productCategory = new ProductCategory();
		ProductImg productImg = new ProductImg();
		
		
		productCategory.setPcategory_name(pcategory_name);
		productCategory.setSub_pcategory_name(sub_pcategory_name);
		int pcategory_no = productCategoryService.selectProductCategory(productCategory);
		//System.out.println("카테고리 번호 확인 : " + pcategory_no);
		
		product.setCategory_code(pcategory_no);
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/product/");

		String fileRename = String.valueOf(System.nanoTime()) + "." + file1.getOriginalFilename().substring(file1.getOriginalFilename().lastIndexOf(".") + 1);
		file1.transferTo(new File(savePath +  fileRename));
		productImg.setFirst_img(fileRename);
		
		if(!file2.getOriginalFilename().equals("")) {
			fileRename = String.valueOf(System.nanoTime()) + "." + file2.getOriginalFilename().substring(file2.getOriginalFilename().lastIndexOf(".") + 1);
			file2.transferTo(new File(savePath +  fileRename));
			productImg.setSecond_img(fileRename);
		}
		if(!file3.getOriginalFilename().equals("")) {
			fileRename = String.valueOf(System.nanoTime()) + "." + file3.getOriginalFilename().substring(file3.getOriginalFilename().lastIndexOf(".") + 1);
			file3.transferTo(new File(savePath +  fileRename));
			productImg.setThird_img(fileRename);
		}
		if(!file4.getOriginalFilename().equals("")) {
			fileRename = String.valueOf(System.nanoTime()) + "." + file4.getOriginalFilename().substring(file4.getOriginalFilename().lastIndexOf(".") + 1);
			file4.transferTo(new File(savePath +  fileRename));
			productImg.setFourth_img(fileRename);
		}
		
			/*String fileRename = String.valueOf(System.nanoTime()) + "." + file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf(".") + 1);
				productImg.setFirst_img(fileRename);
				productImg.setSecond_img(fileRename);
				productImg.setThird_img(fileRename);
				productImg.setFourth_img(fileRename);
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/files/product/");
			file[i].transferTo(new File(savePath +  fileRename));*/
		
		productImgService.insertProductImg(productImg);//result 값이 1보다 작을 때 처리 해야 함
		int img_no = productImgService.selectProductImgNo(productImg.getFirst_img());
		product.setImg_no(img_no);
		product.setSeller_id(((Member) session.getAttribute("loginMember")).getUser_id());
		
		pms.insertProduct(product);
		return "redirect:main.do";
	}
	
	/*@RequestMapping(value="productinsert.do", method=RequestMethod.POST)
	public String productInsert(Product product, @RequestParam("sel1") String pcategory_name, @RequestParam("sel2") String sub_pcategory_name,
				@RequestParam(name="fileUpload[]") MultipartFile[] fileString[] args, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		System.out.println(product);
		
		
		ProductCategory productCategory = new ProductCategory();
		ProductImg productImg = new ProductImg();
		
		
		productCategory.setPcategory_name(pcategory_name);
		productCategory.setSub_pcategory_name(sub_pcategory_name);
		int pcategory_no = productCategoryService.selectProductCategory(productCategory);
		//System.out.println("카테고리 번호 확인 : " + pcategory_no);
		product.setCategory_code(pcategory_no);
		int index = file.length;
		//productInput.jsp 에 사진업로드하는 네모칸만큼 갯수를 잡아주기 때문에 
		//file.length로 for문을 돌릴 경우 파일이 하나 더 생김. 
		//그러므로 사진 갯수가 3개 이하일 경우 for문이 한번 수행 못하게 해야 함
		if(file.length < 4)	
			index = file.length - 1;
		for(int i=0; i<index; i++) {
			String fileRename = String.valueOf(System.nanoTime()) + "." + file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf(".") + 1);
			if(i == 0)
				productImg.setFirst_img(fileRename);
			if(i == 1)
				productImg.setSecond_img(fileRename);
			if(i == 2)
				productImg.setThird_img(fileRename);
			if(i == 3)
				productImg.setFourth_img(fileRename);
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/files/product/");
			file[i].transferTo(new File(savePath +  fileRename));
			// + "." + file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf(".") + 1)
			//String savePath = request.getSession().getServletContext().getRealPath("/resources/files/test");
			//file[i].transferTo(new File(savePath + "\\" + file[i].getOriginalFilename()));
		}
		//System.out.println(productImg);
		productImgService.insertProductImg(productImg);//result 값이 1보다 작을 때 처리 해야 함
		int img_no = productImgService.selectProductImgNo(productImg.getFirst_img());
		product.setImg_no(img_no);
		product.setSeller_id(((Member) session.getAttribute("loginMember")).getUser_id());
		
		pms.insertProduct(product);
		//if(productInsertService.insertProduct(product) > 0)
//			System.out.println("상품등록 성공");
	//	else
		//	System.out.println("상품등록 실패");
		return "redirect:main.do";
		//파일명 rename 처리 진행
		//새로운 파일명 만들기 : "년월일시분초.확장자"
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		//Date currentTime = new Date(System.currentTimeMillis());
		
		//String renameFileName = sdf.format(currentTime) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		//현재시간.확장자
		
		//System.out.println(renameFileName);
		
		//java.io.File의 renameTo() 사용함
		//File originFile = new File(savePath+"\\"+originalFileName);
		//File renameFile = new File(savePath+"\\"+renameFileName);
		
	}*/
	
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
		//System.out.println("상품확인 : " + product);
		mv.addObject("product",product);
		mv.setViewName("product/productUpdate");
		return mv;
	}
	
	@RequestMapping(value="myproductupdate.do",method=RequestMethod.POST)
	public String updateMyProduct(ProductForUpdate product, @RequestParam(name="files1") MultipartFile file1, @RequestParam(name="files2") MultipartFile file2, @RequestParam(name="files3") MultipartFile file3, @RequestParam(name="files4") MultipartFile file4, 
							@RequestParam(name="imgfile[]") String[] img, HttpServletRequest request, @RequestParam("sel1") String pcategory_name, @RequestParam("sel2") String sub_pcategory_name) throws IllegalStateException, IOException {//, @RequestParam(name="") MultipartFile[] file
		//해결안 한 문제 : DB에는 사진이 있는데 실제 사진이 없는 경우 -> productUpdate.jsp에서 사진이 안 보이는 걸로 나옴->placeholder.jpg 이미지로 대체하게 해야 함.
		
		//System.out.println("수정하면서 넘겨받은 주 카테고리 : " + pcategory_name);
		//System.out.println("수정하면서 넘겨받은 세부 카테고리 : " + sub_pcategory_name);
		
		//카테고리 이름을 그대로 사용하거나 새로 수정헀을 수 있기 때문에 @RequestParam으로 값을 넘겨 받습니다.
		product.setPcategory_name(pcategory_name.toLowerCase());
		product.setSub_pcategory_name(sub_pcategory_name);
		//System.out.println("수정할 상품 : " + product);
		
		//기존의 사진 유무, 이름을 확인합니다.
		/*for(int i=0; i<img.length;i++) {
			System.out.println("기존의" + i + "번째 사진 이름 : "+img[i]);
		}*/
		//기존의 사진 1 2 3 4 2번 을 삭제하고 컨트롤러로 전송하면 img.length는 3이고  1 3 4 사진 전송//p태그 밖으로 꺼냈음
		//ProductForUpdate oldProduct = pms.selectMyProduct(productNo);
		//System.out.println("기존의 상품 확인"+oldProduct);
		//System.out.println("바꿀 사진 확인 : " + oldProduct.getFirst_img());
		
				
		//System.out.println("1번 사진 내용 확인 : "+file1);
		//System.out.println("1번 사진 사진 파일명 확인 : " + file1.getOriginalFilename());
		System.out.println("------------");
		System.out.println(file1.getOriginalFilename());
		System.out.println(file2.getOriginalFilename());
		System.out.println(file3.getOriginalFilename());
		System.out.println(file4.getOriginalFilename());
		System.out.println("-------------");
		
		//사진을 수정, 추가, 삭제
		ProductImg productImg = new ProductImg();
		File file = new File("resources/files/product");
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/product/");
		file.delete();
		if(!img[0].equals("")) {
			System.out.println("기존 사진 그대로 사용 - > 1번째 사진 확인 : " + img[0]);
			productImg.setFirst_img(img[0]);

			//기존 사진 그대로면 set해줄 이유가 없음
			//product.setFirst_img(img[0]);
		} 		//1번 사진은 무조건 있기 떄문에 file1.getoriginalFilename()이 비었는지 확인하지 않음
		else {//기존의 사진을 지우고 새로운 사진으로 수정하는 경우
			System.out.println("새로운 1번 사진 사용 : " + file1.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file1.getOriginalFilename().substring(file1.getOriginalFilename().lastIndexOf(".") + 1);
			productImg.setFirst_img(fileRename);
			
			//새로운 사진 저장
			file1.transferTo(new File(savePath +  fileRename));
			System.out.println("바뀐 1번 사진 이름 확인 : " + fileRename);
			file = new File(savePath +  product.getFirst_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 1번 사진 이름 확인 : " + product.getFirst_img());
			
			//기존의 사진 삭제
			if(file.delete()){
                System.out.println("1번 파일삭제 성공");
            }else{
                System.out.println("1번 파일삭제 실패");
            }
			//삭제 후 db에 새로운 값 추가
			product.setFirst_img(fileRename);
		}
		
		if(!img[1].equals("")) {		//기존의 2번 사진이 있으면 productImg set
			System.out.println("기존 사진 그대로 사용 - > 2번째 사진 확인 : " + img[1]);
			//productImg.setSecond_img(img[1]);
			//product.setSecond_img(img[1]);
		}else if(file2.getOriginalFilename().equals("")) {//새로운 사진 없고 기존의 사진 삭제한 경우
			System.out.println("새로운 2번 사진 없음");
			file = new File(savePath + product.getSecond_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 2번 사진 이름 확인 : " + product.getSecond_img());
			if(file.delete()){
                System.out.println("2번 사진 파일삭제 성공");
            }else{
                System.out.println("2번 사진 파일삭제 실패");
            }
			//삭제 후에 db에 기존의 값 삭제
			product.setSecond_img(null);
		}else {//새로운 사진을 입력했을 시
			System.out.println("새로운 2번 사진 사용 : " + file2.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file2.getOriginalFilename().substring(file2.getOriginalFilename().lastIndexOf(".") + 1);
			
			file2.transferTo(new File(savePath + fileRename));
			System.out.println("바뀐 2번 사진 이름 확인 : " + fileRename);
			System.out.println("바뀐 2번 사진 이름 확인2 : " + fileRename);
			file = new File(savePath + product.getSecond_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 2번 사진 이름 확인 : " + product.getSecond_img());
			if(file.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
			//삭제 후 db에 새로운 값 추가
			System.out.println("db에 입력되는 파일명 : " + fileRename);
			product.setSecond_img(fileRename);
		}
		if(!img[2].equals("")) {		//기존의 3번 사진이 있으면 productImg set
			System.out.println("기존 사진 그대로 사용 - > 3번째 사진 확인 : " + img[2]);
			productImg.setThird_img(img[2]);
			
		}else if(file3.getOriginalFilename().equals("")) {//새로운 사진 없고 기존의 사진 삭제한 경우
			System.out.println("3번 사진 없음");
			
			//실제 경로에 있는 사진 파일 삭제
			file = new File(savePath + product.getThird_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 3번 사진 이름 확인 : " + product.getThird_img());
			if(file.delete()){
                System.out.println("3번 사진 파일삭제 성공");
            }else{
                System.out.println("3번 사진 파일삭제 실패");
            }
			//삭제 후에 db에 기존의 값 삭제
			product.setThird_img(null);
		}else {//새로운 사진을 입력했을 시
			System.out.println("새로운 3번 사진 사용 : " + file3.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file3.getOriginalFilename().substring(file3.getOriginalFilename().lastIndexOf(".") + 1);
			productImg.setThird_img(fileRename);
			file3.transferTo(new File(savePath + fileRename));
			System.out.println("바뀐 3번 사진 이름 확인 : " + fileRename);
			file = new File(savePath + product.getThird_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 3번 사진 이름 확인 : " + product.getThird_img());
			if(file.delete()){
                System.out.println("3번 사진 파일삭제 성공");
            }else{
                System.out.println("3번 사진 파일삭제 실패");
            }
			product.setThird_img(fileRename);
		}if(!img[3].equals("")) {		//기존의 4번 사진이 있으면 productImg set
			System.out.println("기존 사진 그대로 사용 - > 4번째 사진 확인 : " + img[3]);
			productImg.setFourth_img(img[3]);
		}else if(file4.getOriginalFilename().equals("")) {//새로운 사진 없고 기존의 사진 삭제한 경우
			System.out.println("4번 사진 없음");
			
			//실제 경로에 있는 사진 파일 삭제
			file = new File(savePath + product.getFourth_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 4번 사진 이름 확인 : " + product.getFourth_img());
			if(file.delete()){
                System.out.println("4번 사진 삭제 성공");
            }else{
                System.out.println("4번 사진 삭제 실패");
            }
			product.setFourth_img(null);
		}else {//새로운 사진을 입력했을 시
			//새로운 이름을 지정해주고 파일을 저장
			System.out.println("새로운 4번 사진 사용 : " + file4.getOriginalFilename());
			String fileRename = String.valueOf(System.nanoTime()) + "." + file4.getOriginalFilename().substring(file4.getOriginalFilename().lastIndexOf(".") + 1);
			productImg.setFourth_img(fileRename);
			file4.transferTo(new File(savePath + fileRename));
			System.out.println("바뀐 4번 사진 이름 확인 : " + fileRename);
			
			//4번 파일 삭제
			file = new File(savePath + product.getFourth_img());
			System.out.println("사진 경로 : " + savePath);
			System.out.println("바뀌기전 4번 사진 이름 확인 : " + product.getFourth_img());
			if(file.delete()){
                System.out.println("4번 파일 삭제 성공");
            }else{
                System.out.println("4번 파일 파일삭제 실패");
            }
			product.setFourth_img(fileRename);
		}		
		
		productImg.setImg_no(product.getImg_no());
		System.out.println("update할 db확인 : " + product);
		
		if(pms.updateMyImage(product) > 0)
			System.out.println("사진 수정 성공");
		else
			System.out.println("사진 수정 실패");
		
		if(pms.updateMyProduct(product) > 0)
			System.out.println("사진 외 상품 수정 성공");
		else
			System.out.println("사진 외 상품 수정 실패");
		
		//return "redirect:myproductlist.do?userid=" + product.getSeller_id();
		return "redirect:myproductlist.do";
	}
	
	@RequestMapping(value="myproductdelete.do",method=RequestMethod.POST)
	public String deleteMyProduct(@RequestParam(name="product_no") int productNo, HttpServletRequest request) {
		System.out.println("삭제 product_no 확인 : " + productNo);
		System.out.println("reuqest로 product_no 확인 : " + request.getParameter("product_no"));
		if(pms.deleteMyProduct(productNo) > 0)
			System.out.println("상품 삭제 성공");
		else
			System.out.println("상품 삭제 실패");
		return "redirect:myproductlist.do?";
	}
	
}
