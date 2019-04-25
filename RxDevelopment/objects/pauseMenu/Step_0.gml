if (keyboard_check_pressed(vk_escape)) {
	if (!pause) {
		pause = true;
		instance_deactivate_all(true); 
		audio_pause_sound(snd_MainMenu);
		audio_play_sound(snd_pauseMenu, 8, false); 
	}
	
	else {
		pause = false; 
		instance_activate_all(); 
		audio_stop_sound(snd_pauseMenu);
		audio_resume_sound(snd_MainMenu);
		draw_set_color(c_white);
	}
}