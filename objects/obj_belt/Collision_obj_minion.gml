
if placed{
	switch (belt_direction) {
		case BELT_DIRECTIONS.RIGHT:
		other.x += 1 * belt_speed;
		break;
		case BELT_DIRECTIONS.LEFT:
		other.x -= 1 * belt_speed;
		break;
		case BELT_DIRECTIONS.UP:
		other.y -= 1 * belt_speed;
		break;
		case BELT_DIRECTIONS.DOWN:
		other.y += 1 * belt_speed;
		break;
	}
}