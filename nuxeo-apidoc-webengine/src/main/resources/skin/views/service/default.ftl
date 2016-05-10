<#setting url_escaping_charset="ISO-8859-1">
<@extends src="base.ftl">
<@block name="title">Service ${nxItem.id}</@block>

<@block name="right">
<#include "/docMacros.ftl">

<h1>Service <span class="componentTitle">${nxItem.id}</span></h1>

<div class="tabscontent">

  In component <a href="${Root.path}/${distId}/viewComponent/${nxItem.componentId}">${nxItem.componentId}</a>

  <h2>Documentation</h2>
  ${nxItem.documentationHtml}
  <@viewSecDescriptions docsByCat=docs.getDocumentationItems(Context.getCoreSession()) title=false/>

  <h2>Implementation</h2>
  <p><b>${nxItem.id}</b></p>
  <p><div id="shortjavadoc" class="description"></div></p>
  <#assign javaDocBaseUrl="${Root.currentDistribution.javaDocHelper.getBaseUrl(nxItem.id)}"/>
  <#assign urlBase="${javaDocBaseUrl}/javadoc/${nxItem.id?replace('.','/')}"/>
  <p><a href="${urlBase}.html" target="_new">Click for full Javadoc</a></p>

  <@viewAdditionalDoc docsByCat=docs.getDocumentationItems(Context.getCoreSession())/>

</div>

</@block>

<@block name="footer_scripts">
<script type="text/javascript">
  $(document).ready(function() {
    $.ajax({
      url: "${Root.path}/../../ajaxProxy?type=text&url=${urlBase?url}.type.html",
      dataType: "text",
      success: function(data) { $("#shortjavadoc").html(data) }
    });
  });
</script>
</@block>

</@extends>
