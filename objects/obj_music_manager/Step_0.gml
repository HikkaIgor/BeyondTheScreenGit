var _finalVol = global.musicVolume*global.masterVolume;


//play the target song
if songAsset != targetSongAsset	{
	//Tell the old song to fade out
	if audio_is_playing(songInstance)
	{
		//add our songInstance
		array_push(fadeOutInstance,songInstance);
		//starting volume
		array_push(fadeOutInstVol,fadeInInstVol);
		//fading out frames
		array_push(fadeOutInstTime,endFadeOutTime);
		
		//reset the songInstance and songAsset
		songInstance = noone;
		songAsset = noone;
		
	}
	
	//play the song if the old has faded out
if array_length(fadeOutInstTime)==0
{
	if audio_exists(targetSongAsset)
		{
			//play the song
			songInstance = audio_play_sound(targetSongAsset,4,1)
	
			//start volume at 0
			audio_sound_gain(songInstance,0,0);
			fadeInInstVol = 0;
		}
		//set the songAsset to match the targetSongAsset
		songAsset = targetSongAsset;
		}
}

//Vol control
//main song control
	if audio_is_playing(songInstance)
	{
	if startFadeInTime > 0
		{
			if fadeInInstVol < 1{fadeInInstVol += 1/startFadeInTime} else fadeInInstVol = 1;
		}
		//if fade in = 0 ==> start song immedietly 
		else
		{
			fadeInInstVol = 1;
		}
	
		//actually set the gain
		audio_sound_gain(songInstance,fadeInInstVol*_finalVol,0);
	
	}
	
	
	
//fading songs out
for (var i = 0; i<array_length(fadeOutInstTime); i++)
{
	//fade the volume
	if fadeOutInstTime[i]>0
	{
		if fadeOutInstVol[i] > 0 {fadeOutInstVol[i] -= 1/fadeOutInstTime[i];};
	}
	//immidiatly cut the volume to 0
	else
	{
		fadeOutInstVol[i] = 0;
	}
	
	//Actually set the gain
	audio_sound_gain(fadeOutInstance[i],fadeOutInstVol[i]*_finalVol,0);
	//stop the song when vol = 0
	if fadeOutInstVol[i] <= 0
	{
		if audio_is_playing(fadeOutInstance[i]) {audio_stop_sound(fadeOutInstance[i]); };
		//remove it from arrays
		array_delete(fadeOutInstance,i,1);
		array_delete(fadeOutInstVol,i,1);
		array_delete(fadeOutInstTime,i,1);
		//set the loop back 1 since  we deleted entry
		i--;
	}
}

