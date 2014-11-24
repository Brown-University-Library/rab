<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for foaf:Person individuals -->
<#include "individual-setup.ftl">

<#include "individual-vitro.ftl">

<#import "lib-vivo-properties.ftl" as vp>

<#assign core = "http://vivoweb.org/ontology/core#">
<#assign blocal = "http://vivo.brown.edu/ontology/vivo-brown/">

<section id="individual-intro" class="vcard person" role="region">

    <section id="share-contact" role="region"> 
        <#-- Image -->           
        <#assign individualImage>
            <@p.image individual=individual 
                      propertyGroups=propertyGroups 
                      namespaces=namespaces 
                      editable=editable 
                      showPlaceholder="always" />
        </#assign>

        <#if ( individualImage?contains('<img class="individual-photo"') )>
            <#assign infoClass = 'class="withThumb"'/>
        </#if>

        <div id="photo-wrapper">${individualImage}</div>

        <#include "individual-contactInfo.ftl">  
                
        <#-- Links -->
        <@vp.webpages propertyGroups editable "individual-urls-people" />

        <#assign cvLink = propertyGroups.pullProperty("${blocal}cv")!>
        <#if cvLink?has_content>
            <ul id="cvLink">
                <@p.objectPropertyList cvLink editable />
            </ul>
        </#if>        
    </section>

    <section id="individual-info" ${infoClass!} role="region">
        <#include "individual-adminPanel.ftl">

        <header>
            <#if relatedSubject??>
                <h2>${relatedSubject.relatingPredicateDomainPublic} for ${relatedSubject.name}</h2>
                <p><a href="${relatedSubject.url}" title="return to">&larr; return to ${relatedSubject.name}</a></p>
            <#else>
                <h1 class="vcard foaf-person">
            <#-- Name display first middle last -->
            <#assign foaf = "http://xmlns.com/foaf/0.1/" />
            <#assign firstName = propertyGroups.pullProperty("${foaf}firstName")!>
            <#assign middleName = propertyGroups.pullProperty("${core}middleName")!>
            <#assign lastName = propertyGroups.pullProperty("${foaf}lastName")!>
            <#if firstName.statements?has_content && lastName.statements?has_content>
            <span class="fn">${firstName.statements[0].value!}<#if middleName.statements?has_content> ${middleName.statements[0].value!}<#if middleName.statements[0].value?length < 3>.</#if> </#if> ${lastName.statements[0].value!}</span>
            <#else>
            <span class="fn"><@p.label individual editable labelCount/></span>
            </#if>

                    <#--  Display preferredTitle if it exists; otherwise mostSpecificTypes -->
                    <#assign title = propertyGroups.pullProperty("${core}preferredTitle")!>
                    <#if title?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
                        <@p.addLinkWithLabel title editable />
                        <#list title.statements as statement>
                            <span class="display-title">${statement.value}</span>
                            <@p.editingLinks "${title.name}" "" statement editable />
                        </#list>
                    </#if>
                    <#-- If preferredTitle is unpopulated, display mostSpecificTypes -->
                    <#if ! (title.statements)?has_content>
                        <@p.mostSpecificTypes individual />
                    </#if>
                </h1>
            </#if>
         
        </header>
    </section>
</section>