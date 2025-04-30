function textbox_input(text, timer)
{
	if(keyboard_check(vk_anykey) and string_length(text) < 27)
	{
		text = text + string(keyboard_string);
		keyboard_string = "";
	}

	if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and timer = 2)
	{
		text = string_delete(text,string_length(text),1);
		timer = 0;
		keyboard_string = "";
	}

	if(keyboard_check_pressed(vk_backspace)) {
		text = string_delete(text, string_length(text),1);
		keyboard_string = "";
		timer = -4;
	}

	if(timer != 2) {
		timer ++;
	}
	
	return { input: text, counter: timer };
}

function verify_text_input(text, type_input)
{
	switch(type_input)
	{
		case "text":
		
			break;
		
		case "int":
			var incorrect = false;
		
			if (string_length(text) == 0) break;

			try { var xxx = real(text); }
			catch(e) { incorrect = true; }

			while (incorrect)
			{
				try { var xxx = real(text); incorrect = false; }
				catch(e)
				{
					if (string_length(text) == 1) { text = ""; incorrect = false; }
					text = string_delete(text, string_length(text), 1);
				}
			}
			break;
	}
	
	return text
}