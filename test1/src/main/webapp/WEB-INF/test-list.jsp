<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>테스트 샘플 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<input type="text" placeholder="1~20 입력 (pk값)" v-model="productNo">
		<button @click="fnSearchItem()">검색</button>
		<div v-if="isView">
			<div>제품번호 : {{data.searchItem.productNo}} </div>
			<div>제품명 : {{data.searchItem.productName}}</div>
			<div>제품가격 : {{data.searchItem.productPrice}}</div>
			<div v-if="isInput"><input type="text" placeholder="가격입력" v-model="productPrice">
			<button @click="fnUpdate">저장</button></div>
		</div>
		<div>
			<button @click="fnInput">수정</button>
			<button @click="fnDelete">삭제</button>
		</div>
		<div><button @click="fnRedirect">과일 등록</button></div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo : "",
				productPrice : "",
				data : {},
				isView : false,
				isInput : false
            };
        },
        methods: {
            fnSearchItem(){
				var self = this;
				var nparmap = {productNo:self.productNo};
				$.ajax({
					url:"test.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.result);
						self.data = data;
						self.isView = true;
						if(data.result=="nonExist"){
							alert("없습니다");
						}
					}
				});
            },
			fnUpdate(){
				var self = this;
				var nparmap = {productNo:self.productNo, productPrice:self.productPrice};
				self.isInput = true;
				if(self.productPrice==''){
					alert("금액 입력하세요");
					return;
				}
				$.ajax({
					url:"update.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.result=="success"){
							alert("업데이트 성공");
							self.fnSearchItem();
						}else{
							alert("실패");
						}
					}
				});
			},
			fnDelete(){
				var self = this;
				var nparmap = {productNo:self.productNo};
				$.ajax({
					url:"delete.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);	
						if(data.result=="success"){
							alert("삭제됨");
							self.fnSearchItem();
						}
					}
				});
			},
			fnRedirect(){
				location.href="insert.do"
			},
			fnInput(){
				var self = this;
				self.isInput = true;
			}
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>
​