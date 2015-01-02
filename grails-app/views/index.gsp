<%@ page import="org.anc.grails.lapps.vocab.Element" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
		<g:render template="/layouts/menu" model="['current':-1]"/>
		<wp:outer>
			<menu:navbar>
				<menu:item link="/element/create">New Element</menu:item>
				<menu:item link="/property/create">New Property</menu:item>
				<menu:item link="/uri/create">New URI</menu:item>
			</menu:navbar>
			<wp:inner>
				<wp:flash/>
				<g:each in="${org.anc.grails.lapps.vocab.Element.list()}" status="i" var="element">
					<wp:section title="${element.name}">
						<p>${element.definition}</p>
						<table>
							<tr>
								<th>URI</th>
								<td>${element.uri}</td>
							</tr>
							<tr>
								<th>Parent</th>
								<td>${element?.parent ?: 'None'}</td>
							</tr>
							<tr>
								<th>Properties</th>
								<td>${element.properties1}</td>
							</tr>
							<tr>
								<th>Same As</th>
								<td>${element.sameAs}</td>
							</tr>
							<tr>
								<th>Similar To</th>
								<td>${element.similarTo}</td>
							</tr>
						</table>
					</wp:section>
				</g:each>
			</wp:inner>
		</wp:outer>
	</body>
</html>
