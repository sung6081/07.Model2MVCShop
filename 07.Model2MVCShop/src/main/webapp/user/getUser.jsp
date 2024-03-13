<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ page import="com.model2.mvc.service.domain.User" %>

<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	User user = (User)request.getAttribute("user");
--%>

<html>
<head>
<title>회원정보조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

</head>

<body bgcolor="#ffffff" text="#000000">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="93%" class="ct_ttl01">회원정보조회</td>
				<td width="20%" align="right">&nbsp;</td>
			</tr>
		</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			아이디 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.userId }</td>
	</tr>		<%-- <%=user.getUserId() %> --%>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			이름 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.userName }</td>
	</tr>							<%-- <%=user.getUserName() %> --%>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">주소</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.addr }</td>
	</tr>				<%-- <%=user.getAddr() %> --%>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">휴대전화번호</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">	${user.phone }</td>
	</tr>					<%-- <%=user.getPhone() %> --%>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">이메일 </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.email }</td>
	</tr>						<%-- <%=user.getEmail() %> --%>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">가입일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.regDate }</td>
	</tr>			<%-- <%=user.getRegDate() %> --%>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="/user/updateUserView.do?userId=${user.userId}">수정</a>
					</td>											<%-- <%=user.getUserId()%> --%>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<f:if test="${user.role eq 'admin' }">
						<a href="/user/listUser.do">확인</a>
						</f:if>
						<f:if test="${user.role ne 'admin' }">
						<a href="/home.jsp">확인</a>
						</f:if>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>