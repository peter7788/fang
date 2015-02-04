//禁止左键、右键、F2~F12
//created by 邱越俊
function forbid_copy() {
	document.oncontextmenu=new Function("event.returnValue=false");
	document.onselectstart=new Function("event.returnValue=false");
	document.onkeydown = function(){   
		if(window.event && window.event.keyCode == 113) {   
			window.event.returnValue=false;
			return(false);  
		}   
		if(window.event && window.event.keyCode == 114) {   
			window.event.returnValue=false;
			return(false); 
		}   
		if(window.event && window.event.keyCode == 115) {   
			window.event.returnValue=false;
			return(false); 
		}   
		if(window.event && window.event.keyCode == 116) {   
			window.event.returnValue=false;
			return(false);  
		}   
		if(window.event && window.event.keyCode == 117) {   
			window.event.returnValue=false;
			return(false); 
		}   
		if(window.event && window.event.keyCode == 118) {   
			window.event.returnValue=false;
			return(false); 
		}   
		if(window.event && window.event.keyCode == 119) {   
			window.event.returnValue=false;
			return(false); 
		}   
		if(window.event && window.event.keyCode == 120) {   
			window.event.returnValue=false;
			return(false);  
		}   
		if(window.event && window.event.keyCode == 121) {   
			window.event.returnValue=false;
			return(false); 
		}   
		if(window.event && window.event.keyCode == 122) {   
			window.event.returnValue=false;
			return(false); 
		}   
		if(window.event && window.event.keyCode == 123) {   
			window.event.returnValue=false;
			return(false);  
		}
	}
}