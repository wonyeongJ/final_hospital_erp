<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">

<h1>수술실/비품관리</h1>
	<br>
<h2>비품 조회</h2>
	<br><br>

	<div class="pd-20 card-box mb-30">
		<div class="clearfix mb-20">
			<div class="pull-left">
				<a href="list" class="btn btn-outline-primary header-white">의자</a>
				<a href="list" class="btn btn-outline-primary header-white">책상</a>
				<a href="list" class="btn btn-outline-primary header-white">노트북</a>
				<a href="list" class="btn btn-outline-primary header-white">전체보기</a>
			</div>
			<div class="pull-right">
				'대여가능'만 보기 <input type="checkbox" checked="" class="switch-btn" data-size="" data-color="#0099ff" data-switchery="true" style="color: rgb(0, 153, 255);">
			</div>
		</div>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">no</th>
					<th scope="col">항목</th>
					<th scope="col">시리얼넘버</th>
					<th scope="col">대여자</th>
					<th scope="col">대여가능여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>노트북</td>
					<td><a id="a1" onclick="window.open('detail', '비품 등록', 'width=800, height=750')">NOTEBOOK001</a></td>
					<td>박병웅</td>
					<td><span class="badge badge-secondary">대여불가</span></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>노트북</td>
					<td><a id="a1" onclick="window.open('detail', '비품 등록', 'width=800, height=750')">NOTEBOOK002</a></td>
					<td>최경묵</td>
					<td><span class="badge badge-success"><a onclick="window.open('#', '비품 예약', 'width=800, height=770')" id="a2">반납하기</a></span></td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>노트북</td>
					<td><a id="a1" onclick="window.open('detail', '비품 등록', 'width=800, height=750')">NOTEBOOK003</a></td>
					<td>-</td>
					<td><span class="badge badge-primary"><a onclick="window.open('reservation', '비품 예약', 'width=800, height=850')" id="a2">대여하기</a></span></td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>책상</td>
					<td><a id="a1" onclick="window.open('detail', '비품 등록', 'width=800, height=750')">DESK001</a></td>
					<td>-</td>
					<td><span class="badge badge-primary"><a onclick="window.open('reservation', '비품 예약', 'width=800, height=850')" id="a2">대여하기</a></span></td>
				</tr>
			</tbody>
		</table>
		<div class="collapse collapse-box" id="basic-table">
			<div class="code-box">
				<div class="clearfix">
					<a href="javascript:;" class="btn btn-primary btn-sm code-copy pull-left" data-clipboard-target="#basic-table-code"><i class="fa fa-clipboard"></i> Copy Code</a>
					<a href="#basic-table" class="btn btn-primary btn-sm pull-right" rel="content-y" data-toggle="collapse" role="button"><i class="fa fa-eye-slash"></i> Hide Code</a>
				</div>
				<pre><code class="xml copy-pre hljs" id="basic-table-code">
					<span class="hljs-tag">&lt;<span class="hljs-name">table</span> <span class="hljs-attr">class</span>=<span class="hljs-string">"table"</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">thead</span>&gt;</span>
						<span class="hljs-tag">&lt;<span class="hljs-name">tr</span>&gt;</span>
						<span class="hljs-tag">&lt;<span class="hljs-name">th</span> <span class="hljs-attr">scope</span>=<span class="hljs-string">"col"</span>&gt;</span>#<span class="hljs-tag">&lt;/<span class="hljs-name">th</span>&gt;</span>
						<span class="hljs-tag">&lt;/<span class="hljs-name">tr</span>&gt;</span>
					<span class="hljs-tag">&lt;/<span class="hljs-name">thead</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">tbody</span>&gt;</span>
						<span class="hljs-tag">&lt;<span class="hljs-name">tr</span>&gt;</span>
						<span class="hljs-tag">&lt;<span class="hljs-name">th</span> <span class="hljs-attr">scope</span>=<span class="hljs-string">"row"</span>&gt;</span>1<span class="hljs-tag">&lt;/<span class="hljs-name">th</span>&gt;</span>
						<span class="hljs-tag">&lt;/<span class="hljs-name">tr</span>&gt;</span>
					<span class="hljs-tag">&lt;/<span class="hljs-name">tbody</span>&gt;</span>
					<span class="hljs-tag">&lt;/<span class="hljs-name">table</span>&gt;</span>
				</code></pre>
			</div>
		</div>
		<div class="clearfix mb-20">
			<div class="pull-right">
				<input type="button" class="btn btn-outline-primary header-white" value="비품등록" onclick="window.open('add', '비품 등록', 'width=800, height=750')">
				<input type="button" class="btn btn-outline-primary header-white" value="항목관리" onclick="window.open('categories', '비품 항목 관리', 'width=800, height=750')">
			</div>
		</div>
	</div>

	<script src="/src/plugins/switchery/switchery.min.js"></script>