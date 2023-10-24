<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>전자결재</h1>
<h2>결재문서작성</h2>

<form>
	<div class="pd-20 card-box mb-30">
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" type="text">
				</div>
			</div>
			<div class="col-md-2 col-sm-12">
				<div class="form-group">
					<label>문서양식</label>
					<input class="form-control" type="text" disabled="">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2 col-sm-12">
				<div class="form-group">
					<label>사번</label>
					<input class="form-control" type="text" disabled="">
				</div>
			</div>
			<div class="col-md-2 col-sm-12">
				<div class="form-group">
					<label>이름</label>
					<input class="form-control" type="text" disabled="">
				</div>
			</div>
			<div class="col-md-2 col-sm-12">
				<div class="form-group">
					<label>소속(과)</label>
					<input class="form-control" type="text" disabled="">
				</div>
			</div>
			<div class="col-md-2 col-sm-12">
				<div class="form-group">
					<label>직무</label>
					<input class="form-control" type="text" disabled="">
				</div>
			</div>
		</div>
		
		<div class="col-md-3 col-sm-12">
			<div class="form-group">
				<label>총금액</label>
				<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
					<span class="input-group-btn input-group-prepend">
						<button class="btn btn-primary bootstrap-touchspin-down" type="button">-</button>
					</span>
					<span class="input-group-addon bootstrap-touchspin-prefix input-group-prepend">
						<span class="input-group-text">₩</span>
					</span>
					<input id="demo2" type="text" value="0" name="demo2" class="form-control">
					<span class="input-group-btn input-group-append">
						<button class="btn btn-primary bootstrap-touchspin-up" type="button">+</button>
					</span>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="row">
				<div class="col-md-1 col-sm-12">
					<label class="weight-600">휴가종류</label>
					<div class="custom-control custom-radio mb-5">
						<input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio4">연차</label>
					</div>
					<div class="custom-control custom-radio mb-5">
						<input type="radio" id="customRadio5" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio5">병가</label>
					</div>
					<div class="custom-control custom-radio mb-5">
						<input type="radio" id="customRadio6" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio6">특별</label>
					</div>
				</div>
				<div class="col-md-7 col-sm-12">
					<div class="form-group">
						<label>시작날짜</label>
						<input class="form-control date-picker" placeholder="날짜를 선택하세요" type="text">
					</div>
					<div class="form-group">
						<label>종료날짜</label>
						<input class="form-control date-picker" placeholder="날짜를 선택하세요" type="text">
					</div>
				</div>
			</div>
		</div>
	
		<div class="form-group">
			<div class="html-editor pd-20 card-box mb-30 col-md-8 col-sm-12">
				<h4 class="h4 text-blue">내용작성</h4>
				<p>결재문서의 상세내용을 작성해주세요</p>
				<textarea class="textarea_editor form-control border-radius-0" style="display: none;" placeholder="Enter text ..."></textarea>
				<input type="hidden" name="_wysihtml5_mode" value="1">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-8 col-sm-12">
				<label>첨부파일</label>
				<input type="file" class="form-control-file form-control height-auto">
			</div>
		</div>
		
	</div>


</form>