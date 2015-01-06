<%--
  Created by IntelliJ IDEA.
  User: suderman
  Date: 1/2/15
  Time: 11:55 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="application">
  <title>Vocabulary Management</title>
</head>
<body>
  <g:render template="/layouts/menu" model="['current':3]"/>
  <wp:outer>
    <menu:navbar>
      <menu:item link="/">Home</menu:item>
    </menu:navbar>
    <wp:inner>
      <wp:flash/>
      <wp:section title="Parse Vocabulary DSL">
        <p>Parse the vocabulary DSL file stored with the web application.
        Currently there is no way to input the DSL to be parsed. Future versions
        of the application will allow the DSL file to be uploaded or entered into
        a text area (form).</p>
        <button:primary link="/vocab/parse">Parse</button:primary>
      </wp:section>
      <wp:section title="Write Vocabulary DSL">
        <p>Generates the vocabulary DSL file from the entries stored in the
        database.  The text of the DSL must be copied and pasted into an
        external file.</p>
        <button:primary link="/vocab/write">Write</button:primary>
      </wp:section>
    </wp:inner>
  </wp:outer>
</body>
</html>