<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../image/icon.png"/> 
    <title>비트여행사</title>
    <!-- reset 스타일시트 -->
    <link rel="stylesheet" href="../css/reset.css">
    <!-- common(main) 스타일시트 -->
    <link rel="stylesheet" href="../css/common.css">
    <!-- 하단 slick css 파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- jQuery js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- slick js -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- custom js -->
    <script src="../js/main.js"></script>
    <script src="../js/article.js"></script>
</head>
<body>
    <div id="articleWrap">
        <div id="blind">
            <div id="header">
                <div class="header_in">
                    <ul class="topnav">
                        <li><a href="./index.jsp">메인으로</a></li>
	                    <%
		                    if(session.getAttribute("userId")==null){
	                        	out.println("<li><a href='#loginModal' data-bs-toggle='modal'>로그인</a></li>");
	                        	out.println("<li><a href='#joinModal' data-bs-toggle='modal'>회원가입</a></li>");
		                    } else{
		                		String userName=(String)session.getAttribute("userName");
		                		out.println("<li><a>"+userName+"님 환영합니다</a></li>");
		                		out.println("<li><a href='../login/logout.jsp'>로그아웃</a></li>");
		                	}
						%>
                        <li><a href="#">커뮤니티</a></li>
                    </ul>
                    
                    <h1 class="logo"><a href="./index.jsp">LOGO</a></h1>

                    <!-- Login Modal -->
                    <div class="modal fade" id="loginModal"
                     tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <!-- Modal-dialog -->
                        <div class="modal-dialog">
                            <!-- Modal-content -->
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h5 class="modal-title" id="loginModalLabel">로그인</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div><!-- //Modal Header -->

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form class="needs-validation" novalidate>
                                        <div class="form-group">
                                          <label for="userId">아이디</label>
                                          <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력하세요" required>
                                          <div class="valid-feedback"></div>
                                          <div class="invalid-feedback">
                                            아이디를 입력해주세요
                                          </div>
                                        </div>
                                        <div class="form-group mt-2">
                                          <label for="userPwd">비밀번호</label>
                                          <input type="password" name="userPwd" id="userPwd" class="form-control" placeholder="비밀번호를 입력하세요" required>
                                          <div class="valid-feedback"></div>
                                          <div class="invalid-feedback">
                                            비밀번호를 입력해주세요
                                          </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary mt-3">로그인</button>
                                        <button type="button" class="btn btn-danger mt-3" data-bs-dismiss="modal">취소</button>
                                      </form>
                                </div> <!-- //Modal Body -->

                                <!-- Modal Footer -->
                                <div class="modal-footer">
                                </div><!-- //Modal Footer -->
                            </div><!-- //Modal-content -->
                        </div><!-- //Modal-dialog -->
                    </div><!-- //Login Modal -->

                    <!-- join Modal -->
                    <div class="modal fade" id="joinModal"
                     tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <!-- Modal-dialog -->
                        <div class="modal-dialog">
                            <!-- Modal-content -->
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h5 class="modal-title" id="joinModalLabel">회원가입</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div><!-- //Modal Header -->

                                <!-- Modal Body -->
                                <div class="modal-body">
                                     <form class="needs-validation" novalidate>
                                        <div class="form-group">
                                          <label for="joinName">이름</label>
                                          <input type="text" name="joinName" id="joinName" class="form-control" placeholder="이름을 입력하세요" required>
                                          <div class="invalid-feedback">이름을 입력해주세요.</div>
                                        </div>
                                        <div class="form-group mt-2">
                                          <label for="joinId">아이디</label>
                                          <input type="text" name="joinId" id="joinId" class="form-control" placeholder="아이디를 입력하세요" required>
                                          <div class="invalid-feedback">아이디를 입력해주세요.</div>
                                        </div>
                                        <div class="form-group mt-2">
                                          <label for="joinPwd">비밀번호</label>
                                          <input type="password" name="joinPwd" id="joinPwd" class="form-control" placeholder="비밀번호를 입력하세요" required>
                                          <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                                        </div>
                                        <div class="form-group mt-2">
                                          <label for="joinPhone">핸드폰 번호</label>
                                          <input type="text" name="joinPhone" id="joinPhone" class="form-control" placeholder="핸드폰 번호를 입력하세요" required>
                                          <div class="invalid-feedback">핸드폰 번호를 입력해주세요.</div>
                                        </div>
                                        <button type="submit" class="btn btn-primary mt-3">회원가입</button>
                                        <button type="button" class="btn btn-danger mt-3" data-bs-dismiss="modal">취소</button>
                                      </form>
                                </div> <!-- //Modal Body -->

                                <!-- Modal Footer -->
                                <div class="modal-footer">
                                </div><!-- //Modal Footer -->
                            </div><!-- //Modal-content -->
                        </div><!-- //Modal-dialog -->
                    </div><!-- //join Modal -->
                    
                    <!-- write Modal -->
                    <div class="modal fade" id="writeModal"
                     tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
                        <!-- Modal-dialog -->
                        <div class="modal-dialog">
                            <!-- Modal-content -->
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h5 class="modal-title" id="writeModalLabel">글 작성</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div><!-- //Modal Header -->

                                <!-- Modal Body -->
                                <div class="modal-body">
                                     <form class="needs-validation" novalidate>
									    <div class="form-group mt-2">
									        <label for="articleTitle">제목</label>
									        <input type="text" name="articleTitle" id="articleTitle" class="form-control" placeholder="제목을 입력하세요" required>
									        <div class="invalid-feedback">제목을 입력해주세요.</div>
									    </div>
									    <div class="form-group mt-2">
									        <label for="articleContent">내용</label>
									        <textarea class="form-control" name="articleContent" id="articleContent" placeholder="내용을 입력하세요" rows="10" required></textarea>
									        <div class="invalid-feedback">내용을 입력해주세요.</div>
									    </div>
									    <button type="submit" class="btn btn-primary mt-3">글 작성</button>
									    <button type="button" class="btn btn-danger mt-3" data-bs-dismiss="modal">취소</button>
									</form>
                                </div> <!-- //Modal Body -->

                                <!-- Modal Footer -->
                                <div class="modal-footer">
                                </div><!-- //Modal Footer -->
                            </div><!-- //Modal-content -->
                        </div><!-- //Modal-dialog -->
                    </div><!-- //write Modal -->
                    
                    <div class="toplink">
                        <ul>
                            <li><a href="#"><img src="../image/lnb_bklist.png" /><p>예약확인</p></a></li>
                            <li><a href="#"><img src="../image/lnb_place.png" /><p>출발장소</p></a></li>
                            <li><a href="#"><img src="../image/lnb_guide.png" /><p>여행가이드</p></a></li>
                            <li><a href="#"><img src="../image/lnb_fixtour.png"  /><p>날짜보기</p></a></li>
                        </ul>
                    </div> <!-- //div#toplink -->
                </div>

                <!-- Menu -->
                <div id="gnb">
                    <div id="menu">
                        <ul class="menu">
                            <li><div class="siteAll"><a id="btn_totalmenu1" onClick="showCategory(2);" class="menuAll">&nbsp;</a><a id="btn_totalmenu2" onClick="showCategory(1);" class="menuAllClose">&nbsp;</a></div></li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">절찬인기여행</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">당일여행</a></li>
                                    <li><a href="#">1박2일</a></li>
                                    <li><a href="#">2박3일</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">먹거리여행</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">당일여행</a></li>
                                    <li><a href="#">1박2일</a></li>
                                    <li><a href="#">2박3일</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">당일여행</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">당일여행</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">숙박여행</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">1박2일</a></li>
                                    <li><a href="#">2박3일</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">리무진버스</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">당일여행</a></li>
                                    <li><a href="#">1박2일</a></li>
                                    <li><a href="#">2박3일</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">제주도여행</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">우리끼리 단독투어</a></li>
                                    <li><a href="#">1박2일</a></li>
                                    <li><a href="#">2박3일</a></li>
                                    <li><a href="#">3박4일</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">섬여행</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">울릉도</a></li>
                                    <li><a href="#">홍도</a></li>
                                    <li><a href="#">백령도</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">기차여행</a>
                            </div>
                            <div class="menu_depth" style="">
                                <ul>
                                    <li><a href="#">당일여행</a></li>
                                    <li><a href="#">1박2일</a></li>
                                    <li><a href="#">2박3일</a></li>
                                </ul>
                            </div>
                            </li>
                            <li class="company">
                            <div class="gnb_1depth"> 
                                <a href="#">해외여행</a>
                            </div>
                            <div class="menu_depth">
                                <ul>
                                    <li><a href="#">베트남</a></li>
                                    <li><a href="#">태국</a></li>
                                    <li><a href="#">중국</a></li>
                                    <li><a href="#">라오스</a></li>
                                    <li><a href="#">일본</a></li>
                                    <li><a href="#">몽골</a></li>
                                </ul>
                            </div>
                            </li>
                        </ul>
                    </div>
                    <div class="bg"></div>
                </div> <!-- //div#gnb-->
            </div> <!-- //div#header -->
        </div> <!-- //div#blind -->

        <div id="blind">
            <div id="section1" class="articleDiv">
               <!-- 게시판 제목 -->
                <h1 class="title"></h1>
                
                <!-- 게시판 설명 -->
                <div class="exec"></div>
                
                <div class="exec">
                    <!-- 게시물 수  -->
                    총 게시물 수: <span></span>개
                    <% 
                    if(session.getAttribute("userId")!=null){
                    	out.println("<button type='button' class='btn btn-primary mb-2 write' data-bs-toggle='modal' data-bs-target='#writeModal'>글 작성</button>");
                    }
                    %>
                </div>
                
                <div class="article">
                    <table>
                        <thead>
                            <tr>
                                <th class="no">번호</th>
                                <th class="subject">제목</th>
                                <th class="name">작성자</th>
                                <th class="hit">조회수</th>
                                <th class="date">작성일시</th>
                            </tr>
                        </thead>                
                        <tbody>
                            <!-- 목록 -->
                        </tbody>
                    </table>
                </div>
            </div><!-- //div#section1 -->
        </div> <!-- //div#blind -->
    </div> <!-- //div #wrap -->

    <div id="blind">
        <div id="articleFooter"> 

            <!--cts_center-->
            <div class="cts_center"> 
              
              <!--footer_cs-->
              <div class="footer_cs">
                
                <div class="fcs_title">여행상담 &amp; 예약센터</div>
                
                <ul class="fcs_tel">
                  <li>02)1234-5678</li>
                  <li>02)987-6543</li>
                </ul>
                
                <div class="fcs_time">평일 : 09:00~18:00 / 토요일 : 09:00~14:00 (일/공휴일 휴무)
                  <p class="holiday">※ 업무시간 외는 취소 및 변경, 여행상담 불가능</p> 
                </div> <!-- //fcs_time -->
                
                <ul class="fcs_tel02">
                  <li class="t_train">열차여행상담</li>
                  <li>070-1234-5678</li>
                </ul>
              </div> <!--//footer_cs--> 
              
               
              
              <!--footer_info-->
              <div class="footer_info">
                
                <!--Footer_link-->
                <div class="footer_link">
                  <ul>
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급방침</a></li>
                    <li><a href="#">여행약관</a></li>
                    <li><a href="#">출발장소안내</a></li>
                  </ul>
                </div> <!--//Footer_link-->
                
                <!--Footer_cts-->
                <div class="footer_cts">
                    서울 강남구 강남대로94길 20, 602호 (역삼동, 비트캠프) <span class="comname mgr25">(주)비트여행사</span><span class="comtit">대표이사.</span> 홍재헌
                    &nbsp;<a href="#"></a><br />
                  
                  <span class="comtit">TEL.</span> (02)1234-5678 / (02)987-6543 <span class="comtit mgl25">FAX.</span> (02)1234-5678 <span class="comtit mgl25">사업자등록번호.</span> 123-45-67890<br />
                  <span class="comtit">통신판매신고번호.</span> 2024-서울강남-0829<span class="comtit mgl25">관광사업자등록번호.</span> 국내여행업 제 2024-08,국외여행업 제 2024-08<br />
                  <p>Copyright ⓒ GoodMorning Tour Co.,Ltd. All Right Reserved.</p>
                </div> <!--//Footer_cts-->
              </div> <!--//footer_info--> 
            </div> <!--//cts_center-->
          </div> <!--//Footer--> 
    </div> <!-- //div#blind -->

<script type="text/javascript" id="itemTemplate">
    <tr>
        <td class="no">${no}</td>
        <td class="left subject">${subject}</td>
        <td class="hit">${hit}</td>
        <td class="date">${date}</td>
    </tr>
</script>
</body>
</html>