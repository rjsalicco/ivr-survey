<%@ page import="com.axiomaticit.model.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dnis"><g:message code="survey.dnis.label" default="Dnis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'dnis', 'errors')}">
                                    <g:textField name="dnis" value="${surveyInstance?.dnis}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lineOfBusiness"><g:message code="survey.lineOfBusiness.label" default="Line Of Business" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'lineOfBusiness', 'errors')}">
                                    <g:textField name="lineOfBusiness" value="${surveyInstance?.lineOfBusiness}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="survey.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${surveyInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="noInput"><g:message code="question.noInput.label" default="No Input Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'noInput', 'errors')}">
                                    <g:select name="noInput.id" from="${org.axiomaticit.model.Message.list()}" optionKey="id" value="${surveyInstance?.noInput?.id}" noSelection="['null':'No Message']" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="noMatch"><g:message code="question.noMatch.label" default="No Match Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'noMatch', 'errors')}">
                                    <g:select name="noMatch.id" from="${org.axiomaticit.model.Message.list()}" optionKey="id" value="${surveyInstance?.noMatch?.id}" noSelection="['null':'No Message']" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
				<div class="promptButtons">
					<span class="menuButton"><g:link class="create" controller="prompt" action="create" params="['survey.id': surveyInstance?.id, 'playOrder': surveyInstance?.prompts?.size() + 1]">${message(code: 'default.add.label', args: [message(code: 'prompt.label', default: 'Prompt')])}</g:link></span>
					<span class="menuButton"><g:link class="create" controller="question" action="create" params="['survey.id': surveyInstance?.id, 'playOrder': surveyInstance?.prompts?.size() + 1]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link></span>
				</div>
	            <div class="list">
	                <table>
	                    <thead>
	                        <tr>

	                            <g:sortableColumn property="id" title="${message(code: 'prompt.id.label', default: 'Id')}" />

	                            <g:sortableColumn property="name" title="${message(code: 'prompt.name.label', default: 'Name')}" />

	                            <g:sortableColumn property="playOrder" title="${message(code: 'prompt.playOrder.label', default: 'Play Order')}" />

	                            <g:sortableColumn property="text" title="${message(code: 'prompt.text.label', default: 'Text')}" />

	                        </tr>
	                    </thead>
	                    <tbody>
	                    <g:each in="${surveyInstance?.prompts?}" status="i" var="promptInstance">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

	                            <td><g:link controller="prompt" action="edit" id="${promptInstance.id}">${fieldValue(bean: promptInstance, field: "id")}</g:link></td>

	                            <td>${fieldValue(bean: promptInstance, field: "name")}</td>

	                            <td>${fieldValue(bean: promptInstance, field: "playOrder")}</td>

	                            <td>${fieldValue(bean: promptInstance, field: "text")}</td>

	                        </tr>
	                    </g:each>
	                    </tbody>
	                </table>
	            </div>
                <div class="buttons">
					<span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
				</div>
            </g:form>
        </div>
    </body>
</html>
