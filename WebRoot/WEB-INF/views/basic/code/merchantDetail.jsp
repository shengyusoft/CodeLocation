<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="merchantAddForm" method="post">
			<table class="grid" border="1">
				<tr>
					<td colspan="4"><font color="#6394C6">基本信息</font></td>
				</tr>
				<tr>
					<td>服务商名称 
					<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td colspan="3"><input name="name" type="text" disabled="disabled"
						value ='${merchant.name}'
						class="easyui-validatebox span2" id="name" style="width: 520px;" />
					</td>
				</tr>
				<tr>
					<td>服务商类型 
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td>
						<input name="dictionaryText" type="text" disabled="disabled"
						value ='${merchant.dictionaryText}'
						class="easyui-validatebox span2" id="name" style="width: 205px;" />
					</td>
					<td>服务商编码 :
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td width="272"><input name="code" type="text" disabled="disabled"
						value ='${merchant.code}'
						style="width: 205px;" id="code" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td colspan="4"><font color="#6394C6">账号信息</font></td>
				</tr>
				<tr>
					<td>开户行 :
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td colspan="3"><input name="bank" type="text" disabled="disabled"
						value ='${merchant.bank}'
						class="easyui-validatebox span2" id="bank" style="width: 520px;" /></td>
				</tr>
				<tr>
					<td>账号: 
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td>
						<input name="account" type="number" disabled="disabled"
							value ='${merchant.account}'
							style="width: 205px;" id="account" class="easyui-validatebox span2" />
					</td>
					<td>税号: <label style="color: red; vertical-align: middle; text-align: center;">*</label></td>
					<td><input name="tax" type="text"  disabled="disabled"
						value ='${merchant.tax}'
						style="width: 205px;" id="tax" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td colspan="4"><font color="#6394C6">联系信息</font></td>
				</tr>
				<tr>
					<td>服务商地址</td>
					<td colspan="3"><input name="address" type="text"
						class="easyui-validatebox span2" id="address"
						disabled="disabled"
						value ='${merchant.address}'
						style="width: 520px;" /></td>
				</tr>
				<tr>
					<td>服务商网址 <label
						style="color: red; vertical-align: middle; text-align: center;"></label></td>
					<td colspan="3">
					<input name="website" type="text"
						value ='${merchant.website}'
						class="easyui-validatebox span2" id="website"
						disabled="disabled"
						style="width: 520px;" /></td>
				</tr>
				<tr>
					<td>邮编</td>
					<td>
					<input name="postCode" type="text"
						value ='${merchant.postCode}'
						style="width: 205px;" id="postCode"
						disabled="disabled"
						class="easyui-validatebox span2" /></td>
					<td>电子邮件 <label style="color: red; vertical-align: middle; text-align: center;">*</label></td>
					<td>
					<input name="email" type="text" disabled="disabled"
						value ='${merchant.email}'
						style="width: 205px;" id="email"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td>联系人</td>
					<td><input name="contact" type="text"
						style="width: 205px;" id="contact"
						value ='${merchant.contact}'
						disabled="disabled"
						class="easyui-validatebox span2" /></td>
					<td>手机号码</td>
					<td><input name="mobilePhone" type="text"
						style="width: 205px;" id="mobilePhone"
						disabled="disabled"
						value ='${merchant.mobilePhone}'
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td>办公电话</td>
					<td><input name="officeNumber" type="text"
						style="width: 205px;" id="officeNumber"
						value ='${merchant.officeNumber}'
						disabled="disabled"
						class="easyui-validatebox span2" /></td>
					<td>传真号码</td>
					<td><input name="faxNumber" type="text"
						style="width: 205px;" id="faxNumber"
						value ='${merchant.faxNumber}'
						disabled="disabled"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td>备注</td>
					<td colspan="3"><textarea name="remark" disabled="disabled" cols="" rows="4"
							style="width: 520px;">${merchant.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>