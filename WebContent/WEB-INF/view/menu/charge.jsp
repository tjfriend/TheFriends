<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="w3-row" style="margin-top: 50px">
	<h2>Charge</h2>
	<form action="/charge/cash" method="post">
	충전 금액 <input type="text" name="point"/>
	<input type="submit" value="충전하기">
	</form>
	<br/><br/>
	
	<form action="/charge/view">
		<input type="submit" name="charge" value="선물하기"/><br/>
	</form>
	
	<form action="/charge/chargeAll">
	<input type="submit" value="충전내역"/>
	</form>

	<input type="button" name="charge" value="사용내역"/>
</div>