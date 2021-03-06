<%@ page import="com.axiomaticit.model.Grammar" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'grammar.label', default: 'Grammar')}" />
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
            <g:hasErrors bean="${grammarInstance}">
            <div class="errors">
                <g:renderErrors bean="${grammarInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data"><g:message code="grammar.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grammarInstance, field: 'data', 'errors')}">
                                    <input type="file" id="data" name="data" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mode"><g:message code="grammar.mode.label" default="Mode" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grammarInstance, field: 'mode', 'errors')}">
                                    <g:textField name="mode" value="${grammarInstance?.mode}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="grammar.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grammarInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${grammarInstance?.name}" />
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
