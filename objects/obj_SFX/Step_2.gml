var _sfxVol = global.SFX_VOL * global.masterVolume;

//press button
if buttonPressedSnd == true
{
	var _snd = audio_play_sound(snd_press_button,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	buttonPressedSnd = false;
}
//release button
if buttonReleasedSnd == true
{
	var _snd = audio_play_sound(snd_release_button,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	buttonReleasedSnd = false;
}

if selectSnd == true
{
	var _snd = audio_play_sound(snd_select,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	selectSnd = false;
}

if clickSnd == true
{
	var _snd = audio_play_sound(snd_click,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	clickSnd = false;
}

if whoosh1Snd == true
{
	var _snd = audio_play_sound(snd_whoosh_1,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	clickSnd = false;
}
if whoosh2Snd == true
{
	var _snd = audio_play_sound(snd_whoosh_2,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	clickSnd = false;
}
if guitarSnd1 == true
{
	var _snd = audio_play_sound(snd_guitar_1,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	guitarSnd1 = false;
}

if slamSnd == true
{
	var _snd = audio_play_sound(snd_door_slam,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	slamSnd = false;
}

if metalSnd == true
{
	var _snd = audio_play_sound(snd_metal_crash,8,false)
	audio_sound_gain(_snd,_sfxVol,0);
	metalSnd = false;
}
