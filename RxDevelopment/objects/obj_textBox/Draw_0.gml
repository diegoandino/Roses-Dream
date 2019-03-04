/// @description Insert description here

// Draw box

view_w = 0; //surface_get_width(application_surface)/2;
view_h  = surface_get_height(application_surface)*.93;
draw_sprite_ext(spr_textBox,0,view_w,view_h,x_scale, y_scale, 0, c_white, 1 );

// Draw text
draw_set_font(fnt_text);
draw_text_ext(view_w,view_h,text,stringHeight,boxWidth);