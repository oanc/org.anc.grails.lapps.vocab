
<%@ page import="org.anc.grails.lapps.vocab.Property" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/menu" model="['current':1]"/>
		<wp:outer>
			<menu:navbar>
				<menu:item link="/index">Home</menu:item>
				<menu:item link="/property/create">New Property</menu:item>
			</menu:navbar>
			<wp:inner>
				<wp:flash/>
				<div id="show-property" class="content scaffold-show" role="main">
					<h1>Show ${propertyInstance?.name}</h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<ol class="property-list property">

						<g:if test="${propertyInstance?.description}">
							<li class="fieldcontain">
								<span id="description-label" class="property-label"><g:message code="property.description.label" default="Description" /></span>

								<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${propertyInstance}" field="description"/></span>

							</li>
						</g:if>

						<g:if test="${propertyInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="property.name.label" default="Name" /></span>

								<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${propertyInstance}" field="name"/></span>

							</li>
						</g:if>

						<g:if test="${propertyInstance?.type}">
							<li class="fieldcontain">
								<span id="type-label" class="property-label"><g:message code="property.type.label" default="Type" /></span>

								<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${propertyInstance}" field="type"/></span>

							</li>
						</g:if>

					</ol>
					<g:form url="[resource:propertyInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${propertyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</wp:inner>
		</wp:outer>
	</body>
</html>
