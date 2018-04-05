<footer class="footer">
  <div class="fn-clear">
    &copy;${year} ${blogTitle?html} All Rights Reserved
    <span class="fn-right">&nbsp;
      Powered by <a href="http://b3log.org" rel="friend">B3log开源·Solo</a>
      Theme <a rel="friend" href="https://zixizixi.cn/">子兮子兮</a>
    </span>
  </div>
  <span onclick="Util.goTop()" class="icon-goup iconfont icon-rocketop itip ifixed" id="backTop" lang="飞回顶部"></span>
  <span onclick="Util.goBottom()" class="icon-fly-down iconfont icon-rocketop itip ifixed" id="backBtm" lang="飞到底部"></span>
</footer>
<#-- 我喜欢把有些可能频繁修改的 js 和 css 代码直接写在 ftl 文件里，因为写在 ftl 里修改后不需要重启服务即可直接保存查看效果，单独写在文件里必须关闭服务后才能保存修改。 -->
<script src="//pv.sohu.com/cityjson?ie=utf-8"></script>
<script>window.jQuery || document.write('<script src="/skins/${skinDirName}/js/lib/jquery/jquery.2.2.4.min.js"><\/script>');</script>
<script>$['browser']={};</script>
<script src="/skins/${skinDirName}/js/common${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<script src="/skins/${skinDirName}/js/yilia7${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<script src="/skins/${skinDirName}/js/lib/layer/layer.js?${staticResourceVersion}"></script>
<script src="/skins/${skinDirName}/js/welcome.js?${staticResourceVersion}"></script>
<style>.layui-layer-page .layui-layer-content:not(#layui-layer-photos){ overflow: hidden; }.layui-layer-resize{width:0;height:0;border-width:5px;border-style:ridge;border-color:transparent #666 #666 transparent;}</style>
<script>
  if (typeof(returnCitySN) != 'undefined') {
    console.debug("\u8bbf\u5ba2\u5730\u5740："+returnCitySN.cip+"\n\u8bbf\u5ba2\u533a\u57df："+returnCitySN.cname);
    $("#stat_copy").attr("lang","\u60a8\u662f\u6765\u81ea "+returnCitySN.cname+" \u7684\u8bbf\u5ba2");
  }
  var today = new Date().getDate();
  var latkeConfig={"servePath": "${servePath}", "staticServePath": "${staticServePath}", "isLoggedIn": "${isLoggedIn?string}", "userName": "${userName}"};
  var Label={
    "skinDirName":"${skinDirName}","em00Label":"${em00Label}","em01Label":"${em01Label}","em03Label":"${em03Label}","em04Label":"${em04Label}",
    "em05Label":"${em05Label}","em06Label":"${em06Label}","em07Label":"${em07Label}","em08Label":"${em08Label}","em09Label":"${em09Label}",
    "em10Label":"${em10Label}","em11Label":"${em11Label}","em12Label":"${em12Label}","em13Label":"${em13Label}","em14Label":"${em14Label}"
  };
  <#-- 参数说明：消息、选择器、方向(顶右底左对应1234)、是否固定 -->
  var itip = function (msg, selector, ipoint, ifixed) {
    ipoint = ipoint == undefined ? 1 : ipoint;
    layer.tips(msg, selector, {tips:[ipoint,'#333'], fixed:ifixed, time:6000});
  };
  $(function($) {
    // link target
    $("main a, footer a").not("header a,a.quote-link,.pagination a,a.tag,a[rel='prev'],a[rel='next']").attr("target", "_blank"); 
    if($("body").width() > 750) {
      if(Cookie.readCookie("showTips") != "0") {
        <#-- 鼠标悬浮提示 -->
        $(".itip").each(function(i, n) {	
          $(n).hover(function() {
            itip($(n).attr("lang"),"#"+$(n).attr("id"),$(n).data("point"),$(n).hasClass("ifixed"));
          }, function() {
            layer.closeAll('tips');
          });
        });
      }
      <#-- 鼠标点击冒泡特效 -->
      var clicksum=0;
      $("html").click(function(e) { 
        var n=18, $i; 
        clicksum++;
        if(clicksum==10) { $i=$("<b></b>").text("(๑>؂<๑）"); } 
        else if(clicksum==20) { $i=$("<b></b>").text("（｡ò ∀ ó｡）"); } 
        else if(clicksum==30) { $i=$("<b></b>").text("(๑•́ ω •̀๑)"); } 
        else if(clicksum==40) { $i=$("<b></b>").text("(๑•̀_•́๑)"); } 
        else if(clicksum==50) { $i=$("<b></b>").text("o((>ω< ))o"); } 
        else if(clicksum==60) { $i=$("<b></b>").text("٩(๑^o^๑)۶"); } 
        else if(clicksum==70) { $i=$("<b></b>").text("✧٩(ˊωˋ*)و✧"); } 
        else if(clicksum==80) { $i=$("<b></b>").text("ε٩(๑> ₃ <)۶ з"); } 
        else if(clicksum==90) { $i=$("<b></b>").text("૧(●´৺`●)૭૧(●´৺`●)૭"); } 
        else if(clicksum>=100 && clicksum<=105) { $i=$("<b></b>").text("(ꐦ°᷄д°᷅)Are you crazy？"); } 
        else { $i=$("<i class='iconfont icon-keaide'></i>"); n=Math.round(Math.random()*14+16); }
        var x=e.pageX, y=e.pageY;
        $i.css({"z-index":9999,"top":y-20,"left":x,"position":"absolute","color":"#E94F06","font-size":n,"-moz-user-select":"none", "-webkit-user-select": "none","-ms-user-select":"none"});
        $("body").append($i);
        $i.animate({"top":y-180,"opacity":0},1500,function(){$i.remove();}); 
        e.stopPropagation();
      });
      <#-- 点击图片次数 -->
      var clickimg=0;
      $("article p img, #comments img").not(".avatar").click(function(){clickimg++;var parele=$(this).parents("section")[0]||$(this).parents("div")[0];
	      if($(parele).attr("id")==undefined){$(parele).attr("id",("img-"+clickimg));} layer.photos({photos:('#'+$(parele).attr("id")),anim:5,shade:0.3}); 
      }).css("cursor", "zoom-in");
    }
  });
</script>
<#-- ${plugins} -->