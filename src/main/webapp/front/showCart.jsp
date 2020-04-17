<%@page contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<body>
		<table border="1px" align="center" cellpadding="0" cellspacing="0" width="70%">
			<tr align="center" bgcolor="blue">
				<td>ID</td><td>Name</td><td>price</td><td>count</td><td>smallPrice</td>
			</tr>
			<c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
				<tr align="center" bgcolor="yellow">
					<td>${cartItem.value.product.id}</td><td>${cartItem.value.product.name}</td><td>${cartItem.value.product.price}</td><td>${cartItem.value.count}</td><td>${cartItem.value.smallPrice}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right">总价：${sessionScope.cart.totalPrice}</td>
			</tr>
			<tr>
				<td colspan="5" align="center"><a href="/jsp_day3/queryAll">返回继续挑选</a></td>
			</tr>
		</table>
	</body>
</html>