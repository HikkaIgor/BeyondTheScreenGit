

if global.SFX_VOL = 1
{
	image_index = 0;
	musicVol = 0;
	obj_SFX.clickSnd = true
	global.SFX_VOL = musicVol
	audio_sound_gain(snd_whoosh_1,0,0)
	audio_sound_gain(snd_whoosh_2,0,0)
}
