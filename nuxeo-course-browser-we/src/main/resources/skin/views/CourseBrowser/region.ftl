<@extends src="base.ftl"> <@block name="header_scripts">
<script src="${skinPath}/scripts/jquery-2.1.1.js"></script>
<script src="${skinPath}/scripts/nuxeo.js"></script>
<script src="${skinPath}/scripts/jquery.mustache.js"></script>
<script src="${skinPath}/scripts/mustache.js"></script>
<script src="${skinPath}/scripts/coursebrowser.js"></script>

</@block> <@block name="content">


	<div class="pure-g" id="selectRegionDiv">
		<div class="pure-u-1-2">
			${Context.getProperty("regionName")}
		</div>
	</div>


</@block> </@extends>
