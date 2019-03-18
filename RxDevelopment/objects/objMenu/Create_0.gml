//Menu Setup

gui_height = display_get_gui_height(); 
gui_width = display_get_gui_width(); 
gui_margin = 32;

menuX = gui_width - 20; 
menuY = gui_height - gui_margin;
menuXTarget = gui_width - gui_margin;
menuSpeed = 25;
menuFont = MenuFont; 
menuItemHeight = font_get_size(MenuFont);
menuCommitted = -1; 
menuControl = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menuItems = array_length_1d(menu);
menuCursor = 2; 