package com.devcat.nucacola.posts.controller;

import com.devcat.nucacola.posts.model.vo.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.posts.model.service.PostService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class PostController {

	@Autowired
	private PostService pService;
	
	
	// 포스트 조회
	@RequestMapping("list.cou")
	public String selectListCount() {
		return "/main";
	}
	
	@RequestMapping("list.pos")
	public String selectPostList() {
		return "/main";
	}
	
	// 포스트 작성
	@RequestMapping("insert.pos")
	public String insertPost(Post p, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")){
			String changeName = saveFile(session , upfile);

//			p.setOriginName(upfile.getOriginalFilename());
			p.setPostImg("resources/uploads/"+changeName);

		}

		int result = pService.insertPost(p);
		if(result>0){
			session.setAttribute("alertMsg","게시글작성 성공");
			return "/timeline/timeline";
//			return "redirect:list.pos";
		}else{
			model.addAttribute("errorMsg","작성실패!");
			return "common/errorPage";
		}



	}
	
	
	// 포스트 수정
	@RequestMapping("update.pos")
	public String updatePost() {
		return "/main";
	}
	
	//포스트 삭제
	@RequestMapping("delete.pos")
	public String deletePost() {
		return "/main";
	}
	
	//포스트 좋아요
	@RequestMapping("like.pos")
	public String likePost() {
		return "/main";
	}
	

	// 댓글 조회
	@RequestMapping("list.com")
	public String selectCommentList() {
		return "/main";
	}
	
	
	// 댓글 작성
	@RequestMapping("insert.com")
	public String insertComment() {
		return "/main";
	}

	public String saveFile(HttpSession session , MultipartFile upfile){
		//파일 업로드 시킬 폴더의 물리경로 (savePath)
		String savePath = session.getServletContext().getRealPath("/resources/uploads/");
		//어떤이름? 파일명 수정(changeName)
		String originName = upfile.getOriginalFilename(); //flower.png

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000+10000);
		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName =  currentTime + ranNum + ext;

		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException| IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}
}
