<@extends src="base.ftl"> 

<@block name="header_scripts">
<script src="${skinPath}/scripts/nuxeo.js"></script>
<script src="${skinPath}/scripts/jquery.mustache.js"></script>
<script src="${skinPath}/scripts/mustache.js"></script>
<script src="${skinPath}/scripts/coursebrowser_main.js"></script>
</@block>
<@block name="stylesheets">
<link rel="stylesheet" href="${skinPath}/css/site-${Context.getProperty('regionName')}.css" type="text/css"
	media="screen" charset="utf-8"> 
</@block>

<@block name="title">
     Region Courses
</@block>


<@block name="content">
<div id="region-body">
<!-- Will be populate by the mustache template of the selected region -->		
</div>
<script type="text/javascript" charset="utf-8">
	var serverURL = "${Context.getBaseURL()}/nuxeo/";
	var regionName = "${Context.getProperty('regionName')}";
	doInit();
</script>
</@block> 

</@extends>
