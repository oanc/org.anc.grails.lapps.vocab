
<%@ page import="grailshtmlgen.Element" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-element" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-element" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="definition" title="${message(code: 'element.definition.label', default: 'Definition')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'element.name.label', default: 'Name')}" />
					
						<th><g:message code="element.parent.label" default="Parent" /></th>
					
						<g:sortableColumn property="sameAs" title="${message(code: 'element.sameAs.label', default: 'Same As')}" />
					
						<g:sortableColumn property="similarTo" title="${message(code: 'element.similarTo.label', default: 'Similar To')}" />
					
						<g:sortableColumn property="uri" title="${message(code: 'element.uri.label', default: 'Uri')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${elementInstanceList}" status="i" var="elementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${elementInstance.id}">${fieldValue(bean: elementInstance, field: "definition")}</g:link></td>
					
						<td>${fieldValue(bean: elementInstance, field: "name")}</td>
					
						<td><g:if test="${elementInstance.parent == null}">None</g:if>
						<g:else><g:link controller="element" action="show" id="${elementInstance?.parent?.id}">${elementInstance?.parent?.name.encodeAsHTML()}</g:link></g:else></td>
					
						<td>${fieldValue(bean: elementInstance, field: "sameAs")}</td>
					
						<td>${fieldValue(bean: elementInstance, field: "similarTo")}</td>
					
						<td>${fieldValue(bean: elementInstance, field: "uri")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${elementInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
