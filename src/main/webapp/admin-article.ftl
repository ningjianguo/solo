<div class="form">
    <div>
        <label>${title1Label}</label>
        <input id="title" type="text"/>
    </div>
    <div>
            <label>${content1Label}</label>
            <div class="right">
                <label for="articleThumbnail">${useTumbnailLabel}</label>
                <input type="checkbox" id="articleThumbnail" onclick="$('.article__thumbnail').slideToggle()" />
            </div>
        <div class="article__thumbnail fn-clear">
            <div class="thumbnail__img"></div>
            <button id="articleThumbnailBtn">${chageLabel}</button>
        </div>
        <div>
            <textarea id="articleContent" name="articleContent"
                  style="height: 500px;width:100%;"></textarea>
        </div>
    </div>
    <div>
        <label>${tags1WithTips1Label}</label>
        <input id="tag" type="text"/>
    </div>
    <div class="comment-content">
        <label>${abstract1Label}</label>
        <div>
            <textarea id="abstract" style="height: 200px;width: 100%;" name="abstract"></textarea>
        </div>
    </div>
    <div>
        <div class="left">
            <label for="permalink">${permalink1Label}</label>
            <input id="permalink" type="text" style="width: 416px;" />
        </div>
        <div class="right">
            <label for="viewPwd">${articleViewPwd1Label}</label>
            <input id="viewPwd" type="text" style="width: 156px" />
        </div>
        <div class="clear"></div>
    </div>
    <div>
        <span class="signs">
            <label>${sign1Label}</label>
            <button style="margin-left: 0px;" id="articleSign1" class="selected">${signLabel} 1</button>
            <button id="articleSign2">${signLabel} 2</button>
            <button id="articleSign3">${signLabel} 3</button>
            <button id="articleSign0">${noSignLabel}</button>
        </span>
        <div class="right">
            <label for="articleCommentable">${allowComment1Label}</label>
            <input type="checkbox" id="articleCommentable" checked="checked" />
            <span id="postToCommunityPanel" class="none">
                <label for="postToCommunity">
                    <a class="no-underline" href="https://hacpai.com/article/1440573175609" target="_blank">${postToCommunityLabel}</a>
                </label>
                <input id="postToCommunity" type="checkbox" checked="checked"/>
            </span>
        </div>
        <div class="clear"></div>
    </div>
    <div class="right">
        <button id="unSubmitArticle" class="none marginRight12" onclick="admin.article.unPublish();">${unPublishLabel}</button>
        <button class="marginRight12" id="saveArticle">${saveLabel}${draftListLabel}</button>
        <button id="submitArticle">${publishLabel}</button>
    </div>
    <div class="clear"></div>
</div>
${plugins}