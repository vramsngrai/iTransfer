<%--
  Created by IntelliJ IDEA.
  User: 宇强
  Date: 2016/4/30 0030
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文件页面</title>
    <link href="style/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav>
    <div class="title">iTransfer</div>
</nav>
<div class="content2">
    <div class="content-wrapper">
    <p>
        <c:if test="${type=='query'}">
        注意！！！本页面为一次性页面，关闭本页面之后将无法再找回，文件也会被删除！
        </c:if>
    </p>
    <div class="file">
    <c:forEach items="${files}" var="file">
        <table style="color:#242422;" border="5">
            <thead>
            <tr>
                <td>字段</td>
                <td>信息</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>文件名</td>
                <td>${file.filename}</td>
            </tr>
            <tr>
                <td>md5</td>
                <td>${file.md5}</td>
            </tr>
            <tr>
                <td>时间</td>
                <td>${file.time}</td>
            </tr>
            <tr>
                <td>文件id</td>
                <td>${file.filecode}</td>
            </tr>
            <tr>
                <td>验证密码</td>
                <td>${file.password}</td>
            </tr>
            <tr>
                <td>操作</td>
                <td>
                    <a href="javascript:download('${file.storeName}','${file.filename}')">下载</a>&nbsp;
                    <a href="">打印</a>
                </td>
            </tr>
            </tbody>
        </table>
    </c:forEach>
    </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function download(storeName1,filename1) {
        var form = document.createElement("form");
        form.action = '${pageContext.request.contextPath}/download';
        form.method = "post";
        form.style.display = "none";

        var storeName = document.createElement("input");
        storeName.name = 'storeName';
        storeName.value = storeName1;
        form.appendChild(storeName);

        var filename = document.createElement("input");
        filename.name = 'filename';
        filename.value = filename1;
        form.appendChild(filename);

        var type = document.createElement("input");
        type.name = 'type';
        type.value = '${type}';
        form.appendChild(type);

        document.body.appendChild(form);
        form.submit();
    }
</script>
</html>
