layui.define(["jquery"],function(exports){
	var $ = layui.jquery;
	var fn = {
		
		m:'可配置的服务端地址',
		
		/********** 数据加载动画 *********
		 * 无需要参数，直接调用即可 
		 * */
		loadAnimateFn:function(){
			$('body').append('<div class="iDiv"><img class="loadingImg" src="images/loading-0.gif" /></div>');	
		},
		
		/********** 移除加载动画 *********
		 * 无需要参数，直接调用即可 
		 * */
		removeAnimate:function(){
			$('.iDiv').remove();	
		},
		
		/********* ajax请求 *********
		 * murl  		请求地址（必填参数）  			url
		 * mtype 		请求类型（必填参数）			get/post
		 * mdata 		请求数据（必填参数）			对象
		 * isAsync		异步或同步请求（必填参数）		true/fales
		 * misJson 		请求格式（必填参数）			true/fales
		 * isAM 		请求加载的动画（必填参数）		true/fales
		 * success 		成功请求					fn
		 * */
		method:function(murl,mtype,mdata,isAsync,misJson,isAM,success){
			var ajax = {
				type:mtype,
				url:murl,
				async:isAsync,
				data:mdata,
				dataType:'json',
				beforeSend:function(){
					if(isAM){fn.loadAnimateFn();}
				},
				success:function(res){
					success?success(res):function(){}
				},
				error:function(err){
					console.log(err);
					console.log('请求错误!');
					fn.removeAnimate();
				},
				complete:function(){
					fn.removeAnimate();
				}
			}
			
			if (misJson){
				ajax.contentType="application/json;charset=utf-8";
				ajax.data = JSON.stringify(mdata);
			}else {
				ajax.data = mdata;
			}
			
			$.ajax(ajax);
		},
		
		/********* 发送验证码   *********
		 * obj  点击的对象		必填
		 * time 倒计时的秒数	选填...(注:不填时默认为30秒)
		 * */
		sendCode:function(obj,time,classname){
			var txt = obj.text();
			var closeTime = null;
			time?time:time=30;
			classname?classname:classname=null;
			closeTime = setInterval(function(){
				if(time>1){
					time--;
					obj.text('已发送 '+time).attr('disabled',true).addClass(classname);	
				}else{
					clearInterval(closeTime);
					obj.text(txt).attr('disabled',false).removeClass(classname);
				}
			},1000)
		},
		
		/********* 计算数量，增添、递减   *********
		 * type  当前类型          add（增加）/reduce（递减）   必填(如：需要添加请传递add，否则reduce)
		 * txt	   需要改变内容的对象					必填	
		 * num   需要添加、递减的值					必填
		 * max	   最大值							选填(注：多半为当前最大库存)
		 */
		calcNumber:function(type,txt,num,max){
			if(type == 'add'){
				num++;
				max?max:max=99999999999999999;
				if(num<=max){
					txt.val(num);	
				}
				return false;
			}
			if(type == 'reduce'){
				num--;
				if(num>0){
					txt.val(num);	
				}
				return false;	
			}
		},
		
		/********* 移除DOM元素   *********
		 * dom 需要移除元素的父元素   必填
		 * */
		removeDOM:function(dom){
			dom.empty();
		},
		
		/********* 解析地址栏    *********   
		 * name 筛选地址栏中需要提取的参数   必填 
		 * */
		getQueryString:function(name){
			var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if(r!=null)return  unescape(r[2]); 
			return null;
		},
		
		/********* lay渲染下拉框（含默认选中值）    *********   
		 * obj 需要渲染下拉框的父元素   		必填（注：用于区分其他下拉框） 
		 * v   渲染下拉框的值			必填 
		 * */
		renderSelect:function(obj,v){
			var lens = obj.find('.layui-anim dd').length;
			for(var i=0;i<lens;i++){
				var value = obj.find('.layui-anim dd').eq(i).attr('lay-value');
				if(v == value){
					obj.find('select[name="city"] option').eq(i).attr('selected',true);
					obj.find('.layui-anim dd').eq(i).addClass('layui-this');
					obj.find('.layui-input').val($('.layui-anim dd').eq(i).text());
					return false;
				}
			}
		},
		
		/********* 根据身份证号计算年龄    *********   
		 * IDcode  正确的身份证号   	必填
		 * */
		clacAge:function(IDcode){
			/*获取输入身份证号码*/
			var UUserCard = IDcode;
			
			/*获取年龄*/
			var myDate = new Date();
			var month = myDate.getMonth() + 1;
			var day = myDate.getDate();
			
			var age = myDate.getFullYear() - UUserCard.substring(6, 10) - 1;
			if (UUserCard.substring(10, 12) < month || UUserCard.substring(10, 12) == month && UUserCard.substring(12, 14) <= day) {
				age++;
			}
			return age;	
		},
		
		/********* Tap方法 （即点击事件）  *********  
		 * Tap为兼容IOS下动态加载button以外的元素使用on方法绑定点击事件
		 * 例如：li、p、label、span等等
		 * 若需使用，请在页面中先执行fn.Tap();
		 * */
		Tap:function(){
			/*自定义tap方法*/
			$(document).on("touchstart", function(e) {
				if(!$(e.target).hasClass("disable")) $(e.target).data("isMoved", 0);
			});
			$(document).on("touchmove", function(e) {
				if(!$(e.target).hasClass("disable")) $(e.target).data("isMoved", 1);
			});
			$(document).on("touchend", function(e) {
				if(!$(e.target).hasClass("disable") && $(e.target).data("isMoved") == 0); 
				$(e.target).trigger("tap");
			});
		},
		
		/********* 页面取值为null处理  *********
		 * obj 			取值的对象		必填（注：为选中的元素或一个数组集合）
		 * OBJname		储存对象的名字	必填
		 * ATTRname		获取元素的属性名	必填
		 */
		judgeIsNull:function(obj,OBJname,ATTRname){
			obj.each(function(){
				var a = $(this).attr(ATTRname);
				var value = $(this).val();
				if($.trim(value)!=""){
					OBJname[a] = value;
				}	
			});
		},
		
		/********* 后台传值为null处理  *********
		 * PARname		后台传输的值名称	必填	
		 */
		bsParIsNull:function(PARname){
			if(!PARname){PARname=""};
			return PARname;
		}
	};
  
	/*输出global接口*/
	exports('global',fn);
});    