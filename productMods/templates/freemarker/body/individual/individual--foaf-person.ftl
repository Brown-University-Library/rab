<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for foaf:Person individuals -->
<#include "individual-setup.ftl">

<#include "individual-vitro.ftl">

<#import "lib-vivo-properties.ftl" as vp>

<#assign core = "http://vivoweb.org/ontology/core#">
<#assign blocal = "http://vivo.brown.edu/ontology/vivo-brown/">

<section id="individual-intro" class="vcard person" role="region">

    <section id="share-contact" role="region"> 
        <!-- Image -->           
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
        <!-- Contact Info -->
        <div id="individual-tools-people">
            <span id="iconControlsLeftSide">
                <img id="uriIcon" title="${individual.uri}" src="${urls.images}/individual/uriIcon.gif" alt="${i18n().uri_icon}"/>
                <#if checkNamesResult?has_content >
                    <img id="qrIcon"  src="${urls.images}/individual/qr_icon.png" alt="${i18n().qr_icon}" />
                    <span id="qrCodeImage" class="hidden">${qrCodeLinkedImage!} 
                        <a class="qrCloseLink" href="#"  title="${i18n().qr_code}">${i18n().close_capitalized}</a>
                    </span>
                </#if>
            </span>
        </div>
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
</section>