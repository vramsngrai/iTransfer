<%--
  Created by IntelliJ IDEA.
  User: 宇强
  Date: 2016/4/30 0030
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>爱传 —— 快速高效的文件传输解决方案！</title>
    <script type="text/javascript" src="./js/jquery-2.2.1.min.js"></script>
    <script type="text/javascript">
        $(function () {

            window.setInterval(function () {

                var filename = $("#filename").val();
                $.get("${pageContext.request.contextPath}/check?filename=" + filename,
                        {"timed": new Date().getTime()},
                        function (data) {
                            var filename = '${queryImg}';
                            if (data != "null" && data != "false") {
                                window.location.href = "${pageContext.request.contextPath}/query?filename=" + filename + "&" + data;
                            }
                        });
            }, 1500);

        });

        function queryFile() {
            var form = document.getElementById('queryFile');
            form.submit();
        }
    </script>
</head>
<style>
    body, ul, ol, li, p, h1, h2, h3, h4, h5, h6, form, fieldset, table, td, img, div, dl, dt, dd, input {
        margin: 0;
        padding: 0;
    }

    body {
        font-size: 12px;
        font-family: "微软雅黑";
    }

    img {
        border: none;
    }

    li {
        list-style: none;
    }

    input, select, textarea {
        outline: none;
    }

    textarea {
        resize: none;
    }

    a {
        text-decoration: none;
    }

    /*清浮动*/
    .clearfix:after {
        content: "";
        display: block;
        clear: both;
    }

    .clearfix {
        zoom: l;
    }

    body {
        background-image: url(image/bg.png);
        background-position: left top;
        background-repeat: repeat-y;
        background-size: 100%;
    }

    .header {
        width: 100%;
        height: 100px;
        background: #09496c;
    }

    .logo {
        margin: 0px auto;
        display: block;
        padding-top: 5px;
    }

    .download{ width:120px;height:180px;background:#00335e;position:absolute;top:400px;right:20px;z-index:1;}
    .download img{margin:36px;}
    .download p{text-align:center;font-size:24px;color:#fff;}

    .content {
        width: 1080px;
        background: #000;
        margin: 60px auto;
        background-color: rgba(0, 0, 0, 0.5);
        border-radius: 5px;
        overflow: auto;
    }

    .sendbar, .receivebar {
        width: 420px;
        height: 580px;
        background: #f9fafc;
        margin: 40px;
        overflow: hidden;
    }

    .sendbar {
        float: left;
    }

    .receivebar {
        float: right;
    }

    .sendtop, .receivetop {
        height: 70px;
        width: 1000px;
        background: #34a0fd;
    }

    .sendtop p, .receivetop p {
        display: block;
        width: 420px;
        height: 70px;
        text-align: center;
        font-size: 36px;
        color: #fff;
        line-height: 70px;
        background-repeat: no-repeat;
        background-position: 100px 20px;
    }

    /*.sendtop p{background-image:url(image/send.png);}
    .receivetop p{background-image:url(image/receice.png);}*/

    .sendbtn {
        display: block;
        background: #34a0fd;
        width: 260px;
        height: 98px;
        margin: 180px auto;
        color: #fff;
        font-size: 32px;
        line-height: 98px;
        text-align: center;
        border-radius: 10px;
    }

    .sendbtn:hover {
        background-color: #1782de;
    }

    .text {
        display: block;
        width: 420px;
        height: 60px;
        line-height: 60px;
        font-size: 24px;
        color: #32495c;
        text-align: center;
    }

    .ma {
        margin-left: 110px;
    }

    .file_pwd {
        width: 420px;
    }

    .id, .pwd {
        width: 334px;
        height: 40px;
        background: #d5e9fa;
        border: 1px solid #09F;
        border-radius: 4px;
        margin: 0 auto 10px;
        display: block;
        text-align: center;
        font-size: 20px;
        color: #7c7c7c;
        font-family: "微软雅黑"
    }

    .receivebtn {
        width: 334px;
        height: 50px;
        background-color: #34a0fd;
        color: #fff;
        font-size: 20px;
        text-align: center;
        line-height: 50px;
        margin: 0 auto;
        display: block;
        border-radius: 4px;
    }

    .receivebtn:hover {
        background-color: #1782de;
    }

</style>
<body>

<div class="header">
    <img src="image/logo.png" class="logo">
</div>
<div class="download">
    <a href="${pageContext.request.contextPath}/download?appDownload=itransfer"><img title="点击下载Android客户端" src="image/receice.png"></a>
    <a href="${pageContext.request.contextPath}/download?appDownload=itransfer"><p>app下载</p></a>
</div>
<!--内容区-->
<div class="content">
    <div class="sendbar">
        <div class="sendtop">
            <p>发送文件</p>
        </div>
        <a href="${pageContext.request.contextPath}/uploadui" class="sendbtn">
            上传文件
        </a>
    </div>

    <div class="receivebar">
        <div class="receivetop">
            <p>接收文件</p>
        </div>
        <div>
            <p class="text">方法1.使用iTransfer扫描二维码</p>

            <div class="ma">
                <img src="${queryImg}"/>
            </div>
        </div>
        <div>
            <p class="text">方法2.输入文件ID和校验码</p>
            <c:if test="${!empty(message)}">
                <p class="text">${message}</p>
            </c:if>
            <div class="file_pwd">
                <form id="queryFile" action="${pageContext.request.contextPath}/query" method="post">
                    <input id="filename" type="hidden" name="filename" value="${filename}">
                    <input type="text" placeholder="文件ID" name="filecode" class="id">
                    <input type="text" placeholder="校验码" name="password" class="pwd">
                    <!--<input type="submit" value="接收文件" class="receivebtn">-->
                    <a href="javascript:void(0)" onclick="javascript:queryFile()" class="receivebtn">接收文件</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
