if (!instance_exists(obj_fade))
{
	var _targetRoom = rm_child_room;
	scr_fade(_targetRoom,60,c_black);
	obj_SFX.selectSnd = true
}