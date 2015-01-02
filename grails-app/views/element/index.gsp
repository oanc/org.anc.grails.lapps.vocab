
<%@ page import="org.anc.grails.lapps.vocab.Element" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

	</head>
	<body>
		<g:render template="/layouts/menu" model="['current':0]"/>
		<wp:flash/>
		<wp:outer>
			<menu:navbar>
				<menu:item link="/">Home</menu:item>
				<menu:item link="/element/create">New Element</menu:item>
			</menu:navbar>
			<wp:inner>
				<wp:flash/>
				<wp:section title="Elements">
					<table>
						<thead>
						<tr>

							<g:sortableColumn property="name" title="${message(code: 'element.name.label', default: 'Name')}" />

							<g:sortableColumn property="definition" title="${message(code: 'element.definition.label', default: 'Definition')}" />

							<th><g:message code="element.parent.label" default="Parent" /></th>

							<g:sortableColumn property="sameAs" title="${message(code: 'element.sameAs.label', default: 'Same As')}" />

							<g:sortableColumn property="similarTo" title="${message(code: 'element.similarTo.label', default: 'Similar To')}" />

							<g:sortableColumn property="uri" title="${message(code: 'element.uri.label', default: 'Uri')}" />
							<th>Properties</th>

						</tr>
						</thead>
						<tbody>
						<g:each in="${elementInstanceList}" status="i" var="elementInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${elementInstance.id}">${elementInstance.name }</g:link></td>
								<td>${elementInstance.definition}</td>
								<td><g:link action="show" id="${elementInstance?.parent?.id}">${elementInstance.parent}</g:link></td>
								<td>${elementInstance.sameAs }</td>
								<td>${elementInstance.similarTo}</td>
								<td>${elementInstance.uri}</td>
								<td>${elementInstance.properties1}</td>
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${elementInstanceCount ?: 0}" />
					</div>
				</wp:section>
			</wp:inner>
		</wp:outer>
	</body>
</html>
