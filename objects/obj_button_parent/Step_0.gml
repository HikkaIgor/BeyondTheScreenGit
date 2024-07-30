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