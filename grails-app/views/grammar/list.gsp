<%@ page import="com.axiomaticit.model.Grammar" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'grammar.label', default: 'Grammar')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'grammar.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="contentType" title="${message(code: 'grammar.contentType.label', default: 'Content Type')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'grammar.name.label', default: 'Name')}" />

                            <g:sortableColumn property="mode" title="${message(code: 'grammar.mode.label', default: 'Mode')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${grammarInstanceList}" status="i" var="grammarInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${grammarInstance.id}">${fieldValue(bean: grammarInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: grammarInstance, field: "contentType")}</td>
                        
                            <td>${fieldValue(bean: grammarInstance, field: "name")}</td>

                            <td>${fieldValue(bean: grammarInstance, field: "mode")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${grammarInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
