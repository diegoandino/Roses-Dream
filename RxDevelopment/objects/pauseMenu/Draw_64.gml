if (pause) {
	
	 draw_set_color(c_black); 
	 draw_set_alpha(1); 
	 draw_rectangle(0, 0, 1920, 1080, 0);
	 //draw_set_halign(fa_center); 
	 
	 draw_set_font(PMenuFont);
	 draw_set_color(c_white);
	 draw_set_alpha(1);
	 draw_text(view_wport[0] / 2 - 320, view_hport[0] - 580, LeukFacts[rand]);

	 //Draw icons
	 draw_set_font(PMenuFont);
	 draw_set_color(c_fuchsia); 
	 draw_set_alpha(1); 
	 draw_text((view_wport[0] / 2 - 160), (view_hport[0] - 650), "Paused"); 
}