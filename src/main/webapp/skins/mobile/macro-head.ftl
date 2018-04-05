<#macro head title>
<meta charset="UTF-8">
<meta name="theme-color" content="#ccc">
<meta name="renderer" content="webkit" />
<meta name="force-rendering" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta content="always" name="referrer">
<title>${title}</title>
<link rel="dns-prefetch" href="//at.alicdn.com">
<link rel="dns-prefetch" href="//lib.baomitu.com">
<#-- <link rel="dns-prefetch" href="//hm.baidu.com"> -->
<#nested>
<meta name="author" content="${blogTitle?html}">
<meta name="generator" content="Solo">
<meta name="owner" content="B3log Team">
<meta name="revised" content="${blogTitle?html}, ${year}">
<meta name="copyright" content="B3log,${blogTitle?html}">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta http-equiv="Window-target" content="_top">
<#if article??>
<meta property="og:type" content="blog">
<meta property="og:image" content="图片URL地址">
<meta property="og:release_date" content="${article.articleCreateDate?string("yyyy-MM-dd")}">
<meta property="og:title" content=" ${title}">
<meta property="og:description" content=" ${article.articleAbstract?html}">
<meta property="og:author" content="${blogTitle?html}">
</#if>
<link rel="icon" type="image/png" href="/favicon.png">
<link type="text/css" rel="stylesheet" href="/skins/${skinDirName}/css/yilia7${miniPostfix}.css?${staticResourceVersion}">
<link rel="stylesheet" href="//at.alicdn.com/t/font_262081_9r6pziz40iugcik9.css">
<link href="/blog-articles-rss.do" title="RSS" type="application/rss+xml" rel="alternate">
<link rel="search" type="application/opensearchdescription+xml" title="${blogTitle?html}" href="/opensearch.xml">
<link rel="apple-touch-icon" href="/favicon.png">
<meta itemprop="image" content="/favicon.png">
<meta name="apple-mobile-web-app-title" content="${blogTitle?html}">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<meta name="msapplication-TileColor" content="#eee">
<meta name="msapplication-TileImage" content="/favicon.png">
<meta name="msapplication-square150x150logo" content="/favicon.png">
<meta name="application-name" content="${blogTitle?html}">
${htmlHead}
</#macro>