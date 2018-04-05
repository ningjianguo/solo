<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>${blogTitle} - 500 Internal Server Error!</title>
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/default-init${miniPostfix}.css?${staticResourceVersion}" charset="utf-8" />
        <link rel="icon" type="image/png" href="${staticServePath}/favicon.png" />
    </head>
    <body>
        <div class="wrapper">
            <div class="wrap">
                <div class="content">
                    <div class="logo">
                        <a href="https://b3log.org" target="_blank">
                            <img border="0" width="153" height="56" alt="B3log" title="B3log" src="${staticServePath}/images/logo.jpg"/>
                        </a>
                    </div>
                    <div class="main">
                        <h2>500 Internal Server Error!</h2>
                        <img class="img-500" src="${staticServePath}/images/500.png" title="500: internal error" alt="500: internal error" />
                        <div class="a-500">
                           Please 
                            <a href="https://github.com/b3log/solo/issues/new">report</a> it to help us.
                            Return to <a href="${servePath}">Index</a>.
                        </div>
                        <a href="https://b3log.org" target="_blank">
                            <img border="0" class="icon" alt="B3log" title="B3log" src="${staticServePath}/favicon.png"/>
                        </a>
                    </div>
                    <span class="clear"></span>
                </div>
            </div>
        </div>
        <div class="footerWrapper">
            <div class="footer">
                &copy; ${year}
                Powered by <a href="https://b3log.org" target="_blank">B3log 开源</a>, ver ${version}
            </div>
        </div>
    </body>
</html>
