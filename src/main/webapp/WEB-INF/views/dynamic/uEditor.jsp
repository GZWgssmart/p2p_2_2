<%--
  Created by IntelliJ IDEA.
  User: Master
  Date: 2017/10/31
  Time: 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>ueditor</title>
    <script src="<%=path %>/static/ueditor/ueditor.config.js"></script>
    <script src="<%=path %>/static/ueditor/ueditor.all.js"></script>
</head>
<body>
<div style="width: 1000px; height: 600px;">
    <script id="editor" type="text/plain"></script>
</div>
<a href="javascript:void(0);" onclick="getContent();">获取内容</a>
</body>
<script>
    var ue = UE.getEditor('editor');

    function getContent() {
        alert(ue.getContent());
    }

</script>
</html>
