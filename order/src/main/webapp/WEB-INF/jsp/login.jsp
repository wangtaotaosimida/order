<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".d").change(function(){
			var d = $(".d").val();
			$.ajax({
				url : 'selectUL',
				type : 'POST',
				cache : false,
				async : true,
				data : {"dID":d},
				success : function(data, textStatus, jqXHR){
					console.log(data)
					$(".u").empty()
					str='';
			        for(var i=0;i<data.vaules.length;i++){
			        	 str+="<option value='"+data.vaules[i].id+"'>"+data.vaules[i].name+"</option>";
			        }
			        $(".u").append(str);
				},
				error : function(request, textStatus, errorThrown) {
					
				}
			});
		});
		
		$("#ok").click(
			function(){
				var dId = $(".d").val();
				var uId = $(".u").val();
				var foodCount = $("#foodCount").val();
				
				$.ajax({
					url : 'addRecord',
					type : 'POST',
					cache : false,
					async : true,
					data : {"dId":dId,"uId":uId,"foodCount":foodCount},
					success : function(data, textStatus, jqXHR){
						console.log(data)
						if(data.status == 0){
							alert("点餐成功");
						}else{
							alert("点餐失败");
						}
					},
					error : function(request, textStatus, errorThrown) {
						
					}
				});
			});
		
		var myDate = new Date();
		var year=myDate.getFullYear();
		//获取当前月
		var month=myDate.getMonth()+1;
		
		var $option=$(".m").find("option");
		for(var i=0;i<$option.length;i++){
			var z2=$option.eq(i).val();
			if(z2==month){
				$(".m").val(month)
			}
		}
		
		var getDate = mGetDate(year,month);
		
		$(".countTable").empty()
		str='';
        for(var i=0;i<=getDate+1;i++){
        	if(i==0){
        		str+="<td style='width:80px' align='center'>名称</td>";
        	}else if(i==getDate+1){
        		str+="<td style='width:60px' align='center' class='count'>统计</td>";
        	}else{
        		str+="<td style='width:30px' align='center'>"+i+"</td>";
        	}
        }
        $(".countTable").append(str);
		
        str2='';
        var sum = 0;
        var sumCount = 0;
        	$.ajax({
				url : 'selectAll',
				type : 'POST',
				cache : false,
				async : true,
				data : {"uId":1},
				success : function(data, textStatus, jqXHR){
					console.log(data)
					 
					for(var k=0;k<data.vaules.length;k++){
						if(){
							
						}
					}
					
					
					 for(var i=1;i<getDate+2;i++){
						 for(var j=0;j<data.vaules.length;j++){
								var unixTimestamp = new Date(data.vaules[j].createDate) ;
								commonTime = unixTimestamp.getDate();
								if(i==commonTime){
									sum++;
								}
							}
						 sumCount+=sum;
						 if(i == getDate+1){
							 str2+="<td style='width:30px' align='center' class='count'>"+sumCount+"</td>";
							 sum=0;
						 }else{
							 str2+="<td style='width:30px' align='center'>"+sum+"</td>";
							 sum=0;
						 }
					 }
					
					str1="";
			        
			        str1+="<tr><td align='center'>陈功</td>"+str2+"</tr>";
			        $(".addTr").append(str1);
				},
				error : function(request, textStatus, errorThrown) {
					
				}
			});
        	
        	
        	/* str3 = "";
        	$.ajax({
				url : 'selectInfo',
				type : 'POST',
				cache : false,
				async : true,
				data : {"uId":2},
				success : function(data, textStatus, jqXHR){
					console.log(data)
					 sumCount=0;
					
					 for(var i=1;i<getDate+2;i++){
						 for(var j=0;j<data.vaules.length;j++){
								var unixTimestamp = new Date(data.vaules[j].createDate) ;
								commonTime = unixTimestamp.getDate();
								if(i==commonTime){
									sum++;
								}
							}
						
						 sumCount+=sum;
						 if(i == getDate+1){
							 str3+="<td style='width:30px' align='center' class='count'>"+sumCount+"</td>";
							 sum=0;
						 }else{
							 str3+="<td style='width:30px' align='center'>"+sum+"</td>";
							 sum=0;
						 }
					 }
					
					str1="";
			        
			        str1+="<tr><td align='center'>陈法明</td>"+str3+"</tr>";
			        $(".addTr").append(str1);
				},
				error : function(request, textStatus, errorThrown) {
					
				}
			}); 
        	
        	str4 = "";
        	$.ajax({
				url : 'selectInfo',
				type : 'POST',
				cache : false,
				async : true,
				data : {"uId":3},
				success : function(data, textStatus, jqXHR){
					console.log(data)
					 sumCount=0;
					
					 for(var i=1;i<getDate+2;i++){
						 for(var j=0;j<data.vaules.length;j++){
								var unixTimestamp = new Date(data.vaules[j].createDate) ;
								commonTime = unixTimestamp.getDate();
								if(i==commonTime){
									sum++;
								}
							}
						
						 sumCount+=sum;
						 if(i == getDate+1){
							 str4+="<td style='width:30px' align='center' class='count'>"+sumCount+"</td>";
							 sum=0;
						 }else{
							 str4+="<td style='width:30px' align='center'>"+sum+"</td>";
							 sum=0;
						 }
					 }
					
					str1="";
			        
			        str1+="<tr><td align='center'>张珊珊</td>"+str4+"</tr>";
			        $(".addTr").append(str1);
				},
				error : function(request, textStatus, errorThrown) {
					
				}
			});  */
        
       /*  str1+="<tr><td align='center'>陈法明</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>张珊珊</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>姚颖</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>袁艺璇</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>文思弋</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>李卓</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>江梦舲</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>鲁嘉舟</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>曾杰</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>胡宽</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>盛旺</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>彭百强</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>王涛涛</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>邢凡波</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>文森琦</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>唐昌登</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>王超</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>汤豪杰</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>张璋</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>黄彦菲</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>梁小龙</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>朱唯澳</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>卢玮环</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>周桂芳</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>杨胜前</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>潘菊霞</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>肖雨婷</td>"+str2+"</tr>"
        str1+="<tr><td align='center'>黎也</td>"+str2+"</tr>" */
        
       
        
	});
	
	
	
	
	function mGetDate(year, month){
	    var d = new Date(year, month, 0);
	    return d.getDate();
	}
</script>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<td>部门：</td>
				<td>
					<select class="d">
						<c:forEach var="dl" items="${dList}">
							<option value="${dl.id}">${dl.departmentName}</option>
						</c:forEach>
					</select>
				</td>
				<td>部门人员：</td>
				<td>
					<select class="u">
						<c:forEach var="ul" items="${uList}">
							<option value="${ul.id}">${ul.name}</option>
						</c:forEach>
					</select>
				</td>
				<td>餐份数：</td>
				<td><input type="text" id="foodCount" size="5"></td>
				<td><input type="button" id="ok" value="确认"></td>
			</tr>
		</table>
		<table border="1">
			<tr>
				<td>请选择年份：</td>
				<td>
					<select>
						<option>2018</option>
						<option>2019</option>
					</select>
				</td>
				<td>请选择月份：</td>
				<td>
					<select class="m">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select>
				</td>
			</tr>
		</table>
		<table border="1" class="addTr">
			<tr class="countTable">
			</tr>
		</table>		
	</div>
</body>
</html>