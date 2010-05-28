<@extends src="base.ftl">

<@block name="stylesheets">
</@block>


<@block name="header_scripts">
</@block>

<@block name="right">

<#include "/docMacros.ftl">

<#if searchFilter??>
  <h1> Components listing (with filter '${searchFilter}') </h1>
</#if>
<#if !searchFilter>
  <h1> Components listing </h1>
</#if>

<#assign showDesc=false>
<#if Context.request.getParameter("showDesc")??>
  <#assign showDesc=true>
</#if>

<table width="100% class="tabs" id="tabbox">
  <tr>
    <td width="50%" >
     <div class="tabs
     <#if !showDesc>
       tabSelected
     </#if>
     "> <A href="${Root.path}/${distId}/listComponents">Introspection view</A></div>
    </td>
    <td width="50%" >
     <div class="tabs
     <#if showDesc>
       tabSelected
     </#if>
     "> <A href="${Root.path}/${distId}/listComponents?showDesc=true"> Documentation view</A></div>
    </td>
  </tr>
</table>


<p>
This screen list the components present in the selected Nuxeo Distribution (${distId}).<br/>
There are : <br>
<ul>
 <li> <A href="#javaComponents">Java components </A>(${javaComponents?size}) </li>
 <li> <A href="#xmlComponents">XML components </A>(${xmlComponents?size}) </li>
</ul>
</p>

  <#if !Root.currentDistribution.live>
    <span style="float:right">
    <form method="GET" action="${Root.path}/${distId}/filterComponents" >
      <input type="text" name="fulltext" value="${searchFilter}">
      <input type="submit" value="filter">
    </form>
    <#if searchFilter??>
      <A href="${Root.path}/${distId}/listComponents"> [ Reset ] </A>
    </#if>
    </span>
  </#if>


<#if Context.request.getParameter("showDesc")??>
   <#assign descriptions=This.getDescriptions("NXComponent")/>
</#if>

<A name="javaComponents">&nbsp;</A>
<h2> Java components (${javaComponents?size})</h2>
<#list javaComponents as component>

  <A href="${Root.path}/${distId}/viewComponent/${component.id}">${component.label}</A>
  <#if Context.request.getParameter("showDesc")??>
     <#assign cid=component.id/>
     <#assign desc=descriptions[cid]/>
    <@inlineEdit cid desc/>
  </#if>

  <br/>

</#list>

<A name="xmlComponents">&nbsp;</A>
<h2> pure XML components (${xmlComponents?size})</h2>
<#list xmlComponents as component>

  <A href="${Root.path}/${distId}/viewComponent/${component.id}">${component.label}</A>
  <#if Context.request.getParameter("showDesc")??>
     <#assign cid=component.id/>
     <#assign desc=descriptions[cid]/>
    <@inlineEdit cid desc/>
  </#if>

  <br/>

</#list>

</@block>

</@extends>