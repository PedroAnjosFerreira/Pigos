sprite_idle = [spr_pigo_beta_idle_0, spr_pigo_beta_idle_1]
sprite_walk = [spr_pigo_beta_walk_0, spr_pigo_beta_walk_1, spr_pigo_beta_walk_2]
sprite = [sprite_idle, sprite_walk]
rotation = 0
scale = 2

enum GENERIC_STATES{
	IDLE,
	WALK
}

anim_param = [
	new AnimationParameters(10, true), // IDLE
	new AnimationParameters(5, true)   // WALK
]

animator = new AnimationPlayer(sprite,GENERIC_STATES.WALK, scale, anim_param)