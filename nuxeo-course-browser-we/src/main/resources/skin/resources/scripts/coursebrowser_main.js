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
		var queryString= "select * from Document where ecm:mixinType != 'HiddenInNavigation' AND " +
		"ecm:isCheckedInVersion = 0 AND ecm:currentLifeCycleState != 'deleted' AND " +
		"ecm:mixinType != 'Folderish' AND ecm:primaryType='Course' AND course_instance:region='"+this.name+"'"+
		"AND dc:title ilike '"+ this.titleSearch+"%'";
		if (this.fullTextSearch!=""){
			queryString +="AND ecm:fulltext='"+this.fullTextSearch+"'";
		}
		
		this.nxClient.operation("Document.Query").params({
			query: queryString})
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
        $('#region-body').html(content);
    	});
	document.addEventListener('newSearchDone', function (e) {renderResultTemplate();}, false);
	$(document).on('click', '#search-button', function (e) {
		currentRegion.runSearchAndSetResults();
	});
	$(document).on('change', '#title-search-field', function (e) {
		currentRegion.titleSearch=$('#title-search-field').val();
	});
	$(document).on('change', '#fulltext-search-field', function (e) {
		currentRegion.fullTextSearch=$('#fulltext-search-field').val();
	});	
	
	
	
	
}

function renderResultTemplate(){
	console.log(currentRegion);
	currentRegion.courses.serverURL=serverURL;
	currentRegion.courses.simplifyExpirationDate= function () {
		var result = new Date(this.properties["course_instance:expiration_date"]);
		return result.toDateString();
	}

	$.Mustache.load('../../skin/course/mustache/coursebrowserTemplates.html').done(function(){
        var content = $.Mustache.render('results-'+currentRegion.name, currentRegion.courses);
        $('#results').html(content);
    	});
}









/* EOF */
