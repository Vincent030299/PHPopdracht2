<?php

	function math($math,$number1,$number2){
		if($math == "add"){
			 $number3 = $number1 + $number2;
			 echo "$number3";	
		}
		elseif($math == "minus"){
			$minus = $number1 - $number2;
			echo "$minus";
		}
		elseif($math == "divide"){
			$divide = $number1 / $number2;
			echo "$divide";
		}
		elseif($math == "multiply"){
			$multiply = $number1 * $number2;
			echo "$multiply";
		}
		else{
			echo "not valid";
		}
	}
	echo math("multiply",6,2);
?>