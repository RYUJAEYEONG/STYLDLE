<%--
  Created by IntelliJ IDEA.
  User: nagas
  Date: 2021-12-06
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
  // 1: 기존의 세션 데이터를 모두 삭제
  session.invalidate();
  // 2: 로그인 페이지로 이동
  response.sendRedirect("login");
%>
</body>
</html>
