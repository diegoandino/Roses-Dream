/// @description Insert description here
// You can write your code in this editor
portrait_index = 1;
voice = snd_voiceDoctor;
name = "Dr. DoGoodle"
text[0] = "Welcome to your bone marrow! Right now you're deep asleep while we give you chemotherapy. (Press 'E' to continue) ";
text[1] = "Why do I look so different, Dr. DoGoodle? What's this thing I'm holding?"
text[2] = "Huh? Incredible! You're dreaming that you're fighting your LEUKEMIA! That thing you're holding must be your MAGIC CHEMO WAND!";
text[3] = "Woah! So I've got magic powers?"
text[4] = "YApparently you do! This is pretty amaz-";
text[5] = "GGGGGGRRRROOOOOWLLLL!";
text[6] = "Ahhh! What are those things?";
text[7] = "Woah, looks like you've got company! Those things are CANCEROUS WHITE BLOOD CELLS. They used to be good, but they got corrupted by the cancer and now they just want to cause trouble.";
text[8] = "How do they cause trouble? What do I do?";
text[9] = "They cause trouble by DOUBLING! Quick, you've got the wand! Make them disappear by pressing 'S' or 'Left Mouse Button'! (Press 'E' to exit text)";
speakers = [id,obj_player,id,obj_player,id,obj_basicEnemy,obj_player,id,obj_player,id];

create_textbox(text,speakers);