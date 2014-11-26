<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Macros related to the display of vivo ontology properties -->

<#import "lib-properties.ftl" as p>

<#assign core = "http://vivoweb.org/ontology/core#">

<#-- Display preferredTitle if it exists; otherwise display mostSpecificTypes -->
<#macro displayTitle individual>
    <#if individual.preferredTitle?has_content>
        <span class="display-title">${individual.preferredTitle}</span>
    <#else>
        <@p.mostSpecificTypes individual />
    </#if>
</#macro>

<#-- core:webpage
     
     Note that this macro has a side-effect in the call to propertyGroups.pullProperty().
-->

<#macro webpages propertyGroups editable linkListClass="individual-urls">
    <#local webpage = propertyGroups.pullProperty("${core}webpage")!>

    <#if webpage?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <nav role="navigation">
            <#local label = "Web Pages">
            <@p.addLinkWithLabel webpage editable label />           
            <#if webpage.statements?has_content> <#-- if there are any statements -->
                <#-- Overwriting new 1.7 call to individual.webpage.ftl
                Copying in contents of 1.5 lib-vivo-property-webpage.ftl -->
                <ul class="${linkListClass}" id="webpages" role="list">
                    <@p.objectPropertyList webpage editable />
                </ul>
                <#-- End contents of lib-vivo-property-webpage.ftl -->
            </#if>
        </nav>
    </#if>
</#macro>