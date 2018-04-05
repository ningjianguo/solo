<#macro comments commentList article>
<ul class="comments" id="comments">
    <#list commentList as comment>
    <li id="${comment.oId}">
        <img class="avatar" title="${comment.commentName}" src="${comment.commentThumbnailURL}">
        <div class="content">
            <div class="fn-clear post-meta">
                <span class="fn-left">
                    <#if "http://" == comment.commentURL>
                    <a>${comment.commentName}</a>
                    <#else>
                    <a href="${comment.commentURL}" rel="nofollow">${comment.commentName}</a>
                    </#if>
                    <#if comment.isReply>
                    <span class="iconfont icon-anonymous-iconfont"></span>
                    <a class="quote-link" href="${article.permalink}#${comment.commentOriginalCommentId}"
                       onmouseover="page.showComment(this, '${comment.commentOriginalCommentId}', 23);"
                       onmouseout="page.hideComment('${comment.commentOriginalCommentId}')"
                       >${comment.commentOriginalCommentName}</a>
                    </#if>
                    <time>${comment.commentDate?string("yyyy-MM-dd")}</time> 
                </span>
                <#if article.commentable>
                <a class="fn-right itip" lang="${replyLabel}" id="rep_${comment.oId}" href="javascript:replyTo('${comment.oId}','${comment.commentName}')"><span class="iconfont icon-huiche"></span></a>
                </#if>
            </div>
            <div class="comment-content">${comment.commentContent}</div>
        </div>
    </li>
    </#list>
	<li style="margin-bottom:15px;padding-bottom:15px;">
		<div id="conoption">
			<span id="replyname" style="display:inline-block"></span>
			<a class="fn-right iconfont icon-comments itip" id="reply-original" href="javascript:replyTo('','')" lang="回帖"></a>
		</div>
	</li>
</ul>
<#if article.commentable>
<div class="comment-body fn-wrap">
    <table id="commentForm" class="form">
        <tbody>
            <#if !isLoggedIn>
            <tr>
                <td><input placeholder="${commentNameLabel}" type="text" class="normalInput" id="commentName" required="required"/></td>
				<td><input placeholder="${commentEmailLabel}" type="email" class="normalInput" id="commentEmail"/></td>
            </tr>
            <tr>
                <td colspan="2"><input placeholder="${commentURLLabel}" type="url" id="commentURL"/></td>
            </tr>
            </#if>
            <tr>
                <td id="emotions" colspan="2">
					<div class="OwO"></div>
                    <span class="em00" title="${em00Label}"></span>
                    <span class="em01" title="${em01Label}"></span>
                    <span class="em02" title="${em02Label}"></span>
                    <span class="em03" title="${em03Label}"></span>
                    <span class="em04" title="${em04Label}"></span>
                    <span class="em05" title="${em05Label}"></span>
                    <span class="em06" title="${em06Label}"></span>
                    <span class="em07" title="${em07Label}"></span>
                    <span class="em08" title="${em08Label}"></span>
                    <span class="em09" title="${em09Label}"></span>
                    <span class="em10" title="${em10Label}"></span>
                    <span class="em11" title="${em11Label}"></span>
                    <span class="em12" title="${em12Label}"></span>
                    <span class="em13" title="${em13Label}"></span>
                    <span class="em14" title="${em14Label}"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2"><textarea rows="10" cols="96" class="OwO-textarea" id="comment" placeholder="支持 Markdown 格式"></textarea></td>
            </tr>
            <#if !isLoggedIn>
            <tr>
                <td colspan="2">
                    <input style="width:50%" placeholder="${captchaLabel}" type="text" class="normalInput" id="commentValidate"/>
                    <img id="captcha" alt="validate" src="/captcha.do" />
                </td>
            </tr>
            </#if>
            <tr>
                <td colspan="2" align="right">
                    <button id="submitCommentButton" onclick="page.submitComment();">${submmitCommentLabel}</button>
                    <span class="error-msg" id="commentErrorTip"></span>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</#if>
