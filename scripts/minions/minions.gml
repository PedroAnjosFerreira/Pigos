// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Minion() constructor{
	class = "Ranger"
	group = ""
	
	#region Attack Stats
	
		attack_rate = 500
		target_count = 1
		range = 20
		
	#endregion
	
	mine_rate = 500
	
	inventory_slots = 2
	inventory = []
	target_chest = noone

}

function BrownMinion() : Minion() constructor{
	class = "Brown"
	group = ""
	
	#region Attack Stats
	
		attack_rate = 650
		target_count = 2
		range = 200
		
	#endregion
	
	mine_rate = 500
	inventory_slots = 2
}