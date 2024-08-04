offset++


var _good_end = seq_good_ending
var _bad_end = seq_bad_ending
var _layerName = "Instances";
if global.karma > 0
{
	layer_sequence_create(_layerName,0,0,_good_end)
	if offset = time2
	{
		obj_SFX.slamSnd = true
	}
	if offset = time2 + 230{room_goto(rm_main_menu)}
	

}

if global.karma <= 0 
{
layer_sequence_create(_layerName,0,0,_bad_end)
if offset = time3
{
	obj_SFX.metalSnd = true
}

if offset = time3 + 160{room_goto(rm_main_menu)}
}

