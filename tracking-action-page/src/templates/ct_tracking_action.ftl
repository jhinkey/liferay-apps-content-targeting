<#assign aui = PortletJspTagLibs["/META-INF/aui.tld"] />
<#assign liferay_ui = PortletJspTagLibs["/META-INF/liferay-ui.tld"] />

<#if !trackingPageEnabled >
	<div class="alert alert-error">
		<strong><@liferay_ui["message"] key="this-tracking-action-will-not-work-properly-because-page-tracking-is-not-enabled" /></strong>

		<#assign enableLocationPortalLabel = languageUtil.get(locale, "portal-settings-content-targeting-analytics") />

		<#if portalSettingsURL??>
			<#assign enableLocationPortalLabel = "<a href=\"" + portalSettingsURL + "\">" + enableLocationPortalLabel + "</a>" />
		</#if>

		<#assign enableLocationSiteLabel = languageUtil.get(locale, "site-settings-content-targeting-analytics") />

		<#if siteSettingsURL??>
			<#assign enableLocationSiteLabel = "<a href=\"" + siteSettingsURL + "\">" + enableLocationSiteLabel + "</a>" />
		</#if>

		<#assign enableLocationLabels = [enableLocationPortalLabel, enableLocationSiteLabel] />

		${languageUtil.format(locale, "it-can-be-enabled-in-x-or-in-x", enableLocationLabels)}
	</div>
</#if>

<@aui["input"] label="alias" name="{ct_field_guid}alias" type="text" value=alias />

<@aui["input"] helpMessage="enter-the-friendly-url-of-the-page-to-be-tracked" label="friendly-url" name="{ct_field_guid}friendlyURL" type="text" value=friendlyURL />

<@aui["select"] label="tracking-action" name="{ct_field_guid}eventType">
	<#list eventTypes as curEventType>
		<@aui["option"] label="${curEventType}" selected=(eventType == curEventType) value=curEventType />
	</#list>
</@>