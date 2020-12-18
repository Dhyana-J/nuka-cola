<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:forward page="WEB-INF/views/user/login.jsp"/>
</body>
</html>

<li>
   <div class="post__user-info">
      <div class="avatar-small">
         <img src="resources/assets/avatar.png" alt="" />
      </div>
      <div class="user__summary">
         <strong>Bill Gates</strong>
         <small>MicroSoft @ CSAS</small>
      </div>
      <span class="post__date">2020 - 11 - 31</span>
   </div>
   <p class="comment_content">
      Lorem Ipsum is simply dummy text of the printing and
      typesetting industry.
   </p>
   <!-- <div class="comment__btn-wrapper">
               <span>수정</span>
               <span>삭제</span>
             </div> -->
</li>
</ul>