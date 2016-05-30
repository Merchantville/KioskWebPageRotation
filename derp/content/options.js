if(!de) var de = {};
if(!de.davidfichtmueller) de.davidfichtmueller = {};
if(!de.davidfichtmueller.tabrotator) de.davidfichtmueller.tabrotator = {};

de.davidfichtmueller.tabrotator = {
		
	init:function() {
		var prefs = Components.classes["@mozilla.org/preferences-service;1"]
		                           	.getService(Components.interfaces.nsIPrefBranch);
		var value = prefs.getIntPref("extensions.tabRotator.rotateTime")/1000;
		var hour = Math.floor(value/3600);
		var min = Math.floor((value%3600)/60);
		var sec = value%60;
		document.getElementById("rotateTimeSpinner").value = hour+":"+min+":"+sec;

		document.getElementById("startRunning").checked = prefs.getBoolPref("extensions.tabRotator.startRunning");
		document.getElementById("reloadTab").checked = prefs.getBoolPref("extensions.tabRotator.reloadTab");
		
	},
	
	setSaveSettings:function(){
		var prefs = Components.classes["@mozilla.org/preferences-service;1"]
		                           	.getService(Components.interfaces.nsIPrefBranch);
		var timeString = document.getElementById("rotateTimeSpinner").value;
		var hour = parseInt(timeString.substring(0,2));
		var min = parseInt(timeString.substring(3,5));
		var sec = parseInt( timeString.substring(6,8));
		var time = (hour*3600+min*60+sec)*1000;
		if(!isNaN(time)){
			prefs.setIntPref("extensions.tabRotator.rotateTime", time);
		}
		prefs.setBoolPref("extensions.tabRotator.reloadTab", document.getElementById("reloadTab").checked)
		prefs.setBoolPref("extensions.tabRotator.startRunning", document.getElementById("startRunning").checked)
	},
	
	setDefaults:function(){
		document.getElementById("rotateTimeSpinner").value = "00:00:10";
		document.getElementById("reloadTab").checked = false;
		document.getElementById("startRunning").checked = false;
	}
}