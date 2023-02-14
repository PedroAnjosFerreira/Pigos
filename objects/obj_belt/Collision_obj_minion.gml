
if placed{
	switch (belt_direction) {
		case belt_directions.right:
		other.x += 1 * belt_speed;
		break;
		case belt_directions.left:
		other.x -= 1 * belt_speed;
		break;
		case belt_directions.up:
		other.y -= 1 * belt_speed;
		break;
		case belt_directions.down:
		other.y += 1 * belt_speed;
		break;
	}
}