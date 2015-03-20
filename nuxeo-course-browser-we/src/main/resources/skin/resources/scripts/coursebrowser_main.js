/*
 */ 
var newSearchResultsEvent =new Event('newSearchDone');


var Region = function (name) {
	this.name = name;
	this.fullTextSearch = "";
	this.titleSearch = "";
	this.nxClient = new nuxeo.Client({timeout: 10000});
	this.nxClient.schema(["dublincore", "file", "course","course_instance"]);
	this.runSearchAndSetResults = function(){
		var self=this;
		this.nxClient.operation("Document.Query").params({
			query: "select * from Document where ecm:mixinType != 'HiddenInNavigation' AND " +
			"ecm:isCheckedInVersion = 0 AND ecm:currentLifeCycleState != 'deleted' AND " +
			"ecm:mixinType != 'Folderish' AND ecm:primaryType='Course' AND dc:title ilike '"+ this.titleSearch+"%'"})
			.execute(function(error,data){
				if (error) {
					throw error;
				}
				else {
					self.courses=data;
					document.dispatchEvent(newSearchResultsEvent);
				}

			});
	}
}

function doInit() {
	currentRegion = new Region(regionName);
	$.Mustache.load('../../skin/course/mustache/coursebrowserTemplates.html').done(function(){
        var content = $.Mustache.render('page-structure-'+currentRegion.name, currentRegion);
        $('#regionBody').html(content);
    	});
	document.addEventListener('newSearchDone', function (e) {renderResultTemplate();}, false);
	currentRegion.titleSearch = "Nuxeo";
}

function renderResultTemplate(){
	console.log(currentRegion);
	$.Mustache.load('../../skin/course/mustache/coursebrowserTemplates.html').done(function(){
        var content = $.Mustache.render('results-'+currentRegion.name, currentRegion.courses);
        $('#results').html(content);
    	});
}









/* EOF */
