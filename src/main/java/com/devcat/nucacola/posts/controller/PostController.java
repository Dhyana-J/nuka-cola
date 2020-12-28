package com.devcat.nucacola.posts.controller;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.posts.model.vo.Comment;
import com.devcat.nucacola.posts.model.vo.Post;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.devcat.nucacola.posts.model.service.PostService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

@Controller
public class PostController {

	@Autowired
	private PostService pService;
	@Autowired
	private MemberService mService;
	
	// 포스트 조회
	@RequestMapping("list.cou")
	public String selectListCount() {
		return "/main";
	}
	
	@RequestMapping("list.pos")
	public String selectPostList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,HttpSession session
			,Model model
	) {
		Member m = (Member) session.getAttribute("loginUser");
		int uno = m.getUserNo();

		int countFollowers=mService.countFollowers(m.getUserNo());
		int countFollowings=mService.countFollowings(m.getUserNo());
		int countConnections=mService.countConnections(m.getUserNo());

		//System.out.println(currentPage);
		int listCount = pService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Post> list = pService.selectPostList(pi,uno);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("Followers", countFollowers);
		model.addAttribute("Followings", countFollowings);
		model.addAttribute("Connections", countConnections);
		return "/timeline/timeline";
	}

	@RequestMapping("load.pos")
	public ResponseEntity<String> loadPostList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,HttpSession session
	) {
		Member m = (Member) session.getAttribute("loginUser");
		int uno = m.getUserNo();

		HttpHeaders responseHeaders = new HttpHeaders();
		int listCount = pService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Post> list = pService.selectPostList(pi,uno);
		responseHeaders.setContentType(MediaType.APPLICATION_JSON);
		String json = new Gson().toJson(list);
		return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
	}
	
	// 포스트 작성
	@RequestMapping(value = "insert.pos",method = RequestMethod.POST)
	public String insertPost(Post p, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")){
			String changeName = saveFile(session , upfile);

//			p.setOriginName(upfile.getOriginalFilename());
			p.setPostImg("resources/uploads/"+changeName);

		}

		int result = pService.insertPost(p);
		if(result>0){
			return "redirect:list.pos";
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
	@ResponseBody
	@RequestMapping("like.pos")
	public HashMap<String,Integer> addFollowing(int userNo, int postNo, int islike) {

		int result = pService.toggleLike(userNo,postNo,islike);
		HashMap<String,Integer> list = new HashMap<>();//뷰로 리턴할 HashMap
		if(result>0) {//팔로잉 추가 성공시
			list.put("result",result);
			return list;
		}else{//팔로잉 추가 실패시
			list.put("result",result);
			return list;
		}
	}


	@ResponseBody
	@RequestMapping("insert.com")
	public String insertDeclare(Comment c){
		System.out.println(c);
		int result = pService.insertComment(c);
		if(result > 0){
			return "success";
		}else{
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping(value="load.com",method = RequestMethod.GET)
	public ResponseEntity<String> selectCommentList(int pno)throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();

		System.out.println(pno);
		ArrayList<Comment> list =pService.selectCommentList(pno);
		responseHeaders.setContentType(MediaType.APPLICATION_JSON);
		String json = new Gson().toJson(list);
		return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
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
