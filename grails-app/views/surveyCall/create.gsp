<%@ page import="com.axiomaticit.report.SurveyCall" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surveyCall.label', default: 'SurveyCall')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyCallInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyCallInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="callerId"><g:message code="surveyCall.callerId.label" default="Caller Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyCallInstance, field: 'callerId', 'errors')}">
                                    <g:textField name="callerId" value="${surveyCallInstance?.callerId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dnis"><g:message code="surveyCall.dnis.label" default="Dnis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyCallInstance, field: 'dnis', 'errors')}">
                                    <g:textField name="dnis" value="${surveyCallInstance?.dnis}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDateTime"><g:message code="surveyCall.endDateTime.label" default="End Date Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyCallInstance, field: 'endDateTime', 'errors')}">
                                    <g:datePicker name="endDateTime" precision="day" value="${surveyCallInstance?.endDateTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="incoming"><g:message code="surveyCall.incoming.label" default="Incoming" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyCallInstance, field: 'incoming', 'errors')}">
                                    <g:textField name="incoming" value="${surveyCallInstance?.incoming}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDateTime"><g:message code="surveyCall.startDateTime.label" default="Start Date Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyCallInstance, field: 'startDateTime', 'errors')}">
                                    <g:datePicker name="startDateTime" precision="day" value="${surveyCallInstance?.startDateTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surveyId"><g:message code="surveyCall.surveyId.label" default="Survey Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyCallInstance, field: 'surveyId', 'errors')}">
                                    <g:textField name="surveyId" value="${fieldValue(bean: surveyCallInstance, field: 'surveyId')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
