<%@ page import="org.anc.grails.lapps.vocab.Element" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/menu" model="['current':0]"/>
		<wp:outer>
			<menu:navbar>
				<menu:item class="home" link="/index">Home</menu:item>
				<menu:item class="list" link="/element/index">Element List</menu:item>
				<menu:item class="create" link="/element/create">New Element</menu:item>
			</menu:navbar>
			<wp:inner>
				<div id="edit-element" class="content scaffold-edit" role="main">
					<h1>Edit ${elementInstance?.name}</h1>
					<g:hasErrors bean="${elementInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${elementInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:elementInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${elementInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</fieldset>
					</g:form>
				</div>
			</wp:inner>
		</wp:outer>
	</body>
</html>
