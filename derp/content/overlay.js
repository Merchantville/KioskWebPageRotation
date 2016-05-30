if(!de) var de = {};
if(!de.davidfichtmueller) de.davidfichtmueller = {};
if(!de.davidfichtmueller.tabrotator) de.davidfichtmueller.tabrotator = {};

de.davidfichtmueller.tabrotator = {
	isRotating:false,
	hasWaitingTimeout:false,
	time:5000,
	
	startUp:function() {
		tr = de.davidfichtmueller.tabrotator;
		var prefs = Components.classes["@mozilla.org/preferences-service;1"].getService(Components.interfaces.nsIPrefBranch);
		
		var startRunning = prefs.getBoolPref("extensions.tabRotator.startRunning");
		
		if(startRunning){
			tr.isRotating = true;
			tr.setRotate();
		}
	},
	
	switchRotate:function(){
		tr = de.davidfichtmueller.tabrotator;
		tr.isRotating = !tr.isRotating;
		
		tr.setRotate();
	},

	setRotate:function(){
		tr = de.davidfichtmueller.tabrotator;
		
		var toolbarbutton = document.getElementById("tabrotator_toolbar_button"); 
		if(toolbarbutton != null){
			toolbarbutton.setAttribute("checked", tr.isRotating);
		}
		var menucheckbox = document.getElementById("tabrotator_menu_checkbox");
		if(menucheckbox != null){
			menucheckbox.setAttribute("checked", tr.isRotating);
		}
		if(tr.isRotating && !tr.hasWaitingTimeout){
			var prefs = Components.classes["@mozilla.org/preferences-service;1"]
			                           	.getService(Components.interfaces.nsIPrefBranch);
			tr.time = prefs.getIntPref("extensions.tabRotator.rotateTime");
			if(tr.time<1000){
				tr.time=1000;
			}
			
			tr.hasWaitingTimeout=true;
			setTimeout(tr.rotate, tr.time);
		}
	},
	
	rotate:function() {
		tr = de.davidfichtmueller.tabrotator;
		tr.hasWaitingTimeout = false;
		if(tr.isRotating){
			gBrowser.mTabContainer.advanceSelectedTab(1, true);
			
			var prefs = Components.classes["@mozilla.org/preferences-service;1"]
           					.getService(Components.interfaces.nsIPrefBranch);
			
			if(prefs.getBoolPref("extensions.tabRotator.reloadTab")){
				BrowserReload();
			}
			
			if(tr.time != prefs.getIntPref("extensions.tabRotator.rotateTime")){
				tr.time = prefs.getIntPref("extensions.tabRotator.rotateTime")
				if(tr.time<1000){
					tr.time=1000;
				}
			}

			tr.hasWaitingTimeout=true;
			setTimeout(tr.rotate, tr.time);
		}
	},

	
	
	myDump:function(message) {
	  var consoleService = Components.classes["@mozilla.org/consoleservice;1"].getService(Components.interfaces.nsIConsoleService);
	  consoleService.logStringMessage(message);
	}
}

setTimeout(function(){de.davidfichtmueller.tabrotator.startUp();}, 2000);