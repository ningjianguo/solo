<#list articles as article>
<article>
<header>
	<h2>
		<a rel="bookmark" href="${article.articlePermalink}">${article.articleTitle}</a>
		<#if article.hasUpdated>
		<sup><span class="iconfont icon-xin itip" id="artUdp${article_index}" lang="${updatedLabel}"></span></sup>
		</#if>
		<#if article.articlePutTop>
		<sup><span class="iconfont icon-zhiding2 itip" id="artTop${article_index}" lang="${topArticleLabel}"></span></sup>
		</#if>
	</h2>
	<time class="itip" id="time_${article_index}" lang="发表于 ${article.articleCreateDate?string("yyyy年MM月dd日 HH:mm")}"><span class="icon-date"></span>
	${article.articleCreateDate?string("yyyy-MM-dd")}</time>
</header>
<section class="abstract">${article.articleAbstract}</section>
<footer class="tags">
	<span class="icon-tag"></span>  &nbsp;
	<#list article.articleTags?split(",") as articleTag>
	<a class="tag" rel="tag" href="/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
	</#list>
	<#-- <a rel="nofollow" href="/authors/${article.authorId}"></a> -->
	<img class="avatar itip" id="ava_${article_index}" alt="Seves" lang="发表人 ${article.authorName}" src="${article.authorThumbnailURL}"/>
</footer>
</article>
</#list>
<#if (articles?size<1)>
<article>
<header>
	<h2><i class="iconfont icon-kulian" style="font-size:inherit;"></i> 当前页面无内容</h2>
</header>
<section class="abstract">
	<h4>温馨提示：</h4>
	<p>当前页面暂无相关内容，您可能访问了超过文章列表实际页数的页面。</p>
	<p>最大页数为<b> ${paginationPageCount!"0"} </b>页，请在底部选择合适的页面进行访问，感谢您的配合。</p>
	<div class="iconfont icon-4043" style="font-size:200px;width:270px;margin:0 auto;"><sup><i class="iconfont icon-4041" style="font-size:60px;"></i></sup></div>
</section>
<footer class="tags">
	<span class="icon-tag"></span> &nbsp;
	<a class="tag color2" rel="tag">404</a> <a class="tag color3" rel="tag">NOTHING</a>
	<a rel="nofollow" href="/">
		<img class="avatar itip" id="ava_nul" alt="${blogTitle?html}" lang="${blogTitle?html}" src="/favicon.png"/>
	</a>
</footer>
</article>
</#if>
<#if 0 != paginationPageCount>
<nav class="pagination">
  <#-- 上一页 -->
  <#if 1 != paginationPageNums?first>
    <a href="${servePath}${path}/${paginationPreviousPageNum}" class="extend iconfont icon-xiangzuo1 itip" id="prev_page" lang="${previousPageLabel}"></a>
    <a class="page-num" href="${servePath}${path}">1</a> ...
  </#if>
  <#list paginationPageNums as paginationPageNum>
    <#-- 当前页 -->
    <#if paginationPageNum == paginationCurrentPageNum>
      <span class="current page-num">${paginationPageNum}</span>
	<#-- 第一页 -->
    <#elseif paginationPageNum == 1>
      <a class="page-num" href="${path}/">${paginationPageNum}</a>
	<#-- 其他页 -->
    <#else>
      <a class="page-num" href="${path}/${paginationPageNum}">${paginationPageNum}</a>
    </#if>
  </#list>
  <#-- 下一页 -->
  <#if paginationPageNums?last != paginationPageCount> ...
    <a href="${servePath}${path}/${paginationPageCount}" class="page-num">${paginationPageCount}</a>
    <a href="${servePath}${path}/${paginationNextPageNum}" class="extend iconfont icon-xiangyou2 itip" id="next_page" lang="${nextPagePabel}"></a>
  </#if>
</nav>
</#if>