if place_meeting(x,y,obj_player) && (!instance_exists(obj_fade))
{
	var _targetRoom = rm_teenager_room;
	scr_fade(_targetRoom,60,c_black);
}