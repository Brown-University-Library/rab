<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<header id="branding" role="banner">
    <h1 class="vitro-logo"><a title="${siteName}" href="${urls.home}"><span class="displace">${siteName}</span></a></h1>
    <#-- Since we are using a graphic text for the tagline, we won't render ${siteTagline}
    <#if siteTagline?has_content>
        <em>${siteTagline}</em>
    </#if>-->

    <nav role="navigation">
        <ul id="header-nav" role="list">
            <#include "languageSelector.ftl">
            <#if user.loggedIn>
                <#if user.hasSiteAdminAccess>
		    <li role="listitem"><a href="${urls.index}" title="${i18n().index}">${i18n().index}</a></li>
                    <li role="listitem"><a href="${urls.siteAdmin}" title="${i18n().site_admin}">${i18n().site_admin}</a></li>
                </#if>
                    <li>
                        <ul class="dropdown">
                            <li id="user-menu"><a href="#" title="${i18n().current_user}">${user.loginName}</a>
                            </li>
                         </ul>
                     </li>
                
                ${scripts.add('<script type="text/javascript" src="${urls.base}/js/userMenu/userMenuUtils.js"></script>')}
                
            <#else>
                <li role="listitem"><a class="log-out" title="${i18n().login_to_manage_site}" href="/manager">Manage your profile</a></li>
            </#if>
        </ul>
        
    </nav>