</#macro>
<#macro comment_script oId>
<script src="/skins/${skinDirName}/js/page.js?${staticResourceVersion}" charset="utf-8"></script>
<script src="/skins/${skinDirName}/js/lib/OwO/OwO${miniPostfix}.js?${staticResourceVersion}"></script>
<script type="text/javascript">
var page = new Page({
	"nameTooLongLabel": "${nameTooLongLabel}",
	"mailCannotEmptyLabel": "${mailCannotEmptyLabel}",
	"mailInvalidLabel": "${mailInvalidLabel}",
	"commentContentCannotEmptyLabel": "${commentContentCannotEmptyLabel}",
	"captchaCannotEmptyLabel": "${captchaCannotEmptyLabel}",
	"loadingLabel": "${loadingLabel}",
	"oId": "${oId}",
	"skinDirName": "${skinDirName}",
	"blogHost": "${blogHost}",
	"randomArticles1Label": "${randomArticles1Label}",
	"externalRelevantArticles1Label": "${externalRelevantArticles1Label}"
});
var addComment = function (result, state, reply) {
	var commentable = $("#commentForm").length === 0 ? false : true;
	var commentHTML = '<li id="' + result.oId + '"><img class="avatar" title="'
			+ result.userName + '" src="' + result.commentThumbnailURL + '"><div class="content">'
			+ '<div class="fn-clear post-meta"><span class="fn-left">' + result.replyNameHTML;
	if (state !== "" || reply) {
		var commentOriginalCommentName = $("#" + page.currentCommentId).find(".post-meta a").first().text();
		commentHTML += '&nbsp;<span class="iconfont icon-anonymous-iconfont"></span>&nbsp;<a class="quote-link" href="${servePath}' + result.commentSharpURL.split("#")[0] + '#' + page.currentCommentId + '"'
			+ 'onmouseover="page.showComment(this, \'' + page.currentCommentId + '\', 23);"'
			+ 'onmouseout="page.hideComment(\'' + page.currentCommentId + '\')">' + commentOriginalCommentName + '</a>';
	}
	commentHTML += ' <time>' + result.commentDate + '</time></span>';
	if (commentable) {
		commentHTML += '<a class="fn-right" href="javascript:replyTo(\'' + result.oId + '\', \'' + result.userName + '\');"><span class="iconfont icon-huiche" title="${replyLabel}"></span></a>';
	}
	commentHTML += '</div><div class="comment-content">' + Util.replaceEmString($("#comment" + state).val()) + '</div></div></li>';
	return commentHTML;
};
var replyTo = function (id, name) {
	alert("aa");
	$("#commentForm").fadeIn();$("#comment").focus();
	if(id != '' && id != null) { // rep
	console.log(name);
		$("#replyname").html('<a href ="#' + id + '"><span class="iconfont icon-anonymous-iconfont"></span>' + name + '</a>');
		$("#comment").unbind().keypress(function(event) {
			if (event.keyCode === 13 && event.ctrlKey) {page.submitComment(id, '', true); event.preventDefault();}
		});
		$("#submitCommentButton").unbind("click").removeAttr("onclick").click(function() {page.submitComment(id, '', true);});
	} else { // comm
		$("#replyname").html('<a></a>');
		$("#comment").unbind().keypress(function(event) {
			if (event.keyCode === 13 && event.ctrlKey) {page.submitComment(); event.preventDefault();}
		});
		$("#submitCommentButton").unbind("click").removeAttr("onclick").click(function() {page.submitComment();});
	}
};
(function () {
	Yilia.share();page.load();page.replaceCommentsEm(".comments .comment-content");
	<#nested>
	$("article a[href*='/download?dir']").each(function(i, n) { $(n).attr("href", encodeURI($(n).attr("href"))); });
})();
</script>
</#macro>