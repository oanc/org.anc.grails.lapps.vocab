<%@ page import="grailshtmlgen.Element" %>



<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'definition', 'error')} ">
	<label for="definition">
		<g:message code="element.definition.label" default="Definition" />
		
	</label>
	<g:textField name="definition" value="${elementInstance?.definition}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="element.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${elementInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="element.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${grailshtmlgen.Element.list()}" optionKey="id" required="" value="${elementInstance?.parent?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'properties1', 'error')} required">
	<label for="properties1">
		<g:message code="element.property.label" default="Property" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="property" name="property.id" from="${grailshtmlgen.Property.list()}" optionKey="id" required="" value="${elementInstance?.properties1?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'sameAs', 'error')} ">
	<label for="sameAs">
		<g:message code="element.sameAs.label" default="Same As" />
		
	</label>
	<!-- <g:textField name="sameAs" value="${elementInstance?.sameAs}"/> -->
	<g:select id="sameAs" name="sameAs" from="${grailshtmlgen.Uri.list()}" optionKey="id" required="required" value="${elementInstance?.sameAs.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'similarTo', 'error')} ">
	<label for="similarTo">
		<g:message code="element.similarTo.label" default="Similar To" />
		
	</label>
	<!-- <g:textField name="similarTo" value="${elementInstance?.similarTo}"/> -->
	<g:select id="similarTo" name="similarTo" from="${grailshtmlgen.Uri.list()}" optionKey="id" required="required" value="${elementInstance?.similarTo.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'uri', 'error')} ">
	<label for="uri">
		<g:message code="element.uri.label" default="Uri" />
		
	</label>
	<g:textField name="uri" value="${elementInstance?.uri}"/>
</div>

