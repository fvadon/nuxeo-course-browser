<html>
<head>
<title><@block name="title"> WebEngine Project </@block></title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="${skinPath}/image/favicon.gif" />
<script src="${skinPath}/scripts/jquery-2.1.1.js"></script>

<!-- BOOTSTRAP-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


<@block name="stylesheets" /> <@block name="header_scripts" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body><@block name="content">The Content</@block>
</body>

</html>
