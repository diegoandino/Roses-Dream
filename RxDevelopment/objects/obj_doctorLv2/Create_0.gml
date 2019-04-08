/// @description Insert description here
// You can write your code in this editor
portrait_index = 1;
voice = snd_voiceDoctor;
name = "Dr. DoGoodle"
text[0] = "Hey, Rose! Welcome back, today we're doing your next round of chemo! (Press 'E' to continue, hold to skip) ";
text[1] = "You've been doing great so far! You just gotta get through a little more.";
text[2] = "Alright, let's get going! (Press 'E' to close)"

speakers = [id,id,obj_player];

create_textbox(text,speakers);