<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
    <#elseif section = "form">
        <p class="text-center mt-5 mb-4">
            <img src="${url.resourcesPath}/img/Icon.png" height="96" width="96" class="rounded-3" />
        </p>
        <h4 class="text-center mt-4">${(realm.displayName!'App Name')}</h4>
        <div class="card bg-dark mt-5">
            <div class="card-body">
                <h4 class="card-title">${msg("loginAccountTitle")}</h4>

                <#if messagesPerField.existsError('username','password')>
                    <div class="alert alert-danger">
                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                    </div>
                </#if>
                
                <form class="mt-4" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <!-- Username -->
                    <div class="form-floating">
                        <#if usernameEditDisabled??>
                        <input tabindex="1" type="text" class="form-control bg-dark text-light b-light" id="username" name="username" value="${(login.username!'')}" disabled>
                        <#else>
                        <input tabindex="1" type="text" class="form-control bg-dark text-light b-light" id="username" name="username" value="${(login.username!'')}" autofocus placeholder="username">
                        </#if>
                        <label for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    </div>

                    <!-- Pw -->
                    <div class="form-floating mt-3">
                        <input tabindex="2" type="text" class="form-control bg-dark text-light b-light" id="password" name="password" value="${(login.username!'')}" autofocus placeholder="password">
                        <label for="password">${msg("password")}</label>
                    </div>

                    <!-- Forgot pw -->
                    <#if realm.resetPasswordAllowed>
                        <p class="float-end m-0 mt-3"><a tabindex="5" class="text-decoration-none" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></p>
                    </#if>

                    <!-- Remember me -->
                    <#if realm.rememberMe && !usernameEditDisabled??>
                        <div class="form-check mt-3">
                            <#if login.rememberMe??>
                            <input class="form-check-input" type="checkbox" id="rememberMe" checked>
                            <#else>
                            <input class="form-check-input" type="checkbox" id="rememberMe">
                            </#if>
                            <label class="form-check-label" for="rememberMe">
                                ${msg("rememberMe")}
                            </label>
                        </div>
                    </#if>

                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <button tabindex="4" type="submit" class="btn btn-primary mt-3 w-100">${msg("doLogIn")}</button>
                </form>
            </div>
        </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>