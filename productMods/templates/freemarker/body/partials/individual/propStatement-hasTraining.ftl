<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#hasRole and its child properties.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<@showCredential statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showCredential statement>

    <#local date>
        <#if (statement.start?? && !(statement.end??))>
            ${statement.start}
        <#elseif (statement.start?? && statement.end??)>
            ${statement.start}-${statement.end}
        </#if>
    </#local>

    <#local orgHospSpec>
        <#if (statement.org?? && statement.spec?? && statement.hosp??)>
            <a href="${profileUrl(statement.uri("org"))}" title="organization">${statement.orgText!}</a>,&nbsp;<a href="${profileUrl(statement.uri("hosp"))}" title="hospital">${statement.hospText!}</a>,&nbsp;<a href="${profileUrl(statement.uri("spec"))}" title="specialty">${statement.specText!}</a>.
        <#elseif (statement.org?? && statement.hosp?? && !(statement.spec??))>
            <a href="${profileUrl(statement.uri("org"))}" title="organization">${statement.orgText!}</a>,&nbsp;<a href="${profileUrl(statement.uri("hosp"))}" title="hospital">${statement.hospText!}</a>
        <#elseif (statement.org?? && statement.spec?? && !(statement.hosp??))>
            <a href="${profileUrl(statement.uri("org"))}" title="organization">${statement.orgText!}</a>,&nbsp;<a href="${profileUrl(statement.uri("spec"))}" title="specialty">${statement.specText!}</a>.
        <#elseif (statement.org?? && !(statement.hosp??) && !(statement.spec??))>
            <a href="${profileUrl(statement.uri("org"))}" title="organization">${statement.orgText!}</a>.
        <#elseif (statement.hosp?? && statement.spec?? && !(statement.org??))>
            <a href="${profileUrl(statement.uri("hosp"))}" title="hospital">${statement.hospText!}</a>,&nbsp;<a href="${profileUrl(statement.uri("spec"))}" title="specialty">${statement.specText!}</a>.
        <#elseif (statement.hosp?? && !(statement.spec??) && !(statement.org??))>
            <a href="${profileUrl(statement.uri("hosp"))}" title="hospital">${statement.hospText!}</a>.
        </#if>
    </#local>

    <#local cityStateCountry>
        <#if (statement.trainingCity?? && statement.trainingState?? && statement.trainingCountry??)>
            ${statement.trainingCity!}, ${statement.trainingState!}, ${statement.trainingCountry!}
        <#elseif (statement.trainingCity?? && !(statement.trainingState??) && statement.trainingCountry??)>
            ${statement.trainingCity!}, ${statement.trainingCountry!}
        <#elseif (statement.trainingCity?? && statement.trainingState?? && !(statement.trainingCountry??))>
            ${statement.trainingCity!}, ${statement.trainingState!}
        <#elseif (statement.trainingCity?? && !(statement.trainingState??) && !(statement.trainingCountry??))>
            ${statement.trainingCity!}
        <#elseif (!(statement.trainingCity??) && statement.trainingState?? && statement.trainingCountry??)>
            ${statement.trainingState!}, ${statement.trainingCountry!}
        <#elseif (!(statement.trainingCity??) && statement.trainingState?? && !(statement.trainingCountry??))>
            ${statement.trainingState!}
        <#elseif (!(statement.trainingCity??) && !(statement.trainingState??) && statement.trainingCountry??)>
            ${statement.trainingCountry!}
        </#if>
    </#local>

    <#local label>
        <#if statement.trainingText??>
            ${statement.trainingText!}.
        </#if>
    </#local>

${label}${orgHospSpec}${date}${cityStateCountry}
</#macro>