<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>${tabnm}AddView</title>
		<script type="text/javascript">
		
		function submitTo(url) {
			alert(url) ;
			document.all.addForm.action = url ;
			// Struts2会自动提交
			//document.all.addForm.submit() ;
		}
		</script>
	</head>
	<body>
	<s:debug></s:debug>
		<s:form method="post" name="addForm">
			<table>
				<tr>
					<td colspan="1" align="center">
						${requestScope.addTitle }
					</td>
				</tr>
				<tr>
					<td>
						<s:hidden name="id" value="pk_string"></s:hidden>
						</td>
					<s:iterator id="opt" value="#request.option">
						<td>
							<s:iterator id="prop" value="#request.prop" status="sta">
							<td>								
								
									<s:if test="#entityRefMap[#prop.id+#sta.index+'url'] != null"><!-- 有link -->
										<s:a href="%{#entityRefMap[#prop.id+#sta.index+'url']}">
											<s:property value="#entityRefMap[#prop.id+#sta.index]"/>
										</s:a>
									</s:if>
									<s:else>
										<s:property value="#entityRefMap[#prop.id+#sta.index]"/>
									</s:else>						
						
							</td>
						</s:iterator>
						</td>
					</s:iterator>					
				</tr>
			</table>
		
			<table>
				<tr>
					<s:iterator id="button" value="#request.button">
						<td>
							<s:submit href="#" onclick="submitTo('${button.linkRef}')" value="${button.msg}" theme="simple"/>
						</td>
					</s:iterator>
				</tr>
			</table>			
		</s:form>		
	</body>
</html>
