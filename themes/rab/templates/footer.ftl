<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

</div> <!-- #wrapper-content -->

<footer role="contentinfo">
    <p class="copyright">
        <#if copyright??>
            <small>&copy;${copyright.year?c}
            <#if copyright.url??>
                <a href="${copyright.url}" title="${i18n().copyright}">${copyright.text}</a>
            <#else>
                ${copyright.text}
            </#if>
             | <a class="terms" href="${urls.termsOfUse}" title="${i18n().terms_of_use}">${i18n().terms_of_use}</a></small> | 
        </#if>
        Powered by <a class="powered-by-vivo" href="http://vivoweb.org" target="_blank" title="powered by VIVO"><strong>VIVO</strong></a></a>
        <#if user.hasRevisionInfoAccess>
             | ${i18n().version} <a href="${version.moreInfoUrl}" title="${i18n().version}">${version.label}</a>
        </#if>
    </p>
    
    <nav role="navigation">
        <ul id="footer-nav" role="list">
            <li role="listitem"><a href="${urls.about}" title="about">About</a></li>
            <#if urls.contact??>
                <li role="listitem"><a href="https://docs.google.com/a/brown.edu/forms/d/1H_LzEHRzpxv3OY266RjSwpAMwVuTEUFyNEgMPcZ4NiA/viewform" title="contact us">Contact Us</a></li>
            </#if> 
        </ul>
    </nav>
</footer>

<#include "scripts.ftl">