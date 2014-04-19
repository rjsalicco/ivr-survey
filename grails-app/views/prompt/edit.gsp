<%@ page import="com.axiomaticit.model.Prompt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'prompt.label', default: 'Prompt')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${promptInstance}">
            <div class="errors">
                <g:renderErrors bean="${promptInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${promptInstance?.id}" />
                <g:hiddenField name="version" value="${promptInstance?.version}" />
				<g:hiddenField name="survey.id" value="${promptInstance?.survey?.id}"  />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="prompt.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: promptInstance, field: 'data', 'errors')}">
                                    <input type="file" id="data" name="data" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="prompt.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: promptInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${promptInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="playOrder"><g:message code="prompt.playOrder.label" default="Play Order" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: promptInstance, field: 'playOrder', 'errors')}">
                                    <g:textField name="playOrder" value="${fieldValue(bean: promptInstance, field: 'playOrder')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="text"><g:message code="prompt.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: promptInstance, field: 'text', 'errors')}">
                                    <g:textField name="text" value="${promptInstance?.text}" />
                                </td>
                            </tr>
                        
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
