if (pause) {
	 draw_set_color(c_black); 
	 draw_set_alpha(1); 
	 draw_rectangle(0, 0, 1920, 1080, 0);
	 //draw_set_halign(fa_center); 
	 
	 //Draw icons
	 draw_set_font(MenuFont);
	 draw_set_color(c_fuchsia); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] - 120 / 2), (view_hport[0] - 650), "Paused"); 
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2), (view_hport[0] - 600), "Controls"); 
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2), (view_hport[0] - 550), "Climb --> W"); 
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2), (view_hport[0] - 500), "Climb Down --> S");
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2), (view_hport[0] - 450), "Move Left --> A");
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2), (view_hport[0] - 400), "Move Right --> D");
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2) + 150, (view_hport[0] - 350), "Shoot --> J or Left Mouse Button");
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2), (view_hport[0] - 300), "Jump --> Space or I");
	 
	 draw_set_font(MenuFont);
	 draw_set_color(c_white); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2), (view_hport[0] - 250), "Dash --> Shift"); 
}