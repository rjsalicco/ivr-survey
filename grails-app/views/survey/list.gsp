<%@ page import="com.axiomaticit.model.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="list" controller="grammar" action="list"><g:message code="default.list.label" args="['Grammar']"/></g:link></span>
        	<span class="menuButton"><g:link class="list" controller="questionType" action="list"><g:message code="default.list.label" args="['Question Type']"/></g:link></span>
			<span class="menuButton"><g:link class="list" controller="message" action="list"><g:message code="default.list.label" args="['Message']"/></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'survey.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dnis" title="${message(code: 'survey.dnis.label', default: 'Dnis')}" />
                        
                            <g:sortableColumn property="lineOfBusiness" title="${message(code: 'survey.lineOfBusiness.label', default: 'Line Of Business')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'survey.title.label', default: 'Title')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: surveyInstance, field: "dnis")}</td>
                        
                            <td>${fieldValue(bean: surveyInstance, field: "lineOfBusiness")}</td>
                        
                            <td>${fieldValue(bean: surveyInstance, field: "title")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${surveyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
