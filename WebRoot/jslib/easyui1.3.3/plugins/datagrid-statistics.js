/**
 * datagrid plugin for footer statics
 * contains sum and avg
 * @author sunsi
 */
$.extend($.fn.datagrid.methods, {
	statistics: function (jq) {
		//取出所有列
		var opt = [];//最终的所有列
		var col=$(jq).datagrid('options').columns;
		var frozencol=$(jq).datagrid('options').frozenColumns;
		for(var i = 0; i <frozencol.length; i++){
			Array.prototype.push.apply(opt, frozencol[i]);
		}
		for(var i = 0; i <col.length; i++){
			Array.prototype.push.apply(opt, col[i]);
		}
		
		//取出所有行计算
		var rows = $(jq).datagrid("getRows");
		
		var footer = new Array();
		footer['sum'] = "";
		footer['avg'] = "";
		footer['max'] = "";
		footer['min'] = "";
		
		for(var i=0; i<opt.length; i++){
			if(opt[i].sum){
				footer['sum'] = footer['sum'] + sum(opt[i].field)+ ',';
			}
			if(opt[i].avg){
				footer['avg'] = footer['avg'] + avg(opt[i].field)+ ',';
			}
			if(opt[i].max){
				footer['max'] = footer['max'] + max(opt[i].field)+ ',';
			}
			if(opt[i].min){
				footer['min'] = footer['min'] + min(opt[i].field)+ ',';
			}
		}

		var footerObj = new Array();
		
		if(footer['sum'] != ""){
			var tmp = '{' + footer['sum'].substring(0,footer['sum'].length - 1) + "}";
			var obj = eval('(' + tmp + ')');
			if(obj[opt[0].field] == undefined){
				if(opt[0].field == 'id'){
					footer['sum'] += '"' + opt[1].field + '":"<b>当页合计:</b>"';
				}else{
					footer['sum'] += '"' + opt[0].field + '":"<b>当页合计:</b>"';
				}
				obj = eval('({' + footer['sum'] + '})');
			}else{
				if(opt[0].field == 'id'){
					obj[opt[1].field] = "<b>当页合计:</b>" + obj[opt[0].field];
				}else{
					obj[opt[0].field] = "<b>当页合计:</b>" + obj[opt[0].field];
				}
				
			}
			footerObj.push(obj);
		}
		
		if(footer['avg'] != ""){
			var tmp = '{' + footer['avg'].substring(0,footer['avg'].length - 1) + "}";
			var obj = eval('(' + tmp + ')');
			if(obj[opt[0].field] == undefined){
				footer['avg'] += '"' + opt[0].field + '":"<b>当页均值:</b>"';
				obj = eval('({' + footer['avg'] + '})');
			}else{
				obj[opt[0].field] = "<b>当页均值:</b>" + obj[opt[0].field];
			}
			footerObj.push(obj);
		}
		
		if(footer['max'] != ""){
			debugger;
			var tmp = '{' + footer['max'].substring(0,footer['max'].length - 1) + "}";
			var obj = eval('(' + tmp + ')');
			
			if(obj[opt[0].field] == undefined){
				footer['max'] += '"' + opt[0].field + '":"<b>当页最大值:</b>"';
				obj = eval('({' + footer['max'] + '})');
			}else{
				obj[opt[0].field] = "<b>当页最大值:</b>" + obj[opt[0].field];
			}
			footerObj.push(obj);
		}
		
		if(footer['min'] != ""){
			var tmp = '{' + footer['min'].substring(0,footer['min'].length - 1) + "}";
			var obj = eval('(' + tmp + ')');
			
			if(obj[opt[0].field] == undefined){
				footer['min'] += '"' + opt[0].field + '":"<b>当页最小值:</b>"';
				obj = eval('({' + footer['min'] + '})');
			}else{
				obj[opt[0].field] = "<b>当页最小值:</b>" + obj[opt[0].field];
			}
			footerObj.push(obj);
		}
		
		
		
		if(footerObj.length > 0){
			$(jq).datagrid('reloadFooter',footerObj);
		}
		
		
		function sum(filed){
			var sumNum = 0;
			for(var i=0;i<rows.length;i++){
				sumNum += Number(rows[i][filed]);
			}
			return '"' + filed + '":"' + sumNum.toFixed(2) +'"';
		};
		
		function getSum(){
			return sum;
		}
		
		function avg(filed){
			var sumNum = 0;
			for(var i=0;i<rows.length;i++){
				sumNum += Number(rows[i][filed]);
			}
			return '"' + filed + '":"'+ (sumNum/rows.length).toFixed(2) +'"';
		}

		function max(filed){
			var max = 0;
			for(var i=0;i<rows.length;i++){
				if(i==0){
					max = Number(rows[i][filed]);
				}else{
					max = Math.max(max,Number(rows[i][filed]));
				}
			}
			return '"' + filed + '":"'+ max +'"';
		}
		
		function min(filed){
			var min = 0;
			for(var i=0;i<rows.length;i++){
				if(i==0){
					min = Number(rows[i][filed]);
				}else{
					min = Math.min(min,Number(rows[i][filed]));
				}
			}
			return '"' + filed + '":"'+ min +'"';
		}
	}
});