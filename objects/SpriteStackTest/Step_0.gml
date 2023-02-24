rotation += 1

<<<<<<< Updated upstream


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

//show_debug_message(alarm[0])
=======
animator.step()
>>>>>>> Stashed changes
