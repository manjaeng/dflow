﻿

<nav id="floatNav" class="floatNav">
	<!-- <button type="button" class="bt refresh">Refresh</button> -->
	<!-- <button type="button" class="bt top">TOP</button> -->
	<button type="button" class="bt prf" onclick="togThumbMode();">Tog</button>
	<button type="button" class="bt sch" onclick="popSearch();">검색</button>
</nav>

<nav id="menubar" class="menubar">
	<div class="inner">
		<ul class="menu">
			<li class="home"><a href="../home/home.jsp">HOME</a></li>
			<li class="adds"><a href="javascript:;" onclick="popLookReg();">[<em>+</em>]</a></li>
			<li class="look"><a href="javascript:;" id="btnLookAct">LOOK</a></li>
			<li class="mypg"><a href="../mypage/profile.jsp">MY</a></li>
		</ul>
	</div>
</nav>


<script>	
$(document).ready(function(){
	
	var tapped = false;
	$(document).on("click","#btnLookAct",function(e){
		if ( !$(this).closest("li").hasClass("active") ) {
			location.href = "../look/look.jsp";
			return;
		}
		
		if( !tapped ){ // single_tap 
			tapped = setTimeout(function(){			
				tapped = null;
				console.log("싱글터치");
				location.href = "../look/look.jsp";
			},300); //wait 300ms
		}else{  // double_tap
			clearTimeout(tapped);
			tapped = null;
			console.log("더블터치");
			if( $(this).closest("li").hasClass("on") ){
				$(this).closest("li").removeClass("on");
			}else{
				$(this).closest("li").addClass("on");
			}
			return false;
		}
	});
});
</script>