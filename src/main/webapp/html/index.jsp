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
</head>
<body>
    <div id="wrap">
        <div id="blind">
            <div id="header">
                <div class="header_in">
                    <ul class="topnav">
                        <li><a href="#">메인으로</a></li>
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
        </div> <!-- //div#blind -->

        <div id="blind">
            <div id="section1">
                <div id="carouselExampleIndicators" class="carousel slide">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="../image/trav/보라카이_1920.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="../image/trav/두사람자전거_1920.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="../image/trav/리스본_1920.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="../image/trav/눈덮인산_1920.jpg" class="d-block w-100" alt="...">
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>
            </div><!-- //div#section1 -->

            <div id="section2">
                <!---Cts_Center-->
                <div class="cts_center">
                
                    <!--Tit_Area-->
                    <div class="tit_area">
                        <h3 class="sec_t01">인기 급 <img src="../image/ico_mtitle01.png" /> 상승 여행</h3>
                    </div> <!--//Tit_Area--> 

                    <!--Recom_Prd--> 
                    <ul class="recom_prd">
                        <li>
                            <a href="#">
                            <div class="recom_img">
                                <div class="img01 imgLiquid imgLiquid_bgSize imgLiquid_ready"><img src="../image/trav/고원.jpg" alt="[초특가067]◐영동★리무진◑영동포도축제2024(달콤한흑진주포도)[약 2kg 증정]+영동 와인터널+달도 머물다간~월류봉 둘레길+영동재래시장+과일나라테마공원 & 레인보우식물원(상품▷67번)" /></div>
                            </div>
                            
                            <div class="recom_tit">[초특가067]◐영동★리무진◑영동포도축제2024(달콤한흑진주포도<font style='letter-spacing:0px'>...</font></div>
                            
                            <div class="price_r">
                                <div class="prd_no">상품번호 067</div>
                                <div class="black_price p_bold fs25">59,000<span>원~</span></div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                            <div class="recom_img">
                                <div class="img01 imgLiquid imgLiquid_bgSize imgLiquid_ready"><img src="../image/trav/교회건물_1920.jpg" alt="[당일]◐봉평★리무진버스◑소금을뿌린듯한~봉평메밀꽃+2024년평창효석문화제+광천선굴 어드벤처테마파크+월정사전나무숲길" /></div>
                            </div>
                            
                            <div class="recom_tit">[당일]◐봉평★리무진버스◑소금을뿌린듯한~봉평메밀꽃+2024년평<font style='letter-spacing:0px'>...</font></div>
                            
                            <div class="price_r">
                                <div class="prd_no">상품번호 001</div>
                                <div class="black_price p_bold fs25">47,000<span>원~</span></div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                            <div class="recom_img">
                                <div class="img01 imgLiquid imgLiquid_bgSize imgLiquid_ready"><img src="../image/trav/뉴질랜드_바다.jpg" alt="[당일]◐평창백일홍★리무진버스◑100만송이붉은꽃바다,평창백일홍꽃+광천선굴 어드벤처테마파크+치악산둘레길" /></div>
                            </div>
                            
                            <div class="recom_tit">[당일]◐평창백일홍★리무진버스◑100만송이붉은꽃바다,평창백일<font style='letter-spacing:0px'>...</font></div>
                            
                            <div class="price_r">
                                <div class="prd_no">상품번호 003</div>
                                <div class="black_price p_bold fs25">47,000<span>원~</span></div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                            <div class="recom_img">
                                <div class="img01 imgLiquid imgLiquid_bgSize imgLiquid_ready"><img src="../image/trav/야경마을_1920.jpg" alt="[당일]◐공주알밤★리무진버스◑알밤이툭툭!!~무료공주알밤체험(3kg무료증정)+유네스코~마곡사+천장호출렁다리" /></div>
                            </div>
                            
                            <div class="recom_tit">[당일]◐공주알밤★리무진버스◑알밤이툭툭!!~무료공주알밤체험(<font style='letter-spacing:0px'>...</font></div>
                            
                            <div class="price_r">
                                <div class="prd_no">상품번호 004</div>
                                <div class="black_price p_bold fs25">68,000<span>원~</span></div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                            <div class="recom_img">
                                <div class="img01 imgLiquid imgLiquid_bgSize imgLiquid_ready"><img src="../image/trav/섬과바다_1920.jpg" alt="[당일]◐영광★리무진버스◑영광 불갑산상사화꽃\"상사화, 천년사랑을 품다\"+선운사꽃무릇+백제도래지공원(영광굴비정식)" /></div>
                            </div>
                            
                            <div class="recom_tit">[당일]◐영광★리무진버스◑영광 불갑산상사화꽃"상사화, 천년사<font style='letter-spacing:0px'>...</font></div>
                            
                            <div class="price_r">
                                <div class="prd_no">상품번호 005</div>
                                <div class="black_price p_bold fs25">62,000<span>원~</span></div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="recom_img">
                                    <div class="img01 imgLiquid imgLiquid_bgSize imgLiquid_ready"><img src="../image/trav/사우디아라비아_일출.jpg" alt="[당일]고석정꽃밭~가을축제(촛불맨드라미, 코스모스, 천일홍 등)+철원 한탄강 주상절리길+포천산정호수둘레길(또는 명성산억새)" /></div>
                                </div>
                                
                                <div class="recom_tit">[당일]고석정꽃밭~가을축제(촛불맨드라미, 코스모스, 천일홍 등)<font style='letter-spacing:0px'>...</font></div>
                                
                                <div class="price_r">
                                    <div class="prd_no">상품번호 012</div>
                                    <div class="black_price p_bold fs25">38,000<span>원~</span></div>
                                </div>
                            </a>
                        </li>
                    </ul> <!--//Recom_Prd--> 
                </div> <!---//Cts_Center-->
            </div><!-- //div#section2 -->

            <div id="section3">
                <!---sec03_bnr-->
                <div class="sec03_bnr">
                    <ul>
                        <li><a href="#"><img src="../image/bnr01.jpg" alt="주말확정여행"  /></a></li>
                        <li><a href="#"><img src="../image/bnr02.jpg" alt="가을꽃잔치여행지"  /></a></li>
                    </ul>
                </div> <!---//sec03_bnr-->
            </div><!-- //div#section3 -->
                
            <div id="section4">
                <!---Cts_Center-->
                <div class="cts_center">
                    <!--Tit_Area-->
                    <div class="tit_area">
                    <h3 class="sec_t04">전국 방방콕콕 먹방여행</h3>
                    </div>
                    <!--//Tit_Area--> 
                    
                
                    <!--//M_PrdList--> 
                    <div class="m_prdlist">
                        <ul class='slider m_prd01'>
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/강건물배_1920.jpg"  alt="[당일]◐금산★리무진버스◑금산별미맛기행9탄!자연체험과휴양~대전상소동휴양림+이국적돌탑+보양식~금산인산삼계탕제공+인삼시장+뿌리공원+월영산출렁다리" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                        <div class="m_prdtit">[당일]◐금산★리무진버스◑금산별미맛기행9탄!자연체험과휴양~대전상소동휴양림+이국적돌탑+보양식~금산인<font style='letter-spacing:0px'>...</font></div>
                                        <div class="price_r">
                                            <div class="prd_no02">상품번호 027</div>
                                            <div class="black_price p_bold fs21">77,000<span>원~</span></div>
                                        </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                                            
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/근교건물_1920.jpg"  alt="[당일]대전별미맛기행6탄!◈보양식장어~무한리필◈+대청호오백리길(드라마촬영지)+금산핫플~월영산출렁다리+우암사적공원" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                        <div class="m_prdtit">[당일]대전별미맛기행6탄!◈보양식장어~무한리필◈+대청호오백리길(드라마촬영지)+금산핫플~월영산출렁다리<font style='letter-spacing:0px'>...</font></div>
                                        <div class="price_r">
                                            <div class="prd_no02">상품번호 024</div>
                                            <div class="black_price p_bold fs21">72,000<span>원~</span></div>
                                        </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                                                
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/빌딩야경_1920.jpg"  alt="[당일]◈명품한우~무한리필◈횡성별미맛기행3탄!원주소금산그랜드밸리(스카이타워전망대/울렁다리/출렁다리/잔도길)+걷기좋은길~구룡사금강송숲길+전통시장" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                        <div class="m_prdtit">[당일]◈명품한우~무한리필◈횡성별미맛기행3탄!원주소금산그랜드밸리(스카이타워전망대/울렁다리/출렁다리<font style='letter-spacing:0px'>...</font></div>
                                        <div class="price_r">
                                            <div class="prd_no02">상품번호 021</div>
                                            <div class="black_price p_bold fs21">72,000<span>원~</span></div>
                                        </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                                                
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/유럽풍건물_1920.jpg"  alt="[당일]▣포천이동소갈비▣포천별미맛기행4탄!철원 한탄강 주상절리길(순담계곡)+아름다운호반길 산정호수둘레길+철원고석정" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                        <div class="m_prdtit">[당일]▣포천이동소갈비▣포천별미맛기행4탄!철원 한탄강 주상절리길(순담계곡)+아름다운호반길 산정호수둘<font style='letter-spacing:0px'>...</font></div>
                                        <div class="price_r">
                                            <div class="prd_no02">상품번호 022</div>
                                            <div class="black_price p_bold fs21">75,000<span>원~</span></div>
                                        </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                                                
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/절벽위섬_1920.jpg"  alt="[1박2일]◐웰니스경남6탄★리무진버스◑경남건강오감투어여행~!통영물빛소리정원+통영요트투어+산청수선사+함양대봉산휴양림+모노레일+상림공원(회정식/산청약초정식/연잎밥)" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                        <div class="m_prdtit">[1박2일]◐웰니스경남6탄★리무진버스◑경남건강오감투어여행~!통영물빛소리정원+통영요트투어+산청수선사+<font style='letter-spacing:0px'>...</font></div>
                                        <div class="price_r">
                                            <div class="prd_no02">상품번호 142</div>
                                            <div class="black_price p_bold fs21">269,000<span>원~</span></div>
                                        </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                                                
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/풍경.jpg"  alt="[1박2일]◐강원★리무진버스◑강원맛기행7탄!청량바다~정동진레일바이크+강릉바다부채길(정동진~심곡항)+삼척초곡용굴촛대바위길+천곡황금박쥐동굴+대관령양떼목장+해신당공원(회한상차림/황태구이)" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                    <div class="m_prdtit">[1박2일]◐강원★리무진버스◑강원맛기행7탄!청량바다~정동진레일바이크+강릉바다부채길(정동진~심곡항)+삼<font style='letter-spacing:0px'>...</font></div>
                                        <div class="price_r">
                                            <div class="prd_no02">상품번호 077</div>
                                            <div class="black_price p_bold fs21">285,000<span>원~</span></div>
                                        </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                                                
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/해안절벽_1920.jpg"  alt="[1박2일]◑목포★리무진버스◑목포맛기행2탄!신안보라빛~퍼플섬+퍼플교 +목포해상케이블카+스카이워크+삼학도평화숲+(목포회정식+영광굴비)" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                    <div class="m_prdtit">[1박2일]◑목포★리무진버스◑목포맛기행2탄!신안보라빛~퍼플섬+퍼플교 +목포해상케이블카+스카이워크+삼학<font style='letter-spacing:0px'>...</font></div>
                                    <div class="price_r">
                                        <div class="prd_no02">상품번호 072</div>
                                        <div class="black_price p_bold fs21">270,000<span>원~</span></div>
                                    </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                                                
                            <li>
                                <a href="#">
                                    <div class="img02 imgLiquid"><img src="../image/trav/연안_바다.jpg"  alt="[1박2일]◐여수★리무진버스◑여수맛기행1탄!럭셔리요트투어+밤바다야경케이블카+향일암+(회정식)+(서대회정식)+(짱뚱어탕)+드넓은 갈대밭~순천만습지+순천만국가정원" /></div>
                                    <!--m_prd_box-->
                                    <div class="m_prd_box">
                                        <div class="m_prdtit">[1박2일]◐여수★리무진버스◑여수맛기행1탄!럭셔리요트투어+밤바다야경케이블카+향일암+(회정식)+(서대회정<font style='letter-spacing:0px'>...</font></div>
                                        <div class="price_r">
                                            <div class="prd_no02">상품번호 071</div>
                                            <div class="black_price p_bold fs21">275,000<span>원~</span></div>
                                        </div>
                                    </div> <!--//m_prd_box-->
                                </a>
                            </li>
                        </ul>
                    </div> <!--//M_PrdList--> 
                </div> <!---//Cts_Center-->
            </div><!-- //div#section4 -->
        </div> <!-- //div#blind -->

        <div id="blind">
            <div id="footer"> 
  
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
    </div> <!-- //div #wrap -->
</body>
</html>