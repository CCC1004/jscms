<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ql" uri="/qlight-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>巡检统计</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/all.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>pageframe/css/whpk.css">
	<script type="text/javascript" src="<%=basePath%>Components/jquery/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Components/echarts/echarts-all.js"></script>
    <style type="text/css">
    </style>
    </style>            
    <script type="text/javascript">
    	$(function(){
    		$.ajax({
    			type: 'post',
    			url: 'xjtjAction!echartsData.qact',//--url
    			dataType: 'json',
   				success: function(data){
   					//设置实例/系列列表数据
   					var pieData = getData(data);
   					//调用饼图
   					pieEchatsData(pieData);
   					//调用柱状图
   					barEchartsData(pieData);
   				},
    			error: function(e){
    			}
    		});
    		
    	});//init ------end
    	
    	/*	柱状图	*/
    	function barEchartsData(){
    		var myCharts = echarts.init(document.getElementById("bar_echats"));
    		var option = {
   				tooltip : {
   			        trigger: 'axis',
   			        axisPointer : { // 坐标轴指示器，坐标轴触发有效
   			            type : 'shadow'// 默认为直线，可选为：'line' | 'shadow'
   			        }
   			    },
   			    legend: {
   			    	x: 'center',
                    y: 'bottom',
   			        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎',]
   			    },
   			    grid: {
   			        left: '3%',
   			        right: '4%',
   			        bottom: '3%',
   			        containLabel: true
   			    },
   			    xAxis : [
   			        {
   			            type : 'category',
   			            data : ['周一','周二','周三','周四','周五','周六','周日']
   			        }
   			    ],
   			    yAxis : [
   			        {
   			            type : 'value'
   			        }
   			    ],
   			    series : [
   			        {
   			            name:'搜索引擎',
   			            type:'bar',
   			            data:[862, 1018, 964, 1026, 1679, 1600, 1570],
   			            markLine : {
   			                lineStyle: {
   			                    normal: {
   			                        type: 'dashed'
   			                    }
   			                },
   			                data : [
   			                    [{type : 'min'}, {type : 'max'}]
   			                ]
   			            }
   			        },
   			    ]
    		};//option ---end
    		myCharts.setOption(option);
    	}

    	
    	/* 饼图：	设置实例/系列列表数据	*/
    	function getData(data){
    		var legendData = [];//实例
			var seriesData = [];//系列列表
			for(var i=0;i<data.length;i++){
				var count = data[i].COUNTS;//--COUNTS：个数
				var name = data[i].RESULT;//--：RESULT：结果
				//设置实例/系列列表
				legendData.push(name);
				seriesData.push({
		            name: name,
		            value: count
		        });
			}
			console.info(legendData)
			console.info(seriesData)
	    	return {
	            legendData: legendData,
	            seriesData: seriesData
	        };
    	}//getData -----end
    	
    	/*	饼图	*/
    	function pieEchatsData(pieData){
    		var myCharts = echarts.init(document.getElementById("pie_echats"));
    		var option = {
   				title: {
   			        text: '巡检结果统计',
   			        subtext: '',
   			     	x: 'center',
   			    },
   			    tooltip : {
   			        trigger: 'item',
   			       // formatter: "{a} <br/>{b} : {c} ({d}%)"
   			        formatter: "{b} : {c} ({d}%)"
   			    },
   			    legend: {
   			    	x: 'center',
                    y: 'bottom',
   			        data: pieData.legendData//实例
   			    },
   			    series : [
   			           {
   			               type: 'pie',
   			               radius : '65%',
   			               center: ['50%', '50%'],
   			               selectedMode: 'single',
	   			           data: pieData.seriesData,//系列列表
	                       itemStyle: {
	                            emphasis: {
	                                shadowBlur: 10,
	                                shadowOffsetX: 0,
	                                shadowColor: 'rgba(128, 128, 128, 0.5)'
	                            }
	                        }
   			           }
   			    ]
   			    
    		};//option ---end
    		if (option && typeof option === "object") {
    			myCharts.setOption(option, true);
    		}
    	}
    </script>

  </head>
  
  <body>
    <div>
		<div id="pie_echats" style="width: 45%;height:300px;margin: 20px auto;float:left"></div>
		<div id="bar_echats" style="width: 45%;height:300px;margin: 20px auto;padding-right:5px;float:left"></div>
	</div>
  </body>
</html>
