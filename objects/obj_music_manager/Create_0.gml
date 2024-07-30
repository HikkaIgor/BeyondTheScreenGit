global.masterVolume = 1;
global.musicVolume = 1;

//info for the song currently playing/trying to play
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0;//frames to fade out
startFadeInTime = 0;//frames to fade in
fadeInInstVol = 1;//volume of song inst


//fading out/stop songs
fadeOutInstance = array_create(0); //the audio instances to fade out
fadeOutInstVol = array_create(0); //the volume
fadeOutInstTime = array_create(0); //how fast fadeout should happen