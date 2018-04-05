B3log Solo 第三方皮肤 - [子兮子兮](https://zixizixi.cn/)
----

本皮肤是基于官方版 `yilia` 皮肤进行美化修改的第三方皮肤，主色调修改为黑、白、灰（高冷三原色 😜 ）、蓝（超链接）。
名称为 `iMobile` 的原因是，本人使用的此皮肤是直接把原 `mobile` 皮肤删除，将此皮肤的目录名和 `skin.properties` 中的配置改为 `mobile`，这样使用手机访问时也会使用此皮肤（原 mobile 皮肤实在无法欣赏 n(*≧▽≦*)n ）。
此皮肤采用响应式布局，不用担心用手机访问会出现样式错乱。也建议使用者直接将此皮肤文件覆盖原 `mobile` 皮肤。

## 注意事项
此皮肤有些个性化的地方需要使用者自己去修改 `ftl` 模板文件，具体如下：

### 1. 自定义 ABOUT ME 介绍信息（side.ftl）
点击博客标题会弹出 ABOUT ME 的窗口，当然若不想使用此弹窗你也可以在 `side.ftl` 中搜索 `clickme` 并删除相关代码。
#### 效果图
![关于我效果图](https://img.hacpai.com/file/2018/02/d1f0cb2eff244740a21eace90affe9f3_2018021072535.jpg)

#### 相关代码
![ABOUT 代码](https://img.hacpai.com/file/2018/02/6d3788ea90ad4e1e85133b9f9936948d_2018021073057.jpg)


### 2. 自定义左侧个人导航链接（side.ftl）
左侧新增的个人导航链接分别为 Github、微博、微信（可以是公众号）二维码、QQ 会话（需要在 [QQ 推广](http://shang.qq.com/) 中开通）。
#### 效果图
![个人导航效果图](https://img.hacpai.com/file/2018/02/e768ab16c8fa4a5e976a72107ef8b068_2018021072432.jpg)

#### 相关代码
从 side.ftl 第 47 行开始的注释，若使用请打开注释并将链接修改为自己的链接，包括下面的反馈邮箱链接。

![个人链接代码](https://img.hacpai.com/file/2018/02/0f2b02a43e324dc69d266c5808e49ce2_2018021071729.jpg)
![邮箱链接代码](https://img.hacpai.com/file/2018/02/feb8b75209784dfc93bfa6f1d21add82_2018021072235.jpg)


### 3. 添加移动端顶部背景图
在屏幕宽度小于 750px（在 yilia7.min.css 中修改）时当做是移动端，由左右布局变为上下布局，顶部显示背景图，图片位置为 `solo 根目录/images/bg.jpg`，需要使用者将自己的图片放置于此。

#### 相关代码
``` css
@media only screen and (max-width:750px) {
    .side {
        height: 400px;
        width: 100%;
        background: #666 url('/images/bg.jpg') center -40px;
    }
}
```
#### 效果图
![2018021061950jpg](https://img.hacpai.com/file/2018/02/c2914ca8548b416daf0d0e0b1e277b1a_2018021061950.jpg)


### 4. 搜索页面
目前 Solo 的搜索页面还比较简陋，本人根据 `yilia` 的样式修改了一个搜索页面，放在 `搜索页面（覆盖至根目录）` 目录中，顾名思义，直接将目录中的文件剪切到 Solo 根目录即可。特别要注意的是里面的 `opensearch.xml` 文件，需要根据自己的实际情况进行修改，格式是在 hacpai 扒下来的，是用来在谷歌浏览器中实现输入域名加空格直接在地址栏实现站内搜索的。
> 特别注意需要在 `WEB-INF/static-resources.xml` 文件中添加一行 `<include path="/opensearch.xml"/>`，不然无法获取此静态资源。

#### 相关代码
``` xml
<OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/" mlns:moz="http://www.mozilla.org/2006/browser/search/">
  <ShortName>子兮子兮</ShortName>
  <Description>子兮子兮风兮寒，三江七泽情洄沿。</Description>
  <InputEncoding>UTF-8</InputEncoding>
  <Image width="16" height="16" type="image/x-icon">https://res.zixizixi.cn/izcn.png</Image>
  <Url type="text/html" method="get" template="https://zixizixi.cn/search?keyword={searchTerms}"/>
</OpenSearchDescription>
```

#### 效果图
![搜索页面](https://img.hacpai.com/file/2018/02/992d4bef69f0438fbda58c27567ed28f_2018021075045.jpg)

![地址栏搜索](https://img.hacpai.com/file/2018/02/afcdc98999754245a452cc12957cbb23_2018021075206.jpg)

### 5. 其他
为了搭配此皮肤，建议对 `WEB-INF/classes` 目录下的 `lang_zh_CN.properties` 参数文件做适当的修改，以及替换此目录下的验证码文件 `captcha_static.zip`。
#### 需要修改的 `lang_zh_CN.properties` 参数
``` properties
viewCount1Label=\u6D4F\u89C8\u6B21\u6570\uFF1A
# （浏览次数：）修改为（浏览：）
viewCount1Label=\u6D4F\u89C8\uFF1A

articleCount1Label=\u6587\u7AE0\u603B\u6570\uFF1A
# （文章总数：）修改为（文章：）
articleCount1Label=\u6587\u7AE0\uFF1A

commentCount1Label=\u8BC4\u8BBA\u603B\u6570\uFF1A
# （评论总数：）修改为（评论：）
commentCount1Label=\u8BC4\u8BBA\uFF1A

onlineVisitor1Label=\u5F53\u524D\u8BBF\u5BA2\uFF1A
# （当前访客：）修改为（在线：）
onlineVisitor1Label=\u5728\u7ebf\uFF1A

linkLabel=\u53CB\u60C5\u94FE\u63A5
# （友情链接）修改为（链接）
linkLabel=\u94FE\u63A5
```

> 需要使用者注意并自己修改代码的地方大概就这些。 另外建议与皮肤无关的 H2 数据 JDBC 连接配置： `jdbc.URL=jdbc:h2:~/solo_h2/db;AUTO_SERVER=TRUE;DB_CLOSE_ON_EXIT=FALSE`。

----

## 整体效果
### 1. 首页
![首页](https://img.hacpai.com/file/2018/02/2c290b6b56ec46aba5400fdc3004fea2_2018021091348.jpg)

### 2. 存档
![存档](https://img.hacpai.com/file/2018/02/02f347f851514ba28ce5f6db17a12d3a_2018021091449.jpg)

### 3. 标签墙
![标签墙](https://img.hacpai.com/file/2018/02/9201790df35347cd811169036d53095f_2018021091729.jpg)

### 4. 动态
![动态](https://img.hacpai.com/file/2018/02/8c1d4d418849450a99d6ad0741ddf789_2018021091559.jpg)

### 5. 链接
![链接](https://img.hacpai.com/file/2018/02/164358ed23484f53a4f16052a77fcc19_2018021091838.jpg)

### 6. 文章详情
![文章详情](https://img.hacpai.com/file/2018/02/a70e2648ea05409da390fbf47e08e5ef_2018021092013.jpg)

### 7. 评论回复
![评论回复](https://img.hacpai.com/file/2018/02/f1a788a03f1b4366a8ccef3e9d1fb074_2018021092306.jpg)

## 特别鸣谢
此皮肤的发布离不开 D大（@88250）和 V姐（@Vanessa219）对 Solo 的辛勤耕耘，以及 V姐 对此皮肤的的热情，本来此皮肤的代码被我改的乱七八糟，代码本来看不下去，开始 V姐 提出 PR 一份的时候我是拒绝的，因为弄起来真的很麻烦，事实也的确如此 😂 ，即使现在也这代码也不一定有多整洁。写完了此 README 感觉用这个皮肤真的好麻烦呀，应该不会有人用吧 O(∩_∩)O~

### 三方包
此改版皮肤的诞生要特别感谢以下第三方项目：
1. [layer](http://layer.layui.com/)：一款美观易用的 jQuery 弹出层；
2. [OwO](https://github.com/DIYgod/OwO)：萌萌哒评论框表情内容输入工具（Revised [OwO](http://git.itanken.cn/OwO/)）；
3. [iconfont](http://iconfont.cn/)：阿里巴巴功能强大且图标内容很丰富的矢量图标库。

... 好吧只记得这 3 个了，可能也只有这三个 😂 。

----

**平等，自由，奔放**

**Equality, Freedom, Passion**
