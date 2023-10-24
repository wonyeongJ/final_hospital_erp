<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>


				<!-- Bordered table  start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
							<div class="pull-left">
								<h2 class="text-black h2 text-center">공지사항</h2>
								<span>
									<label for="pageSizeSelect">표시 개수 : </label>
						            <select id="pageSizeSelect">
						                <option value="10">10개씩 보기</option>
						                <option value="25">25개씩 보기</option>
						                <option value="50">50개씩 보기</option>
						                <option value="all">전체 보기</option>
						            </select>
								</span>
							</div>
							
					</div>
					<div>
							<div class="pull-right">
							<!-- 검색 부분 -->
								<div class="search">
									<form method="get" name="search" action="/#">
										<table class="pull-right">
											<tr>
												<td><select name="kind" id="k" class="input-select" aria-label="Default select example">
													<!-- <option class="kind" value="proName">NO</option>
													<option class="kind" value="proContents">상품설명</option>
													<option class="kind" value="userId">이름</option> -->
												</select></td>
												<td><input type="text" name="search" value="${pager.search}" class="form-control" placeholder="Search here">
												</td>
												<td><button type="submit" class="search-btn">검색</button></td>
				                                 <!-- 선택된 condition을 hidden input으로 추가 -->
				                             <input type="hidden" name="condition" value="${param.condition}">
				                            <%--  <input type="hidden" name="catNo" value="${param.catNo}"> --%>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
						
						
								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col">NO</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성날짜</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">1</th>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">1</th>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">1</th>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
											<td>0</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
											<td>0</td>
										</tr>
									</tbody>
								</table>
								
								
									  <!-- ... (페이징 및 검색 부분) ... -->
										  
									  <nav aria-label="Page navigation example" class="text-center"> <!-- Add 'text-center' class here -->
										<ul class="pagination justify-content-center"> <!-- Add 'justify-content-center' class here -->
										 <c:if test="${pager.pre}">
											 <li class="page-item">
												 <a class="page-link" href="/#&page=${pager.startNum - 1}" aria-label="Previous">
													 <span aria-hidden="true">&laquo;</span>
												 </a>
											 </li>
										 </c:if>
										 <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
											 <li class="page-item"><a class="page-link" href="/#&page${param.condition}&page=${i}">${i}</a></li>
										 </c:forEach>
										 <c:if test="${pager.next}">
											 <li class="page-item">
												 <a class="page-link" href="/#&page${pager.lastNum + 1}" aria-label="Next">
													 <span aria-hidden="true">&raquo;</span>
												 </a>
											 </li>
										 </c:if>
									 </ul>
								 </nav>
								 		<div>
								 		 		<button type="button" class="btn btn-primary"><a href="./insert" style="color: white;">글쓰기</a></button>
								 		</div>
							</div>
							<!-- Bordered table End -->


	
