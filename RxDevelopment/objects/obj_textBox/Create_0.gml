box = spr_textBox;
frame = spr_frame;
portrait = spr_portraits;
namebox = spr_namebox;

gui_height = global.guiHeight;
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

port_x = (global.guiWidth - box_width - port_width) *.5;
port_y = (gui_height*.98) - port_height;
box_x = port_x + port_width;
box_y = port_y;
namebox_x = port_x;
namebox_y = box_y - namebox_height;

x_buffer = 12;
y_buffer = 8;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_x = namebox_x + (namebox_width/2);
name_y = namebox_y + (namebox_height/2);
text_max_width = box_width - (2*x_buffer);


portrait_index = 0;
counter = 0;
pause = false;

text[0] = "";
page = 0;
name = "";
voice =snd_voiceProt;

interact_key = ord("E");


text_col = c_white;
name_col = c_white;
font = fnt_text;

draw_set_font(font);
text_height = string_height("M");


obj_player.freezeMotion = true;

existance_counter = 0;