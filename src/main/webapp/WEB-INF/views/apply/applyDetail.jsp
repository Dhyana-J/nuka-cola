<%--
  Created by IntelliJ IDEA.
  User: yhg03
  Date: 2021-01-03
  Time: 오후 6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>recruit-interview</title>

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
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/recruit/apply-detail.css" />
</head>
<body>

<jsp:include page="../common/mainMenu.jsp"/>
<main class="content__section">
    <div class="inner">
        <h5><strong>${a.userName}님</strong> 의 <strong>${a.recruitTitle}공고</strong> 지원정보</h5>
        <div class="main__section">
            <div class="main__section__right">
                <div class="progress__wrap">
                    <ol class="progress progress--large">
                        <c:choose>
                            <c:when test="${a.applyProg eq 0}">
                                <li class="is-active" data-step="1">서류접수</li>
                                <li class="" data-step="2">서류합격</li>
                                <li class="" data-step="3">팀합류</li>
                                <li data-step="4" class="">탈락</li>
                            </c:when>
                            <c:when test="${a.applyProg eq 1}">
                                <li class="is-complete" data-step="1">서류접수</li>
                                <li class="is-active" data-step="2">서류합격</li>
                                <li class="" data-step="3">팀합류</li>
                                <li data-step="4" class="">탈락</li>
                            </c:when>
                            <c:when test="${a.applyProg eq 2}">
                                <li class="is-complete" data-step="1">서류접수</li>
                                <li class="is-complete" data-step="2">서류합격</li>
                                <li class="is-active" data-step="3">팀합류</li>
                                <li data-step="4" class="">탈락</li>
                            </c:when>
                            <c:when test="${a.applyProg eq 3}">
                                <li class="is-complete" data-step="1">서류접수</li>
                                <li class="is-complete" data-step="2">서류합격</li>
                                <li class="" data-step="3">팀합류</li>
                                <li data-step="4" class="is-failed">탈락</li>
                            </c:when>
                        </c:choose>
                    </ol>
                    <!-- <div class="interview__step-admin">
                      <select name="" id="">
                        <option value="" selected>단계변경</option>
                        <option value="">서류합격</option>
                        <option value="">팀합류</option>
                        <option value="">탈락</option>
                      </select>
                    </div> -->
                </div>

                <div class="content__wrap">
                    <strong>취업을 위한 한마디</strong>
                    <div class="content__edu-detail">
                        <span>${a.applyComment}</span>
                    </div>
                </div>

                <div class="content__wrap">
                    <strong>경력</strong>
                    <c:forEach var="ci" items="${c}">
                        <div class="content__carrer-one">
                            <div class="carrer-one__img">
                                <img src="${ci.compLogo}" alt="Logo" />
                            </div>
                            <div class="carrer-one__companyName">
                                <span>${ci.compName}</span>
                            </div>
                            <div class="carrer-one__detail">
                                <span>${ci.careerPosi}</span>
                            </div>
                            <div class="carrer-one__date">
                                <span>${ci.enteredAt}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="content__wrap">
                    <strong>학력</strong>
                    <div class="content__edu-detail">
                        <span>${a.userEdu}</span>
                    </div>
                </div>

                <div class="content__wrap">
                    <strong>활동 분야</strong>
                    <ul class="content__usigTech-list">
                        <c:forEach var="i" items="#{s}">
                            <li>${i.skillName}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="main__section__left">
                <div class="chat">
                    <div class="chat-header clearfix">
                        <div class="chat-about">
                            <div class="chat-with">채용상담</div>
                        </div>
                    </div>
                    <!-- end chat-header -->

                    <div class="chat-history">
                        <ul>
                            <li class="clearfix">
                                <div class="message-data align-right">
                                    <span class="message-data-time">10:10 AM</span>
                                    &nbsp; &nbsp;
                                    <span class="message-data-name">유원근</span>
                                </div>
                                <div class="message other-message float-right">
                                    안녕 점심먹을래 말래
                                </div>
                            </li>

                            <li>
                                <div class="message-data">
                                    <span class="message-data-name">누군가</span>
                                    <span class="message-data-time">10:12 AM</span>
                                </div>
                                <div class="message my-message">몰라</div>
                            </li>

                            <li class="clearfix">
                                <div class="message-data align-right">
                                    <span class="message-data-time">10:14 AM</span>
                                    &nbsp; &nbsp;
                                    <span class="message-data-name">유원근</span>
                                </div>
                                <div class="message other-message float-right">
                                    그래 알겠다
                                </div>
                            </li>

                            <li>
                                <div class="message-data">
                                    <span class="message-data-name">누군가</span>
                                    <span class="message-data-time">10:20 AM</span>
                                </div>
                                <div class="message my-message">ㅇㅋ</div>
                            </li>
                        </ul>
                    </div>
                    <!-- end chat-history -->

                    <div class="chat-message clearfix">
                <textarea
                        name="message-to-send"
                        id="message-to-send"
                        placeholder="메시지를 입력해 주세요"
                        rows="3"
                ></textarea>

                        <button>Send</button>
                    </div>
                    <!-- end chat-message -->
                </div>
                <!-- end chat -->
            </div>
        </div>
    </div>
</main>
</body>
</html>
