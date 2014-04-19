<%@ page import="com.axiomaticit.report.SurveyCall" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surveyCall.label', default: 'SurveyCall')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'surveyCall.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="callerId" title="${message(code: 'surveyCall.callerId.label', default: 'Caller Id')}" />
                        
                            <g:sortableColumn property="dnis" title="${message(code: 'surveyCall.dnis.label', default: 'Dnis')}" />
                        
                            <g:sortableColumn property="endDateTime" title="${message(code: 'surveyCall.endDateTime.label', default: 'End Date Time')}" />
                        
                            <g:sortableColumn property="incoming" title="${message(code: 'surveyCall.incoming.label', default: 'Incoming')}" />
                        
                            <g:sortableColumn property="startDateTime" title="${message(code: 'surveyCall.startDateTime.label', default: 'Start Date Time')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyCallInstanceList}" status="i" var="surveyCallInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${surveyCallInstance.id}">${fieldValue(bean: surveyCallInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: surveyCallInstance, field: "callerId")}</td>
                        
                            <td>${fieldValue(bean: surveyCallInstance, field: "dnis")}</td>
                        
                            <td><g:formatDate date="${surveyCallInstance.endDateTime}" /></td>
                        
                            <td>${fieldValue(bean: surveyCallInstance, field: "incoming")}</td>
                        
                            <td><g:formatDate date="${surveyCallInstance.startDateTime}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${surveyCallInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
