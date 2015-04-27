<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<table class="grid">
			<tr>
				<th>单位名称</th>
				<td colspan="3">
				<input name="companyName" value="${customer.companyName}"
					style="width: 100%; height: 100%" type="text" id="name"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>客服电话</th>
				<td><input name="servicePhone" value="${customer.servicePhone}"
					style="width: 100%; height: 100%" type="text" id="code"
					class="easyui-validatebox span2" readonly="readonly" /></td>
					
				<th>传真号码</th>
				<td><input name="fax" type="text" id="fax"
					value="${customer.fax}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>联系人姓名</th>
				<td><input name="contactPerson" value="${customer.contactPerson}"
					style="width: 100%; height: 100%" type="text" id="code"
					class="easyui-validatebox span2" readonly="readonly" /></td>
					
				<th>联系人号码</th>
				<td><input name="contactPhone" type="text" id="contactPhone"
					value="${customer.contactPhone}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>备注</th>
				<td colspan="3">
				<input name="remark" value="${customer.remark}"
					style="width: 100%; height: 100%" type="text" id="name"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
		</table>
	</div>
</div>