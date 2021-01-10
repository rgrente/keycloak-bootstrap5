<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "form">
        <div class="card bg-dark">
            <div class="card-body">
                <h4 class="card-title">${msg("updatePasswordTitle")}</h4>

                <form id="kc-passwd-update-form" class="mt-3" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                    <!-- New pw -->
                    <div class="form-floating mt-4">
                        <input type="password" id="password-new" name="password-new" class="form-control bg-dark text-light b-light" placeholder="${msg("passwordNew")}" autofocus autocomplete="new-password" aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />
                        <label for="password-new">${msg("passwordNew")}</label>

                        <#if messagesPerField.existsError('password')>
                            <div class="invalid-feedback">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <!-- Confirm pw -->
                    <div class="form-floating mt-3">
                        <input type="password" id="password-confirm" name="password-confirm" class="form-control bg-dark text-light b-light" placeholder="${msg("passwordConfirm")}" autofocus autocomplete="new-password" aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />
                        <label for="password-confirm">${msg("passwordConfirm")}</label>

                        <#if messagesPerField.existsError('password')>
                            <div class="invalid-feedback">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <!-- Logout other sessions prompt -->
                    <#if isAppInitiatedAction??>
                        <div class="form-check mt-3">
                            <input class="form-check-input" type="checkbox" id="logoutSessions" name="logout-sessions">
                            <label class="form-check-label" for="logoutSessions">
                                ${msg("logoutOtherSessions")}
                            </label>
                        </div>
                    </#if>

                    <!-- Submit buttons -->
                    <div id="kc-form-buttons" class="mt-3">
                        <#if isAppInitiatedAction??>
                            <button type="submit" class="btn btn-primary w-100" value="${msg("doSubmit")}" />
                            <button class="btn btn-secondary w-100 mt-2" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                        <#else>
                            <button type="submit" class="btn btn-primary w-100" value="${msg("doSubmit")}">${msg("doSubmit")}</button>
                        </#if>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>