<@extends src="base.ftl">

<@block name="stylesheets">
</@block>


<@block name="header_scripts">
</@block>

<@block name="right">

<#include "/docMacros.ftl">

<@filterForm services?size 'Service'/>

<#list services as service>

  <A href="${Root.path}/${distId}/viewService/${service.id}">${service.label}</A><br/>

</#list>

</@block>

</@extends>