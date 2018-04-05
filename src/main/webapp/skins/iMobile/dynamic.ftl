<#include "macro-head.ftl">
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<@head title="${dynamicLabel} - ${blogTitle}">
<meta name="keywords" content="${metaKeywords},${dynamicLabel}">
<meta name="description" content="${metaDescription},${dynamicLabel}">
</@head>
<style>.dynamic pre{overflow-x:auto;}</style>
</head>
<body>
<#include "side.ftl">
<main class="dynamic">
<article>
	<header>
		<h2>
			<a rel="archive" href="/dynamic.html"><li class="icontitle iconfont icon-jiaoyin"></li>${dynamicLabel}</a>
		</h2>
	</header>
	<#if 0 != recentComments?size>
	<ul class="comments" id="comments">
		<#list recentComments as comment>
		<#if comment_index < 11>
		<li>
			<img class="avatar" title="${comment.commentName}" alt="${comment.commentName}" src="${comment.commentThumbnailURL}">
			<div class="content">
				<div class="fn-clear post-meta">
					<span class="fn-left">
						<#if "http://" == comment.commentURL>
						<span>${comment.commentName}</span>
						<#else>
						<a href="${comment.commentURL}" target="_blank">${comment.commentName}</a>
						</#if>
						<time><span class="icon-date"></span> ${comment.commentDate?string("yy-MM-dd HH:mm")}</time> 
					</span>
					<a class="fn-right itip" id="goto_${comment_index}" href="${comment.commentSharpURL}" lang="${viewLabel}"><span class="iconfont icon-kaishi"></span></a>
				</div>
				<div class="comment-content">${comment.commentContent}</div>
			</div>
		</li>
		</#if>
		</#list>
	</ul>
	</#if>
</article>
<#if 0 != mostCommentArticles?size || 0 != mostViewCountArticles?size>
<#if 0 != mostCommentArticles?size>
<article>
	<header>
		<h2 class="dynamic-title"><li class="icontitle iconfont icon-huo"></li>
			${mostCommentArticlesLabel}
		</h2>
	</header>
	<ul>
		<#list mostCommentArticles as article>
		<li>
			<a href="${article.articlePermalink}" title="${article.articleTitle}" rel="nofollow">${article.articleTitle}</a>
			<span data-ico="&#xe14e;">${article.articleCommentCount}</span>
		</li>
		</#list>
	</ul>
</article>
</#if>
<#if 0 != mostViewCountArticles?size>
<article>
	<header>
		<h2 class="dynamic-title"><li class="icontitle iconfont icon-youxiu"></li>
			${mostViewCountArticlesLabel}
		</h2>
	</header>
	<ul>
		<#list mostViewCountArticles as article>
		<li>
			<a href="${article.articlePermalink}" title="${article.articleTitle}" rel="nofollow">${article.articleTitle}</a>
			<span data-ico="&#xe185;">${article.articleViewCount}</span>
		</li>
		</#list>
	</ul>
</article>
</#if>
</#if>
<#include "footer.ftl">
</main>
<script>
var $commentContents = $(".comments .comment-content");
for (var i = 0; i < $commentContents.length; i++) {
	var str = $commentContents[i].innerHTML;
	$commentContents[i].innerHTML = Util.replaceEmString(str);
}
</script>
</body>
</html>