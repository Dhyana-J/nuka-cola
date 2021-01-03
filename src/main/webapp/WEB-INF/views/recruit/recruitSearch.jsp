<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>RECRUIT-SEARCH</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
            integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
            crossorigin="anonymous"
        />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="resources/css/common.css" />
        <link rel="stylesheet" href="resources/css/recruit/recruitSearch.css" />
        <link rel="stylesheet" href="resources/css/recruit/rSlider.min .css" />
        <script defer src="resources/js/recruit/rSlider.min.js"></script>
        <script defer src="resources/js/recruit/recruitSearch.js"></script>
    </head>
    <body>
        <!-- 메뉴바 -->
        <jsp:include page="../common/mainMenu.jsp"/>

        <main class="recruit-search__main-wrapper">
            <div class="inner">
                <div class="recruit-search__left-area">
                    <button class="recruit-enroll-btn">채용 무료 등록</button>
                </div>
                <div class="recruit-search__right-area">
                    <div class="info-search">
                        <div class="info-search__header">채용정보검색</div>
                        <div class="info-search__selects">
                        
                            <select name="position" onchange="getPosition(this)">
                                <option selected disabled hidden>활동분야</option>
                                <option value="기획/PM">기획/PM</option>
                                <option value="SW 개발">SW 개발</option>
                                <option value="디자인">디자인</option>
                            </select>
                            
                            <select name="industry" onchange="getIndustry(this)">
                                <option selected disabled hidden>산업분야</option>
                              <c:forEach var="industry" items="${industryList}">
                              	<option value="${industry.indusName }">${industry.indusName }</option>
                              </c:forEach>
                            </select>

                            <select name="tech-stack" onchange="getTechStack(this)">
                                <option selected disabled hidden>테크스택</option>
                              <c:forEach var="skill" items="${skillList}">
                             	<option value="${skill.skillName }">${skill.skillName }</option>
                              </c:forEach>
                            </select>
                            
                            <select name="condition" onchange="getCondition(this)">
                                <option selected disabled hidden>채용조건</option>
                                <option value="신입">신입</option>
                                <option value="경력">경력</option>
                                <option value="신입,경력">신입,경력</option>
                            </select>
                            
                            <div class="salary_wrapper">
                                <div class="salary">
                                  <span>연봉</span>
                                  <span class="material-icons">
                                    local_atm
                                  </span>
                                </div>
                                <div class="salary-bar">
                                  <input type="text" id="sampleSlider" />
                                  <button type="button" class="salary-btn">적용</button>
                                  <span class="unit">단위:만원</span>
                                </div>
                            </div>
                            
                            <input list="addr-search" class="search-addr" 
                                    id="address" name="address" placeholder="지역 입력"
                                    onchange="getAddress(this)" />
                            <datalist id="addr-search">
                                <option value="경기도">
                                <option value="서울시">
                                <option value="충청도">
                                <option value="부산시">
                            </datalist>
                        </div><!--info-search__selects-->
                        
                        <div class="info-search__searchbar">
                            <input type="search" class="search-keyword" value="" placeholder="검색할 공고명을 입력해주세요" />
                            <span class="material-icons search-btn">search</span>
                        </div>
                        <div class="info-search__tags">
                        	<!-- 태그 들어갈 자리 -->
                        </div>
                    </div><!--info-search-->
                    <div class="recruit-search__results">
                        <div class="search-results__header">
                            <span>검색 결과</span>
                            <div class="search-results__align-options">
                                <span class="aligning">최신순</span>
                                <span>인기순</span>
                                <span>연봉순</span>
                            </div>
                        </div>
                        
                        <div class="recruit-search__search-list">
                        
                        	<c:forEach var="recruitInfo" items="${recruitInfoList}">
                        		<c:set var="company" value="${recruitInfo.get('company') }"/>
                        		<c:set var="recruitList" value="${recruitInfo.get('recruitList') }"/>
                        		<c:set var="industries" value="${recruitInfo.get('industries') }"/>
                        	
	                            <div class="recruit-info">
	                            
	                                <div class="recruit-info__icons">
	                                    <span class="material-icons">close</span>
	                                </div>
	
	                                <div class="recruit-info__contents">
	                                
	                                    <div class="company__thumb-area">
	                                        <div class="company__thumbnail">
	                                        	<c:choose>
	                                        		<c:when test="${company.compLogo eq null }">
			                                            <img src="resources/assets/conn.png" alt="company-thumb" />
	                                        		</c:when>
	                                        		<c:otherwise>
			                                            <img src="${pageContext.request.contextPath}/${company.compLogo}" alt="company-thumb" />
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </div>
	                                    </div>
	                                    <div class="company__info-wrapper">
	                                        <div class="company__info-area">
	                                        	<input type="hidden" value='${company.compNo }' />
	                                            <div class="company-name">${company.compName }</div>
	                                            <div class="company-desc">${company.compInfo }</div>
	                                            <div class="company-industry">
	                                            	<c:forEach var="industry" items='${industries }' varStatus="status">
		                                                <span>${industry.indusName }</span>
		                                                <c:if test="${!status.last }"><!-- 현재가 마지막루프 아닌 경우에만 출력 -->
			                                                <span>&nbsp;·&nbsp;</span>
		                                                </c:if>
	                                                </c:forEach>
	                                            </div>
	                                            <!-- <div class="applier-count">45명 이상이 누카콜라를 통해 지원</div> -->
	                                        </div>
	                                        
			                        		<c:forEach var="recruit" items="${recruitList }">
		                                        <div class="recruit-summary__wrapper">
		                                            <div class="recruit-summary">
		                                                <div class="summary__contents">
		                                                    <div class="recruit-title">${recruit.recruitTitle }</div>
		                                                    <span>${recruit.recruitMinSal } - ${recruit.recruitMaxSal }만원</span>
		                                                    <span> / </span>
		                                                    <c:choose>
				                                        		<c:when test="${recruit.recruitRequ eq 0}">
				                                                    <span>신입</span>
				                                        		</c:when>
				                                        		<c:when test="${recruit.recruitRequ eq 1}">
				                                                    <span>경력</span>
				                                        		</c:when>
				                                        		<c:otherwise>
				                                                    <span>신입, 경력</span>
				                                        		</c:otherwise>
				                                        	</c:choose>
		                                                </div>
		                                                <div class="summary__icon">
		                                                    <span class="material-icons">turned_in_not</span>
		                                                    <!-- <span class="material-icons">turned_in</span> 안채워진 북마크-->
		                                                </div>
		                                            </div>
		                                            <div class="recruit-period">
		                                            	<c:if test="${recruit.recruitDl ne null}">
		                                                	<span>${recruit.recruitDl } 마감,</span>
		                                            	</c:if>
		                                            	<c:if test="${recruit.createdAt ne null}">
		                                                	<span>${recruit.createdAt } 등록</span>
		                                            	</c:if>
		                                            </div>
		                                        </div><!--recruit-summary__wrapper-->
			                        		</c:forEach>
	                                        
	                                    </div><!-- company__info-wrapper -->
	                                </div><!-- recruit-info__contents -->
	                            </div>
	                            <!--recruit-info-->
                        		
                        		<c:remove var="company"/>
                        		<c:remove var="recruitList"/>
                        		<c:remove var="industries"/>
                        	</c:forEach>
                        	

                            <div class="recruit-info">
                                <div class="recruit-info__icons">
                                    <span class="material-icons">close</span>
                                </div>

                                <div class="recruit-info__contents">
                                    <div class="company__thumb-area">
                                        <div class="company__thumbnail">
                                            <img src="resources/assets/conn.png" alt="company-thumb" />
                                        </div>
                                    </div>
                                    <div class="company__info-wrapper">
                                        <div class="company__info-area">
                                            <div class="company-name">RIDI</div>
                                            <div class="company-desc">인류 정신을 풍요롭게 하는 플랫폼</div>
                                            <div class="company-industry">
                                                <span>웹 서비스</span>
                                                <span>&nbsp;·&nbsp;</span>
                                                <span>모바일</span>
                                            </div>
                                            <div class="applier-count">45명 이상이 누카콜라를 통해 지원</div>
                                        </div>
                                        <div class="recruit-summary__wrapper">
                                            <div class="recruit-summary">
                                                <div class="summary__contents">
                                                    <div class="recruit-title">[라프텔] 백엔드 개발자</div>
                                                    <span>5,000 - 8,000만원</span>
                                                    <span> / </span>
                                                    <span>경력</span>
                                                </div>
                                                <div class="summary__icon">
                                                    <!-- <span class="material-icons">turned_in_not</span> -->
                                                    <span class="material-icons">turned_in</span>
                                                </div>
                                            </div>
                                            <div class="recruit-period">
                                                <span>12/31 마감</span>
                                                <span>10/15 등록</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--recruit-info-->

                            <div class="recruit-info">
                                <div class="recruit-info__icons">
                                    <span class="material-icons">close</span>
                                </div>

                                <div class="recruit-info__contents">
                                    <div class="company__thumb-area">
                                        <div class="company__thumbnail">
                                            <img src="resources/assets/conn.png" alt="company-thumb" />
                                        </div>
                                    </div>
                                    <div class="company__info-wrapper">
                                        <div class="company__info-area">
                                            <div class="company-name">RIDI</div>
                                            <div class="company-desc">인류 정신을 풍요롭게 하는 플랫폼</div>
                                            <div class="company-industry">
                                                <span>웹 서비스</span>
                                                <span>&nbsp;·&nbsp;</span>
                                                <span>모바일</span>
                                            </div>
                                            <div class="applier-count">45명 이상이 누카콜라를 통해 지원</div>
                                        </div>
                                        <div class="recruit-summary__wrapper">
                                            <div class="recruit-summary">
                                                <div class="summary__contents">
                                                    <div class="recruit-title">[라프텔] 백엔드 개발자</div>
                                                    <span>5,000 - 8,000만원</span>
                                                    <span> / </span>
                                                    <span>경력</span>
                                                </div>
                                                <div class="summary__icon">
                                                    <span class="material-icons">turned_in_not</span>
                                                    <!-- <span class="material-icons">turned_in</span> 안채워진 북마크-->
                                                </div>
                                            </div>
                                            <div class="recruit-period">
                                                <span>12/31 마감</span>
                                                <span>10/15 등록</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--recruit-info-->

                            <div class="recruit-info">
                                <div class="recruit-info__icons">
                                    <span class="material-icons">close</span>
                                </div>

                                <div class="recruit-info__contents">
                                    <div class="company__thumb-area">
                                        <div class="company__thumbnail">
                                            <img src="resources/assets/conn.png" alt="company-thumb" />
                                        </div>
                                    </div>
                                    <div class="company__info-wrapper">
                                        <div class="company__info-area">
                                            <div class="company-name">RIDI</div>
                                            <div class="company-desc">인류 정신을 풍요롭게 하는 플랫폼</div>
                                            <div class="company-industry">
                                                <span>웹 서비스</span>
                                                <span>&nbsp;·&nbsp;</span>
                                                <span>모바일</span>
                                            </div>
                                            <div class="applier-count">45명 이상이 누카콜라를 통해 지원</div>
                                        </div>
                                        <div class="recruit-summary__wrapper">
                                            <div class="recruit-summary">
                                                <div class="summary__contents">
                                                    <div class="recruit-title">[라프텔] 백엔드 개발자</div>
                                                    <span>5,000 - 8,000만원</span>
                                                    <span> / </span>
                                                    <span>경력</span>
                                                </div>
                                                <div class="summary__icon">
                                                    <!-- <span class="material-icons">turned_in_not</span> -->
                                                    <span class="material-icons">turned_in</span>
                                                </div>
                                            </div>
                                            <div class="recruit-period">
                                                <span>12/31 마감</span>
                                                <span>10/15 등록</span>
                                            </div>
                                        </div>
                                        <!--recruit-summary__wrapper-->
                                        <div class="recruit-summary__wrapper">
                                            <div class="recruit-summary">
                                                <div class="summary__contents">
                                                    <div class="recruit-title">[라프텔] 백엔드 개발자</div>
                                                    <span>5,000 - 8,000만원</span>
                                                    <span> / </span>
                                                    <span>경력</span>
                                                </div>
                                                <div class="summary__icon">
                                                    <span class="material-icons">turned_in_not</span>
                                                    <!-- <span class="material-icons">turned_in</span> -->
                                                </div>
                                            </div>
                                            <div class="recruit-period">
                                                <span>12/31 마감</span>
                                                <span>10/15 등록</span>
                                            </div>
                                        </div>
                                        <!--recruit-summary__wrapper-->
                                    </div>
                                    <!--company__info-wrapper-->
                                </div>
                            </div>
                            <!--recruit-info-->
                            
                            
                        </div>
                        <!--recruit-search__search-list-->
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="../common/footer.jsp"/>

    </body>
</html>

