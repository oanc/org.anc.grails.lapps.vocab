
<%@ page import="grailshtmlgen.Element" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-element" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-element" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list element">
			
				<g:if test="${elementInstance?.definition}">
				<li class="fieldcontain">
					<span id="definition-label" class="property-label"><g:message code="element.definition.label" default="Definition" /></span>
					
						<span class="property-value" aria-labelledby="definition-label"><g:fieldValue bean="${elementInstance}" field="definition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="element.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${elementInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="element.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="element" action="show" id="${elementInstance?.parent?.id}">${elementInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.sameAs}">
				<li class="fieldcontain">
					<span id="sameAs-label" class="property-label"><g:message code="element.sameAs.label" default="Same As" /></span>
					
						<span class="property-value" aria-labelledby="sameAs-label"><g:fieldValue bean="${elementInstance}" field="sameAs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.similarTo}">
				<li class="fieldcontain">
					<span id="similarTo-label" class="property-label"><g:message code="element.similarTo.label" default="Similar To" /></span>
					
						<span class="property-value" aria-labelledby="similarTo-label"><g:fieldValue bean="${elementInstance}" field="similarTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.uri}">
				<li class="fieldcontain">
					<span id="uri-label" class="property-label"><g:message code="element.uri.label" default="Uri" /></span>
					
						<span class="property-value" aria-labelledby="uri-label"><g:fieldValue bean="${elementInstance}" field="uri"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:elementInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${elementInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
