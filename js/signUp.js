/*Code is for newsletter sign up, verifies character value in email box*/

"use strict";

var $ = function(id) {
    return document.getElementById(id);
};

var joinList = function() {
    var emailAddress1 = $("email_address1").value;
    var emailAddress2 = $("email_address2").value;
    var firstName = $("first_name").value;
    var errorMessage = "";

    // validate the entries
    if (emailAddress1 == "") {	
		document.getElementById("email").innerHTML = "Email required.";	    	
    } 
	if (emailAddress2 == "") {
    	document.getElementById("email2").innerHTML = "Email required.";
    } 
	if (emailAddress2 != emailAddress1) {
    	document.getElementById("email").innerHTML = "";
		document.getElementById("email2").innerHTML = "Email spaces do not match.";
    } 
	if (firstName == "") {
    	document.getElementById("fName").innerHTML = "First Name Required.";
    }

    // submit the form if all entries are valid
    // otherwise, display an error message
    if (emailAddress1 != "" && emailAddress2 != "" && (emailAddress2 == emailAddress1) && firstName != "") {
			//reseting values
		document.getElementById("email").innerHTML = "";
		document.getElementById("email2").innerHTML = "";
		document.getElementById("fName").innerHTML = "";
		/*alert("Thank you for signing up!"); */
		
    } else {
		//reseting values
    document.getElementById("email").innerHTML = "";
	document.getElementById("email2").innerHTML = "";
	document.getElementById("fName").innerHTML = "";
	
	if (emailAddress1 == "") {	
		document.getElementById("email").innerHTML = "Email required.";	    	
    } 
	if (emailAddress2 == "") {
    	document.getElementById("email2").innerHTML = "Email required.";
    } 
	if (emailAddress2 != emailAddress1) {
    	document.getElementById("email").innerHTML = "";
		document.getElementById("email2").innerHTML = "Email spaces do not match.";
    } 
	if (firstName == "") {
    	document.getElementById("fName").innerHTML = "First Name Required.";
    }
    }
};

window.onload = function() {
    $("join_list").onclick = joinList;
    $("email_address1").focus();
};
