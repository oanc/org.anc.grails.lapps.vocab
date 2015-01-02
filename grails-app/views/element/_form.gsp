<%@ page import="org.anc.grails.lapps.vocab.Element" %>
<%@ page import="org.anc.grails.lapps.vocab.Property" %>
<%@ page import="org.anc.grails.lapps.vocab.Uri" %>

<table>
	<tr>
		<td class="top-right">Name</td>
		<td><g:textField name="name" value="${elementInstance?.name}"/></td>
	</tr>
	<tr>
		<td class="top-right">Definition</td>
		<td><g:textArea name="definition" value="${elementInstance?.definition}"/> </td>
	</tr>
	<tr>
		<td class="top-right">Parent</td>
		<td>
			<g:select id="parent"
						  name="parent.id"
						  from="${Element.list()}"
						  optionKey="id"
						  noSelection="${['null':'None']}"
						  value="${elementInstance?.parent?.id}"/>
		</td>
	</tr>
	<tr>
		<td class="top-right">Properties</td>
		<td>
			<g:select id="properties1"
					  name="properties1"
					  from="${Property.list()}"
					  optionKey="id"
					  noSelection="${['null' : 'None']}"
					  value="${elementInstance?.properties1*.id}"
					  multiple="true"/>
		</td>
	</tr>
	<tr>
		<td class="top-right">Same As</td>
		<td>
			<g:select id="sameAs"
					  name="sameAs"
					  from="${Uri.list()}"
					  optionKey="id"
					  noSelection="${['null' : 'None']}"
					  value="${elementInstance.sameAs*.id}"
					  multiple="true"/>
		</td>
	</tr>
	<tr>
		<td class="top-right">Similar To</td>
		<td>
			<g:select id="similarTo"
					  name="similarTo"
					  width="50"
					  from="${Uri.list()}"
					  noSelection="${['null' : 'None']}"
					  value="${elementInstance.sameAs*.id}"
					  optionKey="id"
					  multiple="true"/>
		</td>
	</tr>
	<tr>
		<td class="top-right">URI</td>
		<td>
			<g:textField name="uri" value="${elementInstance?.uri}" size="50"/>
		</td>
	</tr>
</table>

<!--
<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="element.name.label" default="Name" />

	</label>
	<g:textField name="name" value="${elementInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'definition', 'error')} ">
	<label for="definition">
		<g:message code="element.definition.label" default="Definition" />
		
	</label>
	<g:textArea name="definition" value="${elementInstance?.definition}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="element.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent"
			  name="parent.id"
			  from="${Element.list()}"
			  optionKey="id"
		      noSelection="${['null':'None']}"
			  value="${elementInstance?.parent?.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'properties1', 'error')} required">
	<label for="properties1">
		<g:message code="element.property.label" default="Properties" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="properties1"
			  name="properties1"
			  from="${Property.list()}"
			  optionKey="id"
			  noSelection="${['null' : 'None']}"
		      value="${elementInstance?.properties1*.id}"
			  multiple="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'sameAs', 'error')} ">
	<label for="sameAs">
		<g:message code="element.sameAs.label" default="Same As" />
		
	</label>
	<g:select id="sameAs"
			  name="sameAs"
			  from="${Uri.list()}"
			  optionKey="id"
			  noSelection="${['null' : 'None']}"
		      value="${elementInstance.sameAs*.id}"
			  multiple="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'similarTo', 'error')} ">
	<label for="similarTo">
		<g:message code="element.similarTo.label" default="Similar To" />
		
	</label>
	<g:select id="similarTo"
			  name="similarTo"
		      width="50"
			  from="${Uri.list()}"
			  noSelection="${['null' : 'None']}"
			  value="${elementInstance.sameAs*.id}"
			  optionKey="id"
			  multiple="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'uri', 'error')} ">
	<label for="uri">
		<g:message code="element.uri.label" default="Uri" />
		
	</label>
	<g:textField name="uri" value="${elementInstance?.uri}" size="50"/>
</div>
-->
