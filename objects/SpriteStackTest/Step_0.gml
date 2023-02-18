/// @description Insert description here
// You can write your code in this editor
rotation += 1

animator.scale += 0.1

alarm[0]--
// Check if the alarm has expired
if (alarm[0] <= 0) {
    // Do something
	if(animator.frame == 0){
		animator.frame = 1
	}else if(animator.frame == 1){
		animator.frame = 2
	}else{
		animator.frame = 0
	}
	
	alarm[0] = delay;
}

show_debug_message(alarm[0])