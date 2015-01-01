<%@ page import="org.anc.grails.lapps.vocab.Element" %>
<%@ page import="org.anc.grails.lapps.vocab.Property" %>
<%@ page import="org.anc.grails.lapps.vocab.Uri" %>



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
	<!-- <g:textField name="sameAs" value="${elementInstance?.sameAs}"/> -->
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
	<!-- <g:textField name="similarTo" value="${elementInstance?.similarTo}"/> -->
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

