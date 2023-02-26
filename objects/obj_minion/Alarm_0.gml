
	show_debug_message("Alarme")
	if mine_ticks != target_object.mine_ticks_needed {
		mine_ticks ++
		alarm_set(0, mine_rate)
	}else {
		target_object.mined()
		mine_ticks = 0
	}
