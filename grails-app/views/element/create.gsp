<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/menu" model="['current':0]"/>
		<wp:outer>
			<menu:navbar>
				<menu:item link="/index">Home</menu:item>
				<menu:item link="/element/index">Element List</menu:item>
			</menu:navbar>
			<wp:inner>
				<div id="create-element" class="content scaffold-create" role="main">
					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
					<g:hasErrors bean="${elementInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${elementInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:elementInstance, action:'save']" >
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
