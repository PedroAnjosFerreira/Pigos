// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
	function InsideMinion(_range = 0, _attack_rate = 0, _target_count = 0, _current_attack_rate = 0, _mode = MINION_MODES.FREE) constructor{
		current_attack_rate = _current_attack_rate
		range = _range
		attack_rate = _attack_rate
		target_count = _target_count
		mode = _mode
	}