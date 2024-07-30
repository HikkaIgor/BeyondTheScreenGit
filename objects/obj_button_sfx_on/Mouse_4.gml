event_inherited()


if global.SFX_VOL = 0
{
	image_index = 1
	musicVol = 1;
	obj_SFX.clickSnd = true
	global.SFX_VOL = musicVol
	audio_sound_gain(snd_whoosh_1,0.03,0)
	audio_sound_gain(snd_whoosh_2,0.03,0)
}
if global.SFX_VOL = 1
{
image_index = 1
}