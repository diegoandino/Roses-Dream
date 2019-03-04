/// @description Insert description here

// Draw box

view_w = surface_get_width(application_surface)/2;
view_h  = surface_get_height(application_surface)*.75;
draw_sprite(spr_textBox,0,view_w,view_h);

// Draw text
draw_set_font(fnt_text);
draw_text_ext(view_w,view_h,text,stringHeight,boxWidth);