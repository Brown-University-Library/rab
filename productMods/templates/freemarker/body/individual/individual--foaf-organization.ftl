<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for foaf:Organization individuals (extends individual.ftl in vivo)-->

<#assign core = "http://vivoweb.org/ontology/core#">
<#assign blocal = "http://vivo.brown.edu/ontology/vivo-brown/">

<#if individual.uri == 'http://vivo.brown.edu/individual/org-brown-univ'>
    <#--include "brown-univ-individual.ftl"-->
    <header id="individual-info"><h1 class="fn">Brown University</h1></header>
<#else>
    <#include "individual.ftl">
</#if>
