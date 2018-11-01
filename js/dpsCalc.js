/*Code is for DSP calculator, pulls info parses to in, then multiplies after verifying numerical value*/

function dpsCalc(){
	var bd = document.getElementById("baseD").value;
	var bm = document.getElementById("dMultiplier").value;
	var totalDamage;
	
	var baseDamage = parseInt(bd);
	var damageMultiplier = parseInt(bm);
	
	if(isNaN(baseDamage) || isNaN(damageMultiplier)){
		alert("Please enter a numerical base damage and damage multiplier");
	}
		else{

			totalDamage = (baseDamage * damageMultiplier);
			document.getElementById("finalCalc").innerHTML = ("<p>Your total damage is: " + totalDamage + "</p>");
		} 
}