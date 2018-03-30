<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<link rel="stylesheet" href="../css/global.css" />
<link rel="stylesheet" href="../layui/css/layui.css" />
<title>订餐统计</title>
</head>
<body>
<ul class="layui-nav head">
	<li class="layui-nav-item">
		<a href="">个人中心</a>
	</li>
	<li class="layui-nav-item" lay-unselect="">
		<a href="javascript:;"><img src="http://t.cn/RCzsdCq" class="layui-nav-img">管理员</a>
		<dl class="layui-nav-child">
			<dd><a href="javascript:;">立马离开</a></dd>
		</dl>
	</li>
</ul>


<div class="main">
	<div class="layui-form">
		<div class="bar">
			<div class="flex">
				<div class="layui-inline">
					<label class="layui-form-label">部门</label>
					<div class="layui-input-block margin0 marginright5 width182">
						<select name="province" lay-filter="province" class="province">
							<c:forEach var="dl" items="${dList}">
								<option value="${dl.id}">${dl.departmentName}</option>
							</c:forEach>
						</select>
					</div>
					
					
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">人员</label>
					<div class="layui-input-block margin0 marginright5 width188">
						<select name="city" lay-filter="city" >
							<c:forEach var="ul" items="${uList}">
								<option value="${ul.id}">${ul.name}</option>
							</c:forEach>
						</select>
					</div>	
				</div>
				
				<div class="layui-inline">
					<label class="layui-form-label">订餐数量</label>
					<div class="layui-input-inline">
						<input name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input" type="number">
					</div>
			    </div>
			    <button class="layui-btn">确定</button>
			</div>

	    </div>
	    <div class="bar">
			<div class="layui-inline">
				<label class="layui-form-label">选择日期</label>
				<div class="layui-input-inline">
					<input class="layui-input width" id="test1" placeholder="年-月-日" type="text">
				</div>
			</div>	
	    </div>
	</div>
	
	<div class="bar infor">
		<p class="msg">对不起，暂时查询不到您所查询的数据！</p>
		<table class="layui-table TableIsData">
				<thead>
					<tr>
						<th>名称</th>
						<th>01</th>
						<th>03</th>
						<th>04</th>
						<th>05</th>
						<th>06</th>
						<th>07</th>
						<th>08</th>
						<th>09</th>
						<th>10</th>
						<th>11</th>
						<th>12</th>
						<th>13</th>
						<th>14</th>
						<th>15</th>
						<th>16</th>
						<th>17</th>
						<th>18</th>
						<th>19</th>
						<th>20</th>
						<th>21</th>
						<th>22</th>
						<th>23</th>
						<th>24</th>
						<th>25</th>
						<th>26</th>
						<th>27</th>
						<th>28</th>
						<th>29</th>
						<th>30</th>
						<th>31</th>
						<th>统计</th>
					</tr> 
				</thead>
				<tbody>
					<tr>
						<td>鲁嘉舟</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>/</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
	</div>
	
</div>
</body>
</html>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">
/*配置address.js的路径*/
layui.config({
	base : 'layui/lay/modules/'
}).extend({
	'address':'address'
});

layui.use(['form','laydate','address','element','jquery'], function(){
	var laydate = layui.laydate,
		$ = layui.$;
		element = layui.element,
    	address = layui.address();
	
	/*启用时间插件*/
	laydate.render({
		elem: '#test1'
	});
	
	/*判断当前表格中是否有数据*/
	var len = $('.TableIsData tbody td').length;
	if(len > 0){
		$('.msg').hide();
		$('.TableIsData').show();
	}else{
		$('.msg').show();
		$('.TableIsData').hide();
	}
});
	

</script>









































