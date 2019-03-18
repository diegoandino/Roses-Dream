/// @description Insert description here
// You can write your code in this editor


winText[0] = "Congratulations! You've made it through the first dream stage and have completed your first round of chemotherapy. (Press 'E' to continue)";
winText[1] = "There's still a lot more work to do, but I can see you've got what it takes, ROSE.";
winText[2] = "For now, know that your parents and I are so, so proud of you!";
winText[3] = "Thanks, Dr. DoGoodle! This leukemia is going dooooowwwn. (Press 'E' to complete level)";
winSpeakers = [obj_doctor,obj_doctor,obj_doctor,obj_player];

goText[0] = "Oops! For the chemotherapy to fully work, you gotta get rid of ALL the bad cells! You got this!";
goText[1] = "Okay, I'll be right back!";
goSpeakers = [obj_doctor,obj_player];

active_textbox = noone;

number_enemies = 0;
delay = false;