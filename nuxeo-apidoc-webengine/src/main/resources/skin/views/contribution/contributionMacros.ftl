<#macro viewContribution contributionWO >

  <#assign nestedLevel=nestedLevel+1/>
  <#assign contributionItem=contributionWO.getNxArtifact()/>
  <#assign contributionDocs=contributionWO.getAssociatedDocuments()/>
  <#assign contributionDesc=contributionDocs.getDescription(Context.getCoreSession())/>

  <div id="contribution.${contributionItem.id}_frame" class="blocFrame" style="margin-left:${nestedLevel*6}px">
  <A name="contribution.${contributionItem.id}">  </A>

  <div class="blocTitle bTitle${nestedLevel}" id="contribution.${contributionItem.id}">
  <img src="${skinPath}/images/${contributionDesc.targetType}.png" alt="Contribution"/>
  ${contributionDesc.title}

  <A href="${Root.path}/${distId}/viewContribution/${contributionItem.id}/doc"> Edit </A>

  </div>

  <div class="foldablePannel">


  <span class="componentId">Contribution Id : ${contributionItem.id}</span> <br/>

  <p><@docContent docItem=contributionDesc /></p>

  <span class="resourceToggle"> XML file for this contribution</span>
  <div class="hiddenResource">
  <pre>
  <code>
  ${contributionItem.xml?html}
  </code>
   </pre>
  </div>
  <br/>

  <h4> target ExtensionPoint </h4>
  <A href="${Root.path}/${distId}/viewExtensionPoint/${contributionItem.extensionPoint}">
  ${contributionItem.extensionPoint}
  </A>

  <@viewAdditionnalDoc docsByCat=contributionDocs.getDocumentationItems(Context.getCoreSession())/>
  </div>
  </div>

  <#assign nestedLevel=nestedLevel-1/>

</#macro>


