if (state == 0)
{
	timer += 0.5;
	if (timer >= duration)
	{
		room_goto(target_rm)
		state = 1;
	}
}
else
{
	if (state == 1)
	{
		timer -= 0.5;
		if (timer<=0)
		{
			instance_destroy();
		}
	}
}
alpha = timer/duration;
depth = -100;
