/// @description Insert description here
// You can write your code in this editor


winText[0] = "Alright, way to go, Rose! You've made it through your second round of chemo!";
winText[1] = "You're doing great, just one more round to go!";
winText[2] = "Thank you, Dr. DoGoodle! This leukemia is going dooown! (Press 'E' to complete level)";
winSpeakers = [obj_doctorLv2,obj_doctorLv2,obj_player];

goText[0] = "Oops! For the chemotherapy to fully work, you gotta get rid of ALL the bad cells! You got this!";
goText[1] = "Okay, I'll be right back!";
goSpeakers = [obj_doctorLv2,obj_player];

active_textbox = noone;

number_enemies = 0;
delay = false;