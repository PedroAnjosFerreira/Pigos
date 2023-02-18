sprite_idle = [PIGO_BETA_IDLE_0, PIGO_BETA_IDLE_1]
sprite_walk = [PIGO_BETA_WALK_0, PIGO_BETA_WALK_1, PIGO_BETA_WALK_2]
sprite = [sprite_idle, sprite_walk]
rotation = 0
scale = 2
delay = 5

animator = new animation_player(sprite,mini_calca.WALK, scale, true)

// Set the alarm to trigger in 60 steps (1 second)
alarm[0] = delay;

enum mini_calca{
	IDLE,
	WALK
}