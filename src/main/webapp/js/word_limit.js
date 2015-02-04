//限制字数
//给jquery对象添加自定义方法和扩展jquery类
//created by 邱越俊
$.fn.extend({
	word:function(num){
		$(this).each(function() {
			var maxwidth=num;
			if($(this).text().length>maxwidth){
				$(this).text($(this).text().substring(0,maxwidth)); 
				$(this).html($(this).html()+'...'); 
			}
		});	
	}
});