/// @description Insert description here
//Control the menu

//Item ease in

menuX += (menuXTarget - menuX) / menuSpeed;
//Keyboard Controls
if (menuControl) {
	if (keyboard_check_pressed(vk_up)) {
		menuCursor++;
		if (menuCursor >= menuItems) menuCursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down)) {
		menuCursor--;
		if (menuCursor < 0) menuCursor = menuItems - 1;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
		menuXTarget = gui_width - 20;
		menuCommitted = menuCursor;
		menuControl = false;
	}
}

//Cases
if (menuX < gui_width - 20) && (menuCommitted != -1) {
	switch (menuCommitted) {
		case 2: default: room_goto(room1); break;
		case 0: game_end(); break;
	}
}