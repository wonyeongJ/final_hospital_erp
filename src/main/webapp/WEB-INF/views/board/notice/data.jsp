<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    	 	
<div class="container-fluid">
    <div>
        <div>
            <div class="row justify-content-center my-4">
                <h1 class="col-md-7 text-center">공지사항 상세</h1>
            </div>

            <section>
                <div class="row justify-content-center my-4">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-text">작성자 : ${data.memCd}</span>
                        </div>

                        <div class="mb-3">
                            <label for="not_title" class="form-label">제목</label>
                            <div>${data.notTitle}</div>
                        </div>

                        <div class="mb-3">
                            <label for="not_contents" class="form-label">내용</label>
                            <div>${data.notContents}</div>
                        </div>

                        <div>
                            <c:forEach items="${data.list}" var="f">
                                <a href="./fileDown?bfCd=${f.bfCd}">${f.bfOname}</a>
                            </c:forEach>
                        </div>

                        <!-- 글 수정, 삭제는 인사과만 버튼이 보여집니다 -->
                        <div class="mb-3">
                            <button class="btn btn-primary" type="button"><a href="../update/${data.notCd}" style="color: white;">글 수정</a></button>
                            <button class="btn btn-primary" type="submit" id="btn-delete">글 삭제</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

