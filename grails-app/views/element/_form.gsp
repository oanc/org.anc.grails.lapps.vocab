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

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'sameAs', 'error')} ">
	<label for="sameAs">
		<g:message code="element.sameAs.label" default="Same As" />
		
	</label>
	<g:textField name="sameAs" value="${elementInstance?.sameAs}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'similarTo', 'error')} ">
	<label for="similarTo">
		<g:message code="element.similarTo.label" default="Similar To" />
		
	</label>
	<g:textField name="similarTo" value="${elementInstance?.similarTo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: elementInstance, field: 'uri', 'error')} ">
	<label for="uri">
		<g:message code="element.uri.label" default="Uri" />
		
	</label>
	<g:textField name="uri" value="${elementInstance?.uri}"/>
</div>

