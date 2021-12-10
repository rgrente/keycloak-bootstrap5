<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "form">
        <div class="card bg-dark">
            <div class="card-body">
                <h4>${msg("pageExpiredTitle")}</h4>
                <p>${msg("pageExpiredSubtitle")}</p>
                
                <div class="mt-4">
                    <a href="${url.loginRestartFlowUrl}" class="btn btn-light w-100 btn-lg">${msg("pageExpiredMsg1")}</a>
                    <a href="${url.loginAction}" class="btn btn-light w-100 btn-lg mt-3">${msg("pageExpiredMsg2")}</a>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>