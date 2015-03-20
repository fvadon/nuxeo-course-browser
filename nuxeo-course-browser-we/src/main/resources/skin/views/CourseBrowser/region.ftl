<@extends src="base.ftl"> 

<@block name="header_scripts">
<script src="${skinPath}/scripts/nuxeo.js"></script>
<script src="${skinPath}/scripts/jquery.mustache.js"></script>
<script src="${skinPath}/scripts/mustache.js"></script>
<script src="${skinPath}/scripts/coursebrowser_main.js"></script>
</@block> 

<@block name="title">
     Region Courses
</@block>


<@block name="content">
<div class="container" id="regionBody">
			${Context.getProperty("regionName")}
			
</div>
<script type="text/javascript" charset="utf-8">
	var regionName = "${Context.getProperty('regionName')}";
	doInit();
</script>
</@block> 

</@extends>
