<#include "macro-head.ftl">
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<@head title="${allTagsLabel} - ${blogTitle}">
<meta name="keywords" content="${metaKeywords},${allTagsLabel}">
<meta name="description" content="<#list tags as tag>${tag.tagTitle}<#if tag_has_next>,</#if></#list>">
</@head>
</head>
<body>
<#include "side.ftl">
<main class="classify">
<#if 0 != mostUsedCategories?size>
<article>
	<header>
		<h2>
			<a rel="archive" href="${servePath}/tags.html"><li class="icontitle iconfont icon-wenjianjia"></li>
				${categoryLabel}
			</a>
		</h2>
	</header>
	<ul class="tags fn-clear">
		<#list mostUsedCategories as category>
			<li>
				<a class="tag" href="${servePath}/category/${category.categoryURI}">
					${category.categoryTitle} (${category.categoryTagCnt})</a>
			</li>
		</#list>
	</ul>
</article>
</#if>
<article>
	<header>
		<h2>
			<a rel="archive" href="/tags.html"><li class="icontitle iconfont icon-biaoqian"></li>
				${tagLabel}
			</a>
		</h2>
	</header>
	<ul class="tags fn-clear">
		<#list tags as tag>
		<li>
			<a rel="tag" class="tag" data-count="${tag.tagPublishedRefCount}"
			   href="/tags/${tag.tagTitle?url('UTF-8')}" title="${tag.tagTitle}">
				<span>${tag.tagTitle}</span>
				(<b>${tag.tagPublishedRefCount}</b>)
			</a>
		</li>
		</#list>
	</ul>
</article>
<#include "footer.ftl">
</main>
</body>
</html>