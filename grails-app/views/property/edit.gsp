<%@ page import="org.anc.grails.lapps.vocab.Property" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/menu" model="['current':1]"/>
		<wp:outer>
			<menu:navbar>
				<menu:item link="/">Home</menu:item>
				<menu:item link="/property/index">Property List</menu:item>
				<menu:item link="/property/create">New Property</menu:item>
			</menu:navbar>
			<wp:inner>
				<wp:flash/>
				<div id="edit-property" class="content scaffold-edit" role="main">
					<h1>Edit ${propertyInstance?.name}</h1>
					<g:if test="${flash.message}">
	 					<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${propertyInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${propertyInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:propertyInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${propertyInstance?.version}" />
						<fieldset class="form rounded">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" value="Save" />
						</fieldset>
					</g:form>
				</div>
			</wp:inner>
		</wp:outer>
	</body>
</html>
