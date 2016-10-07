<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Contact info on individual profile page -->

<#-- Primary Email -->    
<@emailLinks "${core}primaryEmail" />

<#-- Additional Emails --> 
<@emailLinks "${core}email" />   

<#macro emailLinks property>
    <#assign email = propertyGroups.pullProperty(property)!>    
    <#if property == "${core}primaryEmail">
        <#local listId = "primary-email">
        <#local label = "Primary Email">
    <#else>
        <#local listId = "additional-emails">
        <#local label = "Additional Emails">
    </#if>     
    <#if email?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <@p.addLinkWithLabel email editable label/>
        <#if email.statements?has_content> <#-- if there are any statements -->
            <ul id="${listId}" class="individual-emails" role="list">
                <#list email.statements as statement>
                    <li role="listitem">
                        <a class="email" href="mailto:${statement.value}" title="email">email</a>
                        <@p.editingLinks "${email.localName}" "${email.name}" statement editable email.rangeUri/>
                        <img class ="icon-email middle" src="${urls.images}/individual/emailIcon.gif" alt="email icon" />
                    </li>
                </#list>
            </ul>
        </#if>
    </#if>
</#macro>