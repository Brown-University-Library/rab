<#--
Copyright (c) 2012, Cornell University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of Cornell University nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->

<#-- Login widget -->

<#macro assets>
    <#-- RY This test should be replaced by login widget controller logic which displays different assets macros depending
         on login status, but currently there's no widget-specific doAssets() method. See NIHVIVO-1357. The test doesn't work
         because we don't have the user in the template data model when we generate the assets. This can also be fixed by 
         NIHVIVO-1357.     
    <#if ! user.loggedIn> -->
        ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/login.css" />')}
        <#-- ${scripts.add("")} -->
        ${headScripts.add('<script type="text/javascript" src="${urls.base}/js/login/loginUtils.js"></script>')}
    <#-- </#if> -->
</#macro>

<#macro loginForm>
    <#-- Don't display the JavaScript required to edit message on the home page even if JavaScript is unavailable -->
    <#if currentServlet != 'home'>
        <noscript>
            <section id="error-alert">
                <img src="${urls.images}/iconAlertBig.png" alt="Alert Icon"/>
                <p>In order to edit content, you'll need to enable JavaScript. Here are the <a href="http://www.enable-javascript.com" title="java script instructions">instructions for enabling JavaScript in your web browser</a>.</p>
            </section>
        </noscript>
    </#if>

    <section id="login" class="hidden">
        <h2>Log in</h2>
    
        <#if infoMessage??>
            <h3>${infoMessage}</h3>
        </#if>
       
        <#if errorMessage??>
            <section id="error-alert" role="alert"><img src="${urls.images}/iconAlert.png" alert="Error alert icon" />
                <p class="login-alert">${errorMessage}</p>
            </section>
        </#if>

        <form role="form" id="login-form" action="${formAction}" method="post" name="login-form" />
            <#if externalAuthUrl??>
                <p class="external-auth"><a class="blue button" href="${externalAuthUrl}" title="external authentication name">${externalAuthName}</a></p>
                <p class="or-auth">or</p>
                <h3 class="internal-auth" >Log in using your ${siteName} account</h3>
				</#if>
            <label for="loginName">Email</label>
            <input id="loginName" name="loginName" class="text-field focus" type="text" value="${loginName!}" autocapitalize="off" required autofocus />

            <label for="loginPassword">Password</label>
            <input id="loginPassword" name="loginPassword" class="text-field" type="password" required />
            
            <p class="submit"><input name="loginForm" class="green button" type="submit" value="Log in"/></p>

        </form>

    </section><!-- #log-in -->
</#macro> 

<#macro forcePasswordChange>
    <section id="login">
        <h2>Change Password to Log in</h2>
           
            <#if errorMessage??>
                <div id="error-alert" role="alert"><img src="${urls.images}/iconAlert.png" width="24" height="24" alert="Error alert icon"/>
                    <p>${errorMessage}</p>
                </div>
            </#if>
           
            <form role="form" id="login-form" action="${formAction}" method="post" name="login-form" />
                <label for="newPassword">New Password</label>
                <input id="newPassword" name="newPassword" class="text-field focus" type="password" required autofocus/>
                
                <p class="password-note">Minimum of 6 characters in length.</p>
                
                <label for="confirmPassword">Confirm Password</label>
                <input id="confirmPassword" name="confirmPassword" class="text-field" type="password" required />
                
                 <p class="submit-password"><input name="passwordChangeForm" class="green button" type="submit" value="Log in"/> <span class="or">or <a class="cancel" href="${cancelUrl}" title="cancel">Cancel</a></span></p>
            </form>
    </section>
</#macro>

<#macro alreadyLoggedIn>
    <h2>Log in</h2>
    <p>You are already logged in.</p>
</#macro>

<#macro error>
    <p>There was an error in the system.</p>
</#macro>
