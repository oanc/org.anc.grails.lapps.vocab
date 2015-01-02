<%@ page import="org.springframework.validation.FieldError" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/menu" model="['current':1]"/>
		<wp:outer>
			<menu:navbar>
				<menu:item link="/">Home</menu:item>
				<menu:item link="/property/index">Property List</menu:item>
			</menu:navbar>
			<wp:inner>
				<wp:flash/>
				<div id="create-property" class="content scaffold-create" role="main">
					<h1>New Property</h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${propertyInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${propertyInstance}" var="error">
								<li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:propertyInstance, action:'save']" >
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</wp:inner>
		</wp:outer>
	</body>
</html>
