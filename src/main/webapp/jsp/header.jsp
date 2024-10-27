<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
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
	               <li><a href="./article.jsp">커뮤니티</a></li>
	           </ul>
           
           <h1 class="logo"><a href="./index.jsp">LOGO</a></h1>

           <!-- Login Modal -->
           <div class="modal fade" id="loginModal"
            tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
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
            tabindex="-1" role="dialog" aria-labelledby="joinModalLabel" aria-hidden="true">
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
                               <div class="form-group mt-2">
                                 <label for="joinAddr">주소</label>
                                 <input type="text" name="joinAddr" id="joinAddr" class="form-control" placeholder="주소를 입력하세요" required>
                                 <div class="invalid-feedback">주소를 입력해주세요.</div>
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
</body>
</html>