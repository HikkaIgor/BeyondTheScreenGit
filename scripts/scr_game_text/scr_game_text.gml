
function scr_game_text(_text_id)
{
	
	switch(_text_id)
	{
		
	//Ребенок
		//Стол
		case "obj_table":
		scr_text("it's an old table")
		break;
		//Кровать
		case "obj_bed":
		scr_text("Мне ещё рано ложиться спать","child")
		break;
		//Тумбочка
		case "obj_tumb":
		scr_text("Часы спешат на несколько минут")
		scr_text("Блин, я опять забыл их настроить...","child_sad")
		
		break;
		//Коробка с игрушками
		case "obj_toy_box":
		scr_text("Коробка с вашими любимыми игрушками")
		scr_text("Может, поиграть с ними?","child")
				scr_option("Поиграть","obj_toy_box - yes");
					scr_text_color(0,30,c_white,c_white,c_white,c_white)
				scr_option("Отложить","obj_toy_box - no");
					scr_text_color(0,30,c_white,c_white,c_white,c_white)
				break;
			case "obj_toy_box - yes":
					global._played = 1
					scr_text("Почему бы и нет!","child_happy")
						if (!instance_exists(obj_fade))
					{
						var _targetRoom = rm_child_room;
						scr_fade(_targetRoom,60,c_black);
					}


			break;
			
			case "obj_toy_box - no":
					scr_text("Может позже","child")
					scr_text("Вы положили игрушку на место");
				
			break;
			case "obj_toy_box - played":
				scr_text("Я уже наигрался")
				break;
		//Компьютерный стол
		case "obj_computer":

		scr_text("Наконец-то я могу поиграть!","child")
		scr_text("Поиграть в компьютер?")
			scr_option("Да","obj_computer - yes");
			scr_option("Нет","obj_computer - no");
		break;
		
			    case "obj_computer - yes":
					
					scr_text("Вы знаете управление?");
						scr_option("Да","tutor - yes")
						scr_option("Нет","tutor - no")
						
					break;
						case "tutor - yes":
							scr_text("Приятной игры!")
							if (!instance_exists(obj_fade))
							{
								var _targetRoom = rm_puzzle_room_1;
								scr_fade(_targetRoom,60,c_black);
								obj_SFX.selectSnd = true
							}
							break;
						case "tutor - no":
							scr_text("Движение - Стрелочки/WASD")
							scr_text("Взаимодействие с объектами - E/Enter")
							scr_text("Рестарт персонажа - R")
							scr_text("Увеличение куба - ЛКМ по кубу")
							scr_text("Уменьшение куба - ПКМ по кубу")
							break;
				
					case "obj_computer - no":
						scr_text("Может позже","child");
					break;

		
		//Шкаф
		case "obj_wardrobe":
		scr_text("Шкаф набит детской одеждой")
		break;
		
		//Книжный шкаф
		case "obj_bookshelf":
		scr_text("Все книжки стоит по порядку")
		scr_text("Скорее бы купить новый комикс...","child_sad")
		break;
		
		//Дверь

		case "obj_door":
		if global._helped_mom = 0
		{
		scr_text("Сынок! Помоги разобрать продукты, пожалуйста!","mother",-1)
			scr_option("Помочь","obj_door - help")
			scr_option("Отказаться","obj_door - refuse")
			break;
		}
			case "obj_door - help":
					global._helped_mom = 1
					scr_text("Хорошо, мам!","child_happy")
					
					global.karma += 1;

					if  (!instance_exists(obj_fade))
				{
					var _targetRoom = rm_child_room;
					scr_fade(_targetRoom,60,c_black);
				}
					break;
				
					
			case "obj_door - refuse":
				scr_text("Мам,я занят!","child_angry")
				scr_text("Хорошо,сынок...","mother_sad",-1)
				global._not_helped_mom = 1;
				global.karma -= 1;
			
			break;
		case "obj_door - helped":
		scr_text("Хорошо, что я помог маме!","child_happy")
		break;
		case "obj_door - not helped":
		scr_text("Маме уже не нужна помощь...")
		break;
		//Рост
		case "obj_scale":
		scr_text("Вы так сильно вырасли с прошлого раза!")
		scr_text("Блин, мама всё ещё выше...","child_sad")
		break;
		//Рюкзак
		case "obj_backpack":
		scr_text("Ргххх!","child_angry")
			scr_text_shake(0,6)
		scr_text("Достали уже эти уроки!","child_angry")
		break;
		//Растения
	
		case "obj_plants":
		if global._polit = 0
		{
		scr_text("Давно я их не поливал","child")
		scr_text("Полить цветы?")
			scr_option("Конечно","obj_plants - polit")
			scr_option("Не поливать","obj_plants - nepolit");
		break;
		}
			case "obj_plants - polit":
			global._polit = 1;
			scr_text("Отлично, Вы полили цветы!")
			global.karma+= 1;
			if (!instance_exists(obj_fade))
					{
						var _targetRoom = rm_child_room;
						scr_fade(_targetRoom,60,c_black);
					}
			break;
			case "obj_plants - nepolit":
			global._nepolit = 1;
			scr_text("Главное, чтобы они не завяли...","child_sad")
			global.karma-= 1;
			break;
			case "obj_plants - zabil":
			scr_text("Цветок можно и не поливать...")
			break;
			
			case "obj_plants - polil":
			scr_text("Цветы стали выглядеть гораздо лучше!","child_happy")
			break;
		
	//Тинейджер
		//Тумбочка
		case "obj_tumb_teen":
			scr_text("Время остановилось на 20:31")
				scr_text_color(22,27,c_red,c_red,c_red,c_red)
			scr_text("Я всё ещё их не настроил...","teenager_sad")
			
		break;
		//Кровать
		case "obj_bed_teen":
			scr_text("Кровать такая мягкая~","teenager_happy")
			scr_text("Но мне ещё рано спать!","teenager")
		break;
		//Стол
		case "obj_table_teen":
			scr_text("На столе лежит украшенный камень")
			scr_text("И зачем я взял его с того фестиваля?","teenager")
			scr_text("Погладить камень?")
				scr_option("Да","obj_table_teen - yes")
				scr_option("Нет","obj_table_teen - no")
				break;
			case "obj_table_teen - yes":
				scr_text("Вы погладили камень, молодец!")
			break;
			case "obj_table_teen - no":
				scr_text("Камень это запомнит >:(","angry")
				 scr_text_color(20,23,c_red,c_red,c_red,c_red)
			break;

		//Спорт

		case "obj_sport_teen":
		if global._sport = 0
		{
		scr_text("На полу лежат спортивный инвентарь")
		scr_text("Заняться спортом?")
			scr_option("Спорт - жизнь","obj_sport_teen - yes")
			scr_option("Можно и отдохнуть","obj_sport_teen - no")
			break;
		}
			case "obj_sport_teen - yes":
					global._sport = 1
					scr_text("Light weight baby!","teenager_happy")
					global.karma += 1;

					if (!instance_exists(obj_fade))
				{
					var _targetRoom = rm_teenager_room;
					scr_fade(_targetRoom,60,c_black);
				}
					break;
				
					
			case "obj_sport_teen - no":
				scr_text("Да нафиг этот спорт нужен вообще!","teenager_angry")
				global.karma -= 1;
				global._no_sport = 1;
			
			break;
		case "obj_sport_teen - sport":
		scr_text("Ух, нужно почаще заниматься","teenager_happy")
		break;
		case "obj_sport_teen - no sport":
		scr_text("Вы больше не хотите заниматься спортом")
		scr_text("Хотя знаете, что в здоровом теле - здоровый дух")
			scr_text_float(35,47)
		break;
		//Гитара
		case "obj_guitar_teen":
			obj_SFX.guitarSnd1 = true
			scr_text("Гитара, которую вам подарили на день рождения")
			scr_text("Научится бы на тебе хоть играть...","teenager_sad")
			
		break;
		//Мусорка
		case "obj_trash_teen":
		if global._trash_clean = 0
		{
			scr_text("Сколько же мусора успело скопиться","teenager")
			scr_text("Среди мусора видны неудачные рисунки и салфетки")
			scr_text("Надо бы выбросить всё это","teenager")
			scr_option("Выбросить","obj_trash_teen - throw")
			scr_option("Нет","obj_trash_teen - no throw")
			break;
		}
			case "obj_trash_teen - throw":
					global._trash_clean = 1
					scr_text("С глаз долой... Из сердца вон!","teenager_happy")
					global.karma += 1;
					global._trash = 1;

					if (!instance_exists(obj_fade))
				{
					var _targetRoom = rm_teenager_room;
					scr_fade(_targetRoom,60,c_black);
				}
					break;
				
					
			case "obj_trash_teen - no throw":
				scr_text("Как-нибудь потом...","teenager_sad")
				global.karma -= 1;
				global._trash_not_clean = 1;
			
			break;
		case "obj_trash_teen - no trash":
		scr_text("Давно нужно было это сделать","teenager_happy")
		break;
		case "obj_sport_teen - still trash":
		scr_text("Потом... Когда-нибудь...","teenager_sad")
			scr_text_float(0,24)
		scr_text("Может быть...","teenager_sad")
			scr_text_float(0,13)
		break;
		//Шкаф
		case "obj_wardrobe_teen":
		scr_text("Одежды стало намного больше")
		scr_text("Но мне по прежнему нечего надеть...","teenager_sad")
		break;
		//Книжный шкаф
		case "obj_bookshelf_teen":
		scr_text("Среди книжек выделяется комикс Unbreakable")
			scr_text_color(31,42,c_yellow,c_yellow,c_yellow,c_yellow)
		scr_text("Ты стоил каждой вложенной копейки!","teenager_happy")
		break;
		//Цветок
		case "obj_plant_teen":
		if global._polit = 1
		{
		scr_text("Вы с каждым днём растёте все выше!","teenager_happy")
		break;
		}
		else
		scr_text("Надо бы вас полить... Потом...","teenager_sad")
		break;
		//Дверь
		case "obj_door_teen":
		if global._helped_mom = 1 
		{
		scr_text("Сынок! Я принесла твои любимые сырки!","mother",-1)
		if (!instance_exists(obj_fade))
				{
					var _targetRoom = rm_teenager_room;
					scr_fade(_targetRoom,60,c_black);
				}
		break;
		}
		else
		scr_text("Сын, я дома...","mother_sad",-1)
		scr_text("Мама пришла... Посижу пока в комнате","teenager_sad")
			scr_text_shake(0,14)
		break;
		//Компьютерный стол
		case "obj_computer_teen":

		scr_text("Заняться всё равно нечем","teenager_happy")
		scr_text("Поиграть?")
			scr_option("Почему бы и нет?","obj_computer_teen - yes");
			scr_option("Нет","obj_computer_teen - no");
		break;
			case "obj_computer_teen - yes":
			scr_text("Поехали!","teenager_happy")
				if (!instance_exists(obj_fade))
						{
							var _targetRoom = rm_puzzle_room_3;
							scr_fade(_targetRoom,60,c_black);
						}
				break;
		case "obj_computer_teen - no":
			scr_text("Хотя, можно и другое занятие поискать","teenager")
	}
	
		

}