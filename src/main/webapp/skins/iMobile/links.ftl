<#include "macro-head.ftl">
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<@head title="${linkLabel} - ${blogTitle}">
<meta name="keywords" content="${metaKeywords},${linkLabel}">
<meta name="description" content="${metaDescription},${linkLabel}">
</@head>
</head>
<body>
<#include "side.ftl">
<main class="classify">
<article>
<header><h2><a rel="archive" href="/links.html"><li class="icontitle iconfont icon-lianjie"></li>${linkLabel}</a></h2></header>
<#if 0 != links?size>
<ul class="tags fn-clear">
	<#list links as link>
	<li>
		<a rel="friend" href="${link.linkAddress}" class="tag itip" id="link-${link_index}" lang="${link.linkDescription}" data-point="3" target="_blank">
			<img src="${faviconAPI}<#list link.linkAddress?split('/') as x><#if x_index=2>${x}<#break></#if></#list>" width="16" height="16"/>
			${link.linkTitle}
		</a>
	</li>
	</#list>
</ul>
</#if>
<#-- 若使用请修改为自己的，建议使用草稿夹中的文章链接
<footer>
<h4><span class="iconfont icon-haoyou"></span>可爱的小伙伴可以在这 <a rel="archive" href="/befriendswithme.html">申请友链</a></h4>
</footer>
-->
</article>
<#include "footer.ftl">
</main>
</body>
</html>