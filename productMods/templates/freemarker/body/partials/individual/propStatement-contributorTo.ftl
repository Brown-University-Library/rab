<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#contibutorTo.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->
 
<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<@showContributor statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showContributor statement>
<#if statement.hideThis?has_content>
    <span class="hideThis">&nbsp;</span>
    <script type="text/javascript" >
        $('span.hideThis').parent().parent().addClass("hideThis");
        if ( $('h3#contibutorTo').attr('class').length == 0 ) {
            $('h3#contibutorTo').addClass('hiddenPubs');
        }
        $('span.hideThis').parent().remove();
    </script>
<#else>

    <#local resourceTitle>
        <#if statement.citation??>
            <a href="${profileUrl(statement.uri("citation"))}" title="resource name">${statement.label}</a>
        <#else>
            <a href="${profileUrl(statement.uri("citation"))}" title="missing resource">missing information resource</a>
        </#if>
    </#local>
    
    <#local doi>
        <#if statement.doi??>
            <a class="full-text-link" href="http://dx.doi.org/${statement.doi}">full text</a>
        </#if>
    </#local>

    <#local pmid>
        <#if statement.pmid??>
            <a class="full-text-link" href="http://www.ncbi.nlm.nih.gov/pubmed/?term=${statement.pmid}">PubMed</a>
        </#if>
    </#local>

    <#local authorList>
       <#if statement.authorList??>
           <#if statement.authorList?ends_with('.') == true>
                ${statement.authorList}
           <#else>
                ${statement.authorList}.
           </#if>
        <#else>
            ${statement.lastName}, ${statement.firstName}.
       </#if>
    </#local>

    <#local book>
       <#if statement.book??>
            <em>${statement.book}</em>.
       </#if>
    </#local>

    <#local venue>
        <#if (statement.venue?? && statement.dateTime??)>
            ${statement.venueLabel}.
        <#elseif (statement.venue?? && !(statement.dateTime??))>
            ${statement.venueLabel}
        </#if>
    </#local>

    <#local editorList>
       <#if statement.editorList??>
           <#if statement.editorList?ends_with('.') == true>
                Ed. ${statement.editorList}
           <#else>
                Ed. ${statement.editorList}.
           </#if>
       </#if>
    </#local>

    <#local location>
       <#if (statement.location?? && statement.publisher??)>
            ${statement.locationLabel}:
        <#elseif (statement.location?? && !(statement.publisher??))>
            ${statement.locationLabel}.
        </#if>
    </#local>

    <#local publisher>
       <#if (statement.publisher?? && statement.dateTime??)>
            ${statement.publisherLabel},
        <#elseif (statement.publisher?? && !(statement.dateTime??))>
            ${statement.publisherLabel}.
        </#if>
    </#local>

    <#local dateTime>
        <#if (statement.dateTime?? && statement.volume??)>
            ${statement.dateTime};
        <#elseif (statement.dateTime?? && !(statement.volume??))>
            ${statement.dateTime}
        </#if>
    </#local>

    <#local pages>
        <#if statement.pages??>
            :&nbsp;${statement.pages}
        </#if>
    </#local>

    <#local volume>
        <#if statement.volume??>
            ${statement.volume}
        </#if>
    </#local>

    <#local issue>
        <#if (statement.volume?? && statement.issue??)>
            (${statement.issue})
        <#elseif (statement.issue?? && !(statement.volume??))>
            ${statement.issue}
        </#if>
    </#local>

    ${authorList}${resourceTitle}${venue}${book}${editorList}${location}${publisher}${dateTime}${volume}${issue}${pages}.${doi}${pmid}
</#if>
</#macro>