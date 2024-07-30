/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();

if global.SFX_VOL = 1
{
	image_index = 1;
}
else

{
	image_index = 0;
}

if hoverbutton == true
{
	image_xscale = lerp(image_xscale,1.7,0.1)
	image_yscale = lerp(image_yscale,1.7,0.1)
	image_alpha = lerp(image_alpha,1,0.1)	
}
else
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
	image_alpha = lerp(image_alpha,1,0.1)	
}