<script src="//lib.baomitu.com/jquery/2.2.4/jquery.min.js"></script>
<div class="side">
<div class="overlay"><a href="javascript:void(0);" class="toc-btn iconfont icon-liebiao itip ifixed" id="art_dir" lang="${tocLabel}"></a></div>
<header class="content">
<a href="/">
	<img class="avatar itip ifixed" id="logoicon" src="${adminUser.userAvatar}" title="${blogTitle?html}" alt="${blogTitle?html}"
	lang="使用移动设备访问<br><img src='http://qr.liantu.com/api.php?text=${servePath}' width='123' height='123' border='1'>"/>
</a>
<hgroup><h1><a href="javascript:void(0);">${blogTitle}</a></h1></hgroup>
<p class="subtitle">${blogSubtitle}</p>
<nav>
	<ul>
		<li>
		  <a href="/archives.html"><span class="iconfont icon-rili itip ifixed" id="archives" lang="${archiveLabel}"></span></a><a href="/tags.html"><span class="iconfont icon-biaoqian itip ifixed" id="tags" lang="${allTagsLabel}"></span></a><a href="/dynamic.html"><span class="iconfont icon-jiaoyin itip ifixed" id="dynamic" lang="${dynamicLabel}"></span></a><a href="/links.html"><span class="iconfont icon-lianjie itip ifixed" id="links" lang="${linkLabel}"></span></a><a href="/search?keyword="><span class="iconfont icon-sousuo18 itip ifixed" id="search" lang="${searchLabel}"></span></a>
		</li>
		<#if 0 != pageNavigations?size>
		<li class="hide">
		  <#list pageNavigations as page>
			<a href="${page.pagePermalink}" target="${page.pageOpenTarget}">${page.pageTitle}</a>&nbsp;
		  </#list>
		</li>
		</#if>
	</ul>
</nav>
</header>
<footer>
<div><h5>一身转战三千里，一剑曾当百万师。</h3></div>

<div>
	<a href="https://github.com/ningjianguo/">
	  <span class="iconfont icon-github mysites itip ifixed" id="mygit" lang="Github"></span>
  </a> &nbsp;&nbsp;
	<a href="https://weibo.com/ningjianguo/">
	  <span class="iconfont icon-wb mysites itip ifixed" id="myweibo" lang="官方微博"></span>
  </a> &nbsp;&nbsp;
	<a href="http://images.ningjianguo.xyz/Fq8BBIOus5BIlkk5gOsWiDj-CVJC" rel="nofollow">
	  <span class="iconfont icon-weixin1 mysites itip ifixed" id="mywechat"
		 lang="<b>&nbsp;&nbsp;扫一扫加我哦，等你</b><br><img src='http://images.ningjianguo.xyz/Fq8BBIOus5BIlkk5gOsWiDj-CVJC' width='123' height='123'/>"></span>
	</a> &nbsp;&nbsp;
	<a href="tencent://message/?uin=1195726908&Menu=yes& Service=300&sigT=42a1e5347953b64c5ff3980f8a6e644d4b31456cb0b6ac6b27663a3c4dd0f4aa14a543b1716f9d45">
	  <span class="iconfont icon-qq1 mysites itip ifixed" id="myqq" lang="QQ消息" rel="nofollow"></span>
  </a>
</div>
</footer>
</div>