package org.kh.billy.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kh.billy.product.model.vo.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductInputController {
	@RequestMapping(value="productinputmain.do")
	public String addProduct() {
		return "product/productInput";
	} 
	
	@RequestMapping(value="productinput.do", method=RequestMethod.POST)
	public String productInput(Product product, @RequestParam(name="fileUpload[]") MultipartFile[] file/*String[] args*/, HttpServletRequest request) throws IllegalStateException, IOException{
		System.out.println(product);
		/*System.out.println(args.length);
		for(int i=0; i<args.length;i++) {
			System.out.println(args[i]);
		}*/
		for(int i=0; i<file.length;i++) {
			System.out.println(file[i].getOriginalFilename());
			System.out.println(System.nanoTime());
			String.valueOf(System.nanoTime());
			/*String savePath = request.getSession().getServletContext().getRealPath("/resources/files/test");
			file[i].transferTo(new File(savePath + "\\" + file[i].getOriginalFilename()));*/
		}
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
	
}
