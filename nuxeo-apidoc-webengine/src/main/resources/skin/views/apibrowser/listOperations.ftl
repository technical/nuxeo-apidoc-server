<@extends src="base.ftl">
<@block name="title">All operations</@block>
<@block name="header_scripts">
  <script type="text/javascript" src="${skinPath}/script/jquery.tablesorter.js"></script>
  <script type="text/javascript" src="${skinPath}/script/jquery.tablesorter_filter.js"></script>
</@block>

<@block name="right">
<#include "/docMacros.ftl">

<h1>All operations</h1>
<@tableFilterArea/>
<table id="operationsTable" class="tablesorter">
  <thead>
  <tr>
    <th>Category</th>
    <th>Label</th>
    <th>Id</th>
    <th>Requires</th>
    <th>Since</th>
  </tr>
  </thead>
<tbody>
<#list operations as operation>
<#assign rowCss = (operation_index % 2 == 0)?string("even","odd")/>
  <tr class="${rowCss}" style="vertical-align: top">
    <td>${operation.category?html}</td>
    <td><a href="${Root.path}/${distId}/viewOperation/${operation.name}">${operation.label?html}</a></td>
    <td><a href="${Root.path}/${distId}/viewOperation/${operation.name}">${operation.name?html}</a></td>
    <td>${operation.requires}</td>
    <td>${operation.since}</td>
  </tr>
</#list>
</tbody>
</table>

</@block>

<@block name="footer_scripts">
<@tableSortFilterScript "#operationsTable" "[0,0],[1,0]" />
</@block>

</@extends>