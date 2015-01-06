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
    <title>Parse Vocabulary DSL</title>
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
                <p>The vocabulary DSL has been parsed.</p>
                <button:info link="/vocab/parse">Parse</button:info>
                <button:primary link="/vocab/write">Write</button:primary>
            </wp:section>
        </wp:inner>
    </wp:outer>
</body>
</html>