<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "form">
        <script type="text/javascript">
            refreshPage = () => {
                document.getElementById('isSetRetry').value = 'retry';
                document.getElementById('executionValue').value = '${execution}';
                document.getElementById('kc-error-credential-form').submit();
            }
        </script>

        <form id="kc-error-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
              method="post">
            <input type="hidden" id="executionValue" name="authenticationExecution"/>
            <input type="hidden" id="isSetRetry" name="isSetRetry"/>
        </form>

        <#if authenticators??>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>${kcSanitize(msg("webauthn-available-authenticators"))?no_esc}</th>
                </tr>
                </thead>
                <tbody>
                <#list authenticators.authenticators as authenticator>
                    <tr>
                        <th>
                            <span id="kc-webauthn-authenticator">${kcSanitize(authenticator.label)?no_esc}</span>
                        </th>
                    </tr>
                </#list>
                </tbody>
            </table>
        </#if>

        <button tabindex="4" class="btn btn-primary mt-3 w-100" onclick="refreshPage()">${msg("doTryAgain")}</button>

        <#if isAppInitiatedAction??>
            <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-webauthn-settings-form" method="post">
                <button type="submit" tabindex="4" class="btn btn-primary mt-3 w-100">${msg("doCancel")}</button>
            </form>
        </#if>
    </#if>
</@layout.registrationLayout>