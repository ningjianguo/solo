<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
<title>${blogTitle} - ${searchLabel} ${keyword!''}</title>
<link type="text/css" rel="stylesheet" href="${staticServePath}/css/default-init.css?${staticResourceVersion}" charset="utf-8"/>
<link type="text/css" rel="stylesheet" href="${staticServePath}/css/search.css?${staticResourceVersion}">
<link rel="stylesheet" href="//at.alicdn.com/t/font_262081_inf6p9s2nfp3nmi.css">
<link rel="icon" type="image/png" href="${staticServePath}/favicon.png"/>
<link rel="apple-touch-icon" href="${staticServePath}/favicon.png">
</head>
<body>
<div class="search__header fn-clear">
    <a href="${servePath}"><img class="fn-left" width="44" border="0" alt="Blog" title="Solo" src="${adminUser.userAvatar}"/></a>
    <div class="search__input fn-left">
        <input placeholder="请输入关键字" value="${keyword!''}" id="keyword" onkeypress="if(event.keyCode===13){document.getElementById('searchBtn').click()}">
        <button id="searchBtn" onclick="window.location.href='${servePath}/search?keyword=' + document.getElementById('keyword').value">搜 索</button>
    </div>
</div>

<div class="search">
    <div class="search__articles">
    <#list articles as article>
        <article class="show">
            <header>
                <h2>
                    <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                    ${article.articleTitle}
                    </a>
                </h2>
                <div class="meta">
                    <time><span class="icon-date"></span> ${article.articleCreateDate?string("yyyy-MM-dd")}</time>
                    &nbsp;<i class="iconfont icon-duihua" title="${commentLabel}"></i> ${article.articleCommentCount}
                    &nbsp;<i class="iconfont icon-liulan" title="${viewLabel}"></i> ${article.articleViewCount} 
                </div>
            </header>
            <div class="content-reset abstract">
            ${article.articleAbstract}
            </div>
            <footer class="tags">
				<span class="icon-tag"></span>  &nbsp;
                <#list article.articleTags?split(",") as articleTag>
                    <a class="tag color" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
                    <#if articleTag_has_next> &nbsp; </#if>
                </#list>
            </footer>
        </article>
    </#list>
    </div>
<#if 0 != articles?size>
    <nav class="search__pagination pagination">
        <#if 1 != pagination.paginationPageNums?first>
            <a class="page-num" href="${servePath}/search?keyword=${keyword!''}&p=${pagination.paginationCurrentPageNum - 1}">&laquo;</a>
            <a class="page-num" href="${servePath}/search?keyword=${keyword!''}&p=1">1</a> <span class="page-number">...</span>
        </#if>
        <#list pagination.paginationPageNums as paginationPageNum>
            <#if paginationPageNum == pagination.paginationCurrentPageNum>
                <span class="current page-num">${paginationPageNum}</span>
            <#else>
                <a class="page-num" href="${servePath}/search?keyword=${keyword!''}&p=${paginationPageNum}">${paginationPageNum}</a>
            </#if>
        </#list>
        <#if pagination.paginationPageNums?last != pagination.paginationPageCount>
            <span>...</span>
            <a class="page-num" href="${servePath}/search?keyword=${keyword!''}&p=${pagination.paginationPageCount}">${pagination.paginationPageCount}</a>
            <a class="page-num" href="${servePath}/search?keyword=${keyword!''}&p=${pagination.paginationCurrentPageNum + 1}">&raquo;</a>
        </#if>
    </nav>
<#else>
    <article class="show">
	  <nav class="pagination">
		<div class="iconfont icon-404-6" style="font-size:280px;"></div>
		抱歉，未搜索到相关内容，请使用其他关键字或返回 <a href="${servePath}">首页</a> 看看吧！
	  </nav>
	</article>
</#if>
</div>
<div class="footerWrapper">
    <div class="footer">&copy; ${year} ${blogTitle?html} All Rights Reserved. <br>
	Powered by <a href="http://b3log.org" target="_blank">B3log 开源 • Solo</a> 
	${footerContent}</div>
</div>
<script>
var tags = document.getElementsByClassName("tag");
for(var i=0; i < tags.length; i+=1) {
	tags[i].className = ("tag color" + Math.ceil(Math.random() * 3));
}
</script>
</body>
</html>
