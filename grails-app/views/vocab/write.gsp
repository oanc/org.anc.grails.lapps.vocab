<%--
  Created by IntelliJ IDEA.
  User: suderman
  Date: 1/3/15
  Time: 12:11 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="application"/>
    <title>Write Vocabulary DSL</title>
</head>

<body>
<g:render template="/layouts/menu" model="['current':3]"/>
<wp:outer>
    <menu:navbar>
        <menu:item link="/">Home</menu:item>
    </menu:navbar>
    <wp:inner>
        <wp:flash/>
        <wp:section title="Vocabulary Management">
            <p>Generated the vocabulary DSL from the database entries.</p>
            <g:textArea class="big" name="dsl" value="${text}"/>
        </wp:section>
    </wp:inner>
</wp:outer>
</body>
</html>