/* Copyright (c) 2010-2016, b3log.org & hacpai.com Licensed under the Apache License, Version 2.0 (the "License"); */
/**
 * @fileoverview util and every page should be used.
 * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
 * @version 1.2.0.0, Nov 3, 2015
 */
/**
 * @description yilia 皮肤脚本
 * @static
 */
var Yilia = {
    /**
     * @description 页面初始化
     */
    init: function () {
        Util.killIE();
        
        this._initToc();
        this.resetTags();
        
        $(window).scroll(function () {
            if ($("article").length > 0 && $("article.post").length === 0) {
                $("article:not(.show)").each(function () {
                    if ($(this).offset().top <= $(window).scrollTop() + $(window).height() - $(this).height() / 7) {
                        $(this).addClass("show");
                    }
                });
            }

            if ($(window).scrollTop() > $(window).height()) {
                $(".icon-goup").show();
            } else {
                $(".icon-goup").hide();
            }
			if (($(document).height() - $("body").height() - 300) < $(window).scrollTop()) {
				$("#backBtm").hide();
			} else {
				$("#backBtm").show();
			}

            if ($("article.post").length === 1) {
                $("article.post").addClass('show');
            }
        });

        $(window).scroll();
    },
    _initToc: function () {
        if ($('.b3-solo-list li').length === 0) {
            return false;
        }
        
        $('.side footer').after('<div class="toc"><a href="javascript:$(\'.side .toc\').hide()" class="close">X</a></div>');

         $('.side .toc a').after($('.b3-solo-list'));

        $('.side .toc-btn').show();
    },
    resetTags: function () {
        $("a.tag").each(function (i) {
            $(this).addClass("color" + Math.ceil(Math.random() * 4));
        });
    },
    share: function () {
        $(".share span").click(function () {
            var key = $(this).data("type");
            var title = encodeURIComponent($("title").text()),
                    url = $(".post-title a").attr('href') ? $(".post-title a").attr('href') : location,
                    pic = $(".post-content img:eq(0)").attr("src");
            var urls = {};
            urls.qq = "http://connect.qq.com/widget/shareqq/index.html?title=" + title + "&url=" + url;
            urls.tencent = "http://share.v.t.qq.com/index.php?c=share&a=index&title=" + title +
                    "&url=" + url + "&pic=" + pic;
            urls.weibo = "http://v.t.sina.com.cn/share/share.php?title=" +
                    title + "&url=" + url + "&pic=" + pic;
            urls.google = "https://plus.google.com/share?url=" + url;
            urls.twitter = "https://twitter.com/intent/tweet?status=" + title + " " + url;
            window.open(urls[key], "_blank", "top=100,left=200,width=720,height=618");
        });
    }
};
Yilia.init();