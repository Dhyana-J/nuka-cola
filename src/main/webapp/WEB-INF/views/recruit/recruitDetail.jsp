<%--
  Created by IntelliJ IDEA.
  User: yhg03
  Date: 2020-12-27
  Time: 오후 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>채용상세</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
            integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
            crossorigin="anonymous"
    />
    <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="resources/css/recruit/recruit-detail.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/common.css">
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

<jsp:include page="../common/mainMenu.jsp"/>
<!--제목부분-->
<section class="recruit__title__section">
    <div class="inner">
        <div class="left__section">
            <div class="title__info">
                <strong>${info.recruitTitle}</strong>
                <span>${info.recruitMinSal} - ${info.recruitMaxSal}만원</span>
                <span>신입 / 경력</span>
            </div>
        </div>
        <div class="right__section">
            <div class="email__info">
                <span>${info.compEmail}</span>
            </div>
        </div>
    </div>
</section>

<!--내용 폼-->
<main class="recruit__all__wrapper">

    <div class="inner">

        <!--기업소개부분-->
        <section class="recruit__content recruit__intro">
            <div class="recruit__content__title">
                <strong>기업소개</strong>
            </div>
            <p>
                ${info.compInfo}
            </p>
        </section>

        <div class="recruit__second-wrapper">
            <!--채용정보들 감싸주는 wrapper-->
            <div class="recruit__left-contents__wrapper">
                <section class="recruit__content">
                    <div class="recruit__content__title">
                        <strong>주요업무</strong>
                    </div>
                    <p>
                        ${info.recruitMain}
                    </p>
                </section>
                <section class="recruit__content">
                    <div class="recruit__content__title">
                        <strong>관련기술</strong>
                    </div>
                    <div class="recruit__content__techs">
                        <c:forEach var="s" items="${skills}">
                            <span>${s.skillName}</span>
                        </c:forEach>
                    </div>
                </section>
                <section class="recruit__content">
                    <div class="recruit__content__title">
                        <strong>지역</strong>
                    </div>
                    <p class="recruit__content__area">
                        ${info.compAddress}
                    </p>
                </section>
                <section class="recruit__content">
                    <div class="recruit__content__title">
                        <strong>채용상세</strong>
                    </div>
                    <p>
                    ${info.recruitInfo}
                    </p>
                </section>
            </div><!--recruit__left-contents__wrapper끝-->

            <!--지원자보기 등 버튼,채용담당자 감싸는 wrapper-->
            <div class="recruit__right-contents__wrapper">

                <div class="recruit__btns__wrapper">
                    <div class="item1 recruit__content">
                        <c:choose>
                            <c:when test="${info.managerNo eq loginUser.userNo}">
                                <button type="button">채용정보 수정</button>
                            </c:when>
                            <c:when test="${info.managerNo ne loginUser.userNo}">
                                <button class="btn-blue" type="button">지원하기</button>
                            </c:when>
                        </c:choose>
                        <button type="button" onClick='location.href="manageDetail.re?rno=${ info.recruitNo }"'>지원자 보기 (${appliesCount})</button>
                        <span id="find-email-btn">채용 정보 신고</span>
                    </div>
                    <div class="item2 recruit__content item2">
                        <!--박스 오른쪽 파란띠 부분-->
                    </div>
                </div>
                <div class="recruit__manager recruit__content">
                    <div class="recruit__manager__title">
                        <ul>
                            <li>채용 담당자</li>
                            <li>지원전 궁금한 것들을 물어보세요!</li>
                        </ul>
                    </div>
                    <div class="recruit__manager__profile">
                        <div class="manager__img">
                            <img src="../../assets/avatar.png" alt="프사">
                        </div>
                        <ul class="recruit__manager__info">
                            <li>${info.managerName}</li>
                            <li>${info.managerComp}</li>
                        </ul>
                    </div>
                    <div class="recruit__manager__info-table">
                        <table>
                            <tr>
                                <th>회사 설립일</th>
                                <td>${info.compBirth}</td>
                            </tr>
                            <tr>
                                <th>회사구성원</th>
                                <td>${info.compHeadCount}</td>
                            </tr>
                            <tr>
                                <th>경력 여부</th>
                                <td>신입, 경력</td>
                            </tr>
                            <tr>
                                <th>등록일</th>
                                <td>${info.createdAt}</td>
                            </tr>
                            <tr>
                                <th>마감일</th>
                                <td>${info.recruitDl}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div><!--recruit__right-contents__wrapper끝-->
        </div><!--recruit__second-wrapper끝-->

    </div><!--inner끝-->
</main>

<!-- 이메일찾기 모달 -->
<div id="find-email-modal" class="modal__wrapper">
    <div id="find-email-modal-box" class="modal__box">
        <h1 id="find-email-modal-title">공고 신고</h1>
        <form id="find-email-modal-form" class="modal__form">
            <div class="input__box">
                <label>신고사유</label>
                <input id="declare-input" type="text" />
            </div>
            <div class="login__btn__wrapper">
                <button type="button" id="find-email-close" class="btn">
                    닫기
                </button>
                <button type="button" onclick="onDeclare()" class="btn btn-blue">신고</button>
            </div>
        </form>
    </div>
</div>

</body>
<script defer>
    const closeModal = ()=>{
        document.querySelector("#find-email-modal").style.animation =
            "modalFadeOut 0.3s ease-in-out forwards";
        document.querySelector("#find-email-modal-box").style.animation =
            "modalSlideClose 0.3s ease-in-out forwards";
        setTimeout(() => {
            document
                .querySelector("#find-email-modal")
                .classList.toggle("modal-active");

            document.querySelector("#find-email-modal").style.animation =
                "modalFadeIn 0.3s ease-in-out forwards";

            document.querySelector("#find-email-modal-box").style.animation =
                "modalSlideOpen 0.3s ease-in-out forwards";
        }, 300);
    }

    const onDeclare = ()=>{
        console.log('신고')
        axios.get('declare.re',{
            params:{
                declareTitle:document.querySelector('#declare-input').value,
                rno:'${info.recruitNo}'
            }
        }).then(res=>{
            console.log(res.data)
            if(res.data==='success'){
                alert('신고가 접수되었습니다.');
                closeModal();
            }
        }).catch(()=>{
            alert('이미 신고하셨습니다.');
            closeModal();
        })
    }
        // 모달오픈
        document
            .querySelector("#find-email-btn")
            .addEventListener("click", () => {
                document
                    .querySelector("#find-email-modal")
                    .classList.toggle("modal-active");
            });
        // 모달닫기

        document
            .querySelector("#find-email-close")
            .addEventListener("click",closeModal);

</script>
</html>
