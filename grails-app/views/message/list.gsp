<%@ page import="com.axiomaticit.model.Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'message.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'message.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="contentType" title="${message(code: 'message.contentType.label', default: 'Content Type')}" />
                        
                            <g:sortableColumn property="fileName" title="${message(code: 'message.fileName.label', default: 'File Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "contentType")}</td>
                        
                            <td>${fieldValue(bean: messageInstance, field: "fileName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${messageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
