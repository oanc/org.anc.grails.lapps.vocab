
<%@ page import="org.anc.grails.lapps.vocab.Property" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:render template="/layouts/menu" model="['current':1]"/>
	<wp:outer>
		<menu:navbar>
			<menu:item link="/">Home</menu:item>
			<menu:item link="/property/create">New Property</menu:item>
		</menu:navbar>
		<wp:inner>
			<wp:flash/>
		<div id="list-property" class="content scaffold-list" role="main">
			<h1>Properties</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'property.name.label', default: 'Name')}" />
						<g:sortableColumn property="description" title="${message(code: 'property.description.label', default: 'Description')}" />
						<g:sortableColumn property="type" title="${message(code: 'property.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${propertyInstanceList}" status="i" var="propertyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${propertyInstance.id}">${fieldValue(bean: propertyInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: propertyInstance, field: "description")}</td>
						<td>${fieldValue(bean: propertyInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${propertyInstanceCount ?: 0}" />
			</div>
		</div>
		</wp:inner>
	</wp:outer>
	</body>
</html>
