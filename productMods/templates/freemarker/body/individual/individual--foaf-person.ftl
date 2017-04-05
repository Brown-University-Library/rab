<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for foaf:Person individuals -->

<#-- setup file commented out in VIVO person.ftl, but needed here -->
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<#if !labelCount??>
    <#assign labelCount = 0 >
</#if>

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

        <div id="photo-wrapper" >${individualImage}</div>
        <#-- Links -->
        <@vp.webpages propertyGroups editable "individual-urls-people" />

        <#assign cvLink = propertyGroups.pullProperty("${blocal}cv")!>
        <#if cvLink?has_content>
            <ul id="cvLink">
                <@p.objectPropertyList cvLink editable />
            </ul>
        </#if>
        
        <#include "individual-contactInfo.ftl">          
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
                            <#if individual.mostSpecificTypes?seq_contains('hidden')>
                                <span>[ Inactive ]</span>
                            </#if>
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

        <#-- Overview -->
        <#include "individual-overview.ftl">


        <#-- Affiliations -->
        <#assign affiliation = propertyGroups.pullProperty("${blocal}hasAffiliation")!>
        <#if affiliation?has_content>
            <h2>Brown Affiliations</h2>
            <ul id="affiliations">
                <#list affiliation.statements as af>
                    <li><a href="${profileUrl(af.org)}">${af.orgName}</a></li>
                </#list>
            </ul>
        </#if>

        <#-- Research Areas -->
        <#assign researchAreas = propertyGroups.pullProperty("${core}hasResearchArea")!>
        <#if researchAreas?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
            <@p.objectPropertyListing researchAreas editable />
        </#if>
    </section>
</section>

<#assign nameForOtherGroup = "${i18n().other}"> 
<#if !editable>
    <#-- We don't want to see the first name and last name unless we might edit them. -->
    <#assign skipThis = propertyGroups.pullProperty("http://xmlns.com/foaf/0.1/firstName")!> 
    <#assign skipThis = propertyGroups.pullProperty("http://xmlns.com/foaf/0.1/lastName")!> 
</#if>

<!-- Property group menu or tabs -->
<#-- 
    With release 1.6 there are now two types of property group displays: the original property group
     menu and the horizontal tab display, which is the default. If you prefer to use the property
     group menu, simply substitute the include statement below with the one that appears after this
     comment section.
     
     <#include "individual-property-group-menus.ftl">
-->

<#include "individual-property-group-tabs.ftl">

<#assign rdfUrl = individual.rdfUrl>

<#if rdfUrl??>
    <script>
        var individualRdfUrl = '${rdfUrl}';
    </script>
</#if>

<script>
    var i18nStringsUriRdf = {
        shareProfileUri: '${i18n().share_profile_uri}',
        viewRDFProfile: '${i18n().view_profile_in_rdf}',
        closeString: '${i18n().close}'
    };
</script>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual.css" />')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip-1.0.0-rc3.min.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/jquery.truncator.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/individual/individualUtils.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/individual/individualUriRdf.js"></script>')}

<script type="text/javascript">
    i18n_confirmDelete = "${i18n().confirm_delete}"
</script>
