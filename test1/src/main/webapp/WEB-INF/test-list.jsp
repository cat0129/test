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
		<input type="text" placeholder="1~15 입력 (pk값)" v-model="productNo">
		<button @click="fnSearchItem()">검색</button>
		<div v-if="productNo!=''">
			<div>제품번호 : {{data.searchItem.productNo}} </div>
			<div>제품명 : {{data.searchItem.productName}}</div>
			<div>제품가격 : {{data.searchItem.productPrice}}
				<input type="text" placeholder="가격입력" v-model="productPrice" v-if="fnUpdate">
			</div>
			<button @click="fnUpdate">수정</button>
			<button @click="fnDelete">삭제</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo : "",
				productPrice : "",
				data : {}
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
						self.data = data;
						
					}
				});
            },
			fnUpdate(){
				var self = this;
				var nparmap = {productNo:self.productNo, productPrice:self.productPrice};
				$.ajax({
					url:"update.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
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
					}
				});
			}
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>
​