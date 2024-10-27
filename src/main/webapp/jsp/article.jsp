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
	<!-- //div#articleWrap -->
    <div id="articleWrap">
    	<jsp:include page="header.jsp" />
    	
    	<!-- write Modal -->
        <div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel" aria-hidden="true">
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
    </div> <!-- //div#wrap -->
    <jsp:include page="footer.jsp" />
</body>
</html>