<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for property listing on individual profile page -->

        <#list group.properties as property>
            <#assign rangeClass = "noRangeClass">
            <#if property.rangeUri?has_content && property.rangeUri?contains("#")>
                <#assign rangeClass = property.rangeUri?substring(property.rangeUri?last_index_of("#")+1)>
            <#elseif property.rangeUri?has_content >
                <#assign rangeClass = property.rangeUri?substring(property.rangeUri?last_index_of("/")+1)>
            </#if>
        
            <article class="property" role="article">
                <#-- Property display name -->
                <h3 id="${property.localName}">${property.name} <@p.addLink property editable /> <@p.verboseDisplay property /> </h3>
                <#-- List the statements for each property -->
                <#-- For rich text properties don't wrap in HTML list.  There's probably a better way to do this. -->
                        <#assign rprops = ['affiliations', 'awardsAndHonors', 'scholarlyWork', 'researchOverview', 'researchStatement', 'fundedResearch', 'teachingOverview']>
                <#if rprops?seq_contains(property.localName)>
                   <section class="formatted-text" id="${property.localName}">
                        <div class="rich-text-property">
                            <@p.richTextItem property editable />
                        </div>
                   </section>
                   <#else>
                    <ul class="property-list" role="list" id="${property.localName}-${rangeClass}-List">
                        <#-- data property -->
                        <#if property.type == "data">
                            <@p.dataPropertyList property editable />
                        <#-- object property -->
                        <#else>
                            <@p.objectProperty property editable /> 
                        </#if>
                    </ul>
                </#if>
            </article> <!-- end property -->
        </#list>
