if room == rm_main_menu
{
	set_song_ingame(snd_calm_guitar,60,30)
	
}

if room == rm_child_room
{
	set_song_ingame(snd_calm_new,30,2*60)
}

if room == rm_puzzle_room_1
|| room == rm_puzzle_room_2
{
	set_song_ingame(snd_retro,60,30)
}

if room = rm_teenager_room
{
	set_song_ingame(snd_calm_guitar,30,30)
}
if room = rm_puzzle_room_3
|| room = rm_puzzle_room_4
{
	set_song_ingame(snd_retro_slowed,60,30)
}
if room = rm_endings
{
set_song_ingame(noone,30,30)
}