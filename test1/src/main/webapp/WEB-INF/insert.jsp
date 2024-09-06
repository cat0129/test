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
			<div>제품이름 : <input type="text" placeholder="제품명 입력" v-model="productName"></div>
			<div>제품가격 : <input type="text" placeholder="가격입력" v-model="productPrice"></div>
			<button @click="fnCheckDupl">저장</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productName : "",
				productPrice : "",
				isDupl : false
            };
        },
        methods: {
            
			fnCheckDupl(){
				var self = this;
				var nparmap = {productName:self.productName};
				$.ajax({
					url:"duplicate.dox",
					dataType:"json",
					type:"POST",
					data:nparmap,
					success:function(data){
						console.log(data);
						if(data.result=="alreadyExist"){
							self.isDupl=true;
							alert("중복");
						} else{
							var nparmap = {productName:self.productName, productPrice:self.productPrice};
							$.ajax({
								url:"insert.dox",
								dataType:"json",	
								type : "POST", 
								data : nparmap,
								success : function(data) { 
									if(data.result=="success"){
										alert("등록 성공");
										location.href="test.do"
									}
									
								}
							});
						}
					}
				})
			}
		
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>
​