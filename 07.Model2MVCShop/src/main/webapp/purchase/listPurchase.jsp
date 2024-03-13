
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<%--
HashMap<String, Object> map = (HashMap<String, Object>)request.getAttribute("map");
	ArrayList<Purchase> list = (ArrayList<Purchase>)map.get("list");
	int count = (Integer)map.get("Integer");
	Page p = (Page)request.getAttribute("resultPage");
	//int pageUnit = Integer.parseInt(request.getServletContext().getInitParameter("pageSize"));
--%>


<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList() {
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/user/listUser.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${map.Integer }<%-- count--%> �Ǽ�, ���� ${resultPage.currentPage }<%-- request.getParameter("page")--%> ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ�̹���</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	<%--
		for(int i = 0; i < list.size(); i++) { 
			Purchase purchaseVO = list.get(i);
			System.out.println("listJsp : "+purchaseVO);
			System.out.println("listJsp tranNo : "+purchaseVO.getTranNo());
		--%>
	<x:set var="i" value="${resultPage.pageSize }" />
	<x:forEach var="purchase" items="${map.list }">
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/purchase/getPurchase.do?tranNo=${purchase.tranNo }<%-- purchaseVO.getTranNo() --%>">${i }<%-- list.size() - i --%></a>
		</td>
		<x:set var="i" value="${i - 1 }" />
		<td></td>
		
		
		<td align="left">${purchase.receiverName }<%-- purchaseVO.getReceiverName() --%></td>
		<td></td>
		
		<td align="left">
			<a href="/product/getProduct.do?prodNo=${purchase.purchaseProd.prodNo }">${purchase.purchaseProd.prodName }<%-- purchaseVO.getBuyer().getUserId() --%></a>
		</td>
		<td></td>
		<td align="center"><img src = "/images/uploadFiles/${purchase.purchaseProd.fileName }" width="50" height="50"/></td>
		<td></td>
		<td align="left">${purchase.receiverPhone }<%-- purchaseVO.getReceiverPhone() --%></td>
		<td></td>
		<td align="left">
		<%-- if(purchaseVO.getTranCode() != null && purchaseVO.getTranCode().trim().equals("0")) {--%>
		<x:choose>
		<x:when test="${!empty purchase.tranCode and purchase.tranCode eq '0' }">
		���� ���ſϷ� �����Դϴ�.
		</x:when>
		<%-- } else if(purchaseVO.getTranCode() != null && purchaseVO.getTranCode().trim().equals("1")) {--%>
		<x:when test="${!empty purchase.tranCode and purchase.tranCode eq '1' }">
		���� ����� �����Դϴ�
		</x:when>
		<%-- }else { --%>
		<x:otherwise>
		��ۿϷ� �����Դϴ�.
		</x:otherwise>
		<%-- } --%>
		</x:choose>
		</td>
		<td></td>
		<td align="left">
		<%-- if(purchaseVO.getTranCode() != null && purchaseVO.getTranCode().trim().equals("1")) {--%>
		<x:choose>
		<x:when test="${!empty purchase.tranCode and purchase.tranCode eq '1' }">
			<a href="/purchase/updateTranCode.do?tranNo=${purchase.tranNo}<%-- purchaseVO.getTranNo() --%>&tranCode=2">���ǵ���</a>
		</x:when>
		<%-- }else if(purchaseVO.getTranCode() != null && purchaseVO.getTranCode().trim().equals("2")) { --%>
		<%-- }else { --%>
		<x:when test="${!empty purchase.tranCode and purchase.tranCode eq '2' }">
			
		</x:when>
		<x:otherwise>
			<a href="/purchase/updatePurchaseView.do?tranNo=${purchase.tranNo }<%-- purchaseVO.getTranNo() --%>">�����ϱ�</a>
		</x:otherwise>
		<%-- } --%>
		</x:choose>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<%-- } --%>
	</x:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 <%-- int pageUnit = Integer.parseInt(request.getServletContext().getInitParameter("pageSize"));
		 int totalPage = count / pageUnit;
		 if(count % pageUnit != 0)
			 totalPage += 1;
		 
		 if(p.getBeginUnitPage() == 1){ --%>
		 <x:choose>
		 <x:when test="${resultPage.beginUnitPage == 1 }">
			 �� ����
		</x:when>
		<%-- }else{  --%>
		<x:otherwise>
			 <a href="/purchase/listPurchase.do?page=${resultPage.beginUnitPage -1 }<%-- p.getBeginUnitPage() - 1 --%>">�� ����</a>
		</x:otherwise>
		</x:choose>
		<%-- }
		 
		 for(int i = p.getBeginUnitPage(); i <= p.getEndUnitPage(); i++) { --%>
		<x:forEach var="i" begin="${resultPage.beginUnitPage }" end="${resultPage.endUnitPage }" step="1">
			<a href="/purchase/listPurchase.do?page=${i }<%-- i --%>">${i }<%-- i --%></a> 
		</x:forEach>
		<%-- } --%>
		
		<%-- if(p.getEndUnitPage() >= p.getMaxPage()) {--%>
		<x:choose>
		<x:when test="${resultPage.endUnitPage >= resultPage.maxPage }">
				���� ��
		</x:when>
		<%-- }else { --%>
		<x:otherwise>
				<a href="/purchase/listPurchase.do?page=${resultPage.endUnitPage + 1 }<%-- p.getEndUnitPage() + 1 --%>">���� ��</a>
		</x:otherwise>
		</x:choose>
		<%-- } --%>
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>