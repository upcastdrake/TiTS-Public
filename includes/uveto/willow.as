/*
 * Willow, subby demon morph - https://docs.google.com/document/d/1Bt_xihZdwWpa3Pgi39uSJyeCkCQmYwzXmln8UdFlFOk/edit#
 * 
 * #Flags:
 * WILLOW_MET		1 if met Willow, else undefined
 * WILLOW_DATE		1 if went on a date with Willow, else undefined
 * WILLOW_AFFECTION	0-100? Willow affection score
 * WIILOW_SEXED		0-infinity number of times sexed Willow, undefined if never sexed
 * WILLOW_VAG		0-infinity number of times sexed Willow's vagina with 1 dick, undefined if never sexed
 * WILLOW_ANAL		0-infinity number of times sexed Willow's butt only, undefined if never sexed
 * WILLOW_DP		0-infinity number of times double penetrated Willow, undefined if never sexed
 * WILLOW_DV		0-infinity number of times double vaginalled Willow, undefined if never sexed
 * WILLOW_TV		0-infinity number of times triple vaginalled Willow, undefined if never sexed
 * WILLOW_TALK1		1 if talked to Willow about Herself, else undefined
 * WILLOW_TALK2		1 if talked to Willow about her past, else undefiend
 * WILLOW_TALK3		1 if talked to Willow about Uveto, else undefined
 * 
 */

public function showWillow(nude:Boolean = false):void
{
	if (flags["WILLOW_MET"] != undefined) showName("\nWILLOW");
	else showName("DEMON\nGIRL");
	showBust(willowBustDisplay(nude));
}

public function willowBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "WILLOW";
	if (nude) sBust += "_NUDE";
	return sBust;
}

public function willowAtBar():Boolean
{
	if (hours > 10 && hours < 22) return true;
	return false;
}

public function willowAtTheFreezer(btnSlot:int = 0):Boolean
{
	if (flags["WILLOW_MET"] == undefined)
	{ 
		output("\n\nYou take a cursory look around and spot a new face. It's a new waitress, and a pretty cute one at that... if you like demons. Yep. She looks like a demon straight out of One God mythology: red skin, horns, the whole deal. You notice with appreciation that she has a curvy, heart-shaped ass topped by a spaded tail and supple, perky breasts.");
		
		addButton(btnSlot, "Waitress", approachWillow);
	}
	else
	{
		output("\n\nYou see Willow the demonic waitress, carrying around trays of food and taking orders from customers. ");
		
		addButton(btnSlot, "Willow", approachWillow);
	}
	
	
}

public function approachWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	//Never met her
	if (flags["WILLOW_MET"] == undefined)
	{
		output("You walk over to an empty table and sit, waiting for the waitress to come and take your order. It isn't long before she appears, a cheery smile on her face, and hands you a menu. <i>“Hello there " + (pc.mf("sir", "miss")) + "! My name is Willow, and I'll be your server today! What would you like to order?”</i> She asks in a slightly bubbly voice. You notice her eyes running over your body when she thinks you aren't looking. She's definitely interested, that's for sure...");
		
		addButton(0, "Appearance", appearanceWillow);
		addButton(1, "Get Drink", willowDrinkMenu);
		if (pc.hasCock() || pc.hasHardLightStrapOn()) addButton(2, "Flirt", flirtWillow);
		else addDisabledButton(2, "Flirt", "Flirt", "You might be able to flirt with her, if you had something to penetrate her with.");
	}
	//Met her but haven't hung out after work
	else if (flags["WILLOW_WAIT"] == undefined)
	{
		output("You take your seat and wait for Willow to approach.");
		output("\n\nShe eventually makes her way over to you, and greets you with a smile. <i>“Hey there! Welcome back. Can I get you anything?”</i> She asks, smiling.");
		
		addButton(0, "Appearance", appearanceWillow);
		addButton(1, "Get Drink", willowDrinkMenu);
		if (pc.hasCock() || pc.hasHardLightStrapOn()) addButton(2, "Flirt", flirtWillow);
		else addDisabledButton(2, "Flirt", "Flirt", "You might be able to flirt with her, if you had something to penetrate her with.");
	}
	//She's yo subby pet
	else
	{
		output("When you take a seat at the bar, you see Willow serving a customer a few tables away. She hasn't noticed you yet, so you take the opportunity to just let your eyes roam over her a bit. She seems happier, more upbeat and chipper since the first time you met her. You, of course, had much to do with that...");
		output("\n\nEventually, however, she does notice you when she turns, and her face breaks out into a smile that practically lights up the room, her eyes shining as well. She holds up a finger, mouths at you: <i>“one minute!”</i> Then hurries off into the bar’s kitchen.");
		output("\n\nShe comes back out and immediately​ throws her arms around you, followed by a wet kiss to the cheek. <i>“Hey there! I wasn't expecting to see you today!”</i> She says with a smile.");
		if (pc.isNice())output("\n\n<i>“Well why wouldn't I come back to see this beautiful lady, hmm?”</i> You ask with a smile.");
		else output("\n\n<i>“If you want, I could just get up and leave!”</i> You say, making a face at her, which winds up with her sticking her​tongue out at you.");
		output("\n\nWillow laughs and kisses your cheek again before standing and clearing her throat, trying to ignore the rest of the bar- which happens to be giving the two of you knowing looks. <i>“So anyway, [pc.master], what did you want to order today?”</i> She asks, smiling.");
		
		addButton(0, "Appearance", appearanceWillow);
		addButton(1, "Get Drink", willowDrinkMenu);
		addButton(2, "Talk", talkWillow);
		addButton(3, "Sex", sexWillow);
		addButton(4, "Wear Clothes", wearClothesWillow);
	}
	
	addButton(14, "Back", mainGameMenu);
}

public function appearanceWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();

	output("Willow is a formerly human demon morph, standing at five feet and eight inches tall. She has dark red skin from head to toe. She has wavy black hair framing a bright, beautiful, angular face with high cheekbones. Her eyes are a stunning combination of colours, with deep purple irises, red pupils, and black sclera. Curved black horns stick out of the sides of her forehead, curving back over her head. She has plump, kissable lips and a slender neck.");
	output("\n\nHer body itself is rather curvy, with perky DD-cups resting on her chest and a round, toned heart shaped ass with a spaded tail swinging above it. Her most striking feature, however, is the quartet of wings on her back- large, leathery ones, easily able to lift her and another person into the air for a short distance.");
	
	addDisabledButton(0, "Appearance", "Appearance", "You're already checking her out.");
}

public function willowDrinkMenu():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	output("<i>“Right away, "+(pc.mf("sir", "miss"))+"!”</i> She says, pulling out a tablet, her fingers poised over the screen and looking at you expectantly.");
	
	//TODO: MAKE THE DRINK MENU - COPY HANA
}

public function flirtWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	output("<i>“Well, the thing I want isn't exactly on the menu...”</i> you say, looking at her in a way that leaves no doubt as to your intentions.");
	output("\n\n<i>“O-oh. Um... I...”</i> She's clearly flustered, her cheeks blushing red(der). <i>“I'm sorry, " + (pc.mf("sir", "miss")) + ", but... no flirting on the job!”</i> She says with an apologetic smile.");
	output("\n\n<i>“Well that's too bad,”</i> you sigh and smile, looking down at your menu, about to put the thought out of your mind when you hear a murmur.");
	output("\n\n<i>“I get off work in a couple hours, so if you don't mind waiting, maybe we can... Ahem!”</i> She clears her throat and looks at you, chewing her bottom lip, a smile playing at the corners of her mouth. <i>“Your order, " + (pc.mf("sir", "miss")) + "?”</i>");
	
	addButton(0, "Get Drink", willowDrinkMenu);
	addButton(1, "WaitForHer", waitWillow);
}

public function waitWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] = 1;
	
	output("You decide against ordering and decide to wait for her instead. In an hour and a half, you see her check out, put on a coat, and walk over to your table. You stand up to greet her, and hold out your arm. <i>“May I?”</i> You ask, flashing her a grin. She nods, smiles, and loops her arm through yours.");
	output("\n\n<i>“So where are we going?”</i> She asks, looking at you. You notice her irises are a deep purple, ringed with red, and set in black sclera.");
	output("\n\n<i>“Somewhere nice. Know any good places? I'm kinda new around here,”</i> you say, looking around the place.");
	output("\n\n<i>“Oh yeah, I know the perfect place!”</i> She says, pulling you along until you stand in front of a homey looking restaurant. <i>“Best food on the planet! And not that stuff that comes out of a dispenser. I mean the real stuff, cooked by real hands!”</i> She says excitedly.");
	output("\n\n<i>“Well, if you say so...”</i> you chuckle, humoring the girl for now. You both walk in and head over to an empty table. Shortly, a kaithrit male comes over and takes your orders. Willow orders some sort of a pasta dish, and you order a good old fashioned steak. While you wait for your order, you can't help but take a jab at Willow. <i>“You know, you just let a " +(pc.mf("guy", "girl"))+ " take you out on a date without even asking " +(pc.mf("his", "her"))+ " name?”</i> You tease, eyes twinkling. Her eyes go wide and she blushes again.");
	output("\n\n<i>“W-well uhm... What's your name then?”</i> She asks, smiling a little.");
	output("\n\n<i>“[pc.Name]. [pc.Name] Steele,”</i> you answer. She gasps, her jaw falling open and her eyes going wide again. It's kinda adorable, actually.");
	output("\n\n<i>“Steele? The Steele!?”</i> she says in a voice loud enough for the people a few tables over to hear and turn their heads, suddenly attracting a little more attention than you would have liked. Willow notices and puts her head in her hands.");
	output("\n\n<i>“Oh my, I'm so sorry! I just got a little overexcited,”</i> she says, smiling bashfully. <i>“But really though. What's a " +(pc.mf("guy", "gal"))+ " like you doing in a place like this!? You should be flying around the galaxy blowing up pirates, looking for treasure, and all that!”</i> She says. You tell her your story, about how your father has sent you on an epic quest to reclaim your inheritance, and how you've been traveling the stars, seeking your fortune. She listens to the whole monologue in rapture, her head propped up by her palms. She simply stares at you for a minute after you finish and take a sip of your drink- which had arrived while you were talking.");
	output("\n\n<i>“That was... Wow,”</i> she says with raised eyebrows. <i>“Well, now that you've told me about yourself, I suppose you want to know something about me too.”</i>");
	output("\n\nAt this point, your food has arrived, and she's eating slowly while looking at you.");
	output("\n\nWhat do you ask her about?");
	
	addButton(0, "Herself", topicHerselfWillow, undefined, "", "");
	addButton(1, "Past", topicPastWillow, undefined, "", "");
	addButton(2, "Why Here", topicHereWillow, undefined, "", "");
}

public function topicHerselfWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] += 2;
	flags["WILLOW_TALK1"] = 1;
	
	output("<i>“So tell me a bit about yourself. Hobbies, favourite foods, people, colours, whatever you can think of! Fetishes too, if you'd like. We could probably act out some of them later,”</i> you say, winking. She blushes hard, her cheeks darkening as she raises an eyebrow and tries to hide a smile.");
	output("\n\n<i>“Well... my name is Willow, as you already know. My hobbies are painting, collecting shiny gems, and reading! My favourite foods would be... this,”</i> she says, pointing her fork down at her pasta, <i>“eggs, and steak. As for colours, black, silver, and red. Although wearing red is kinda pointless,”</i> she giggles. <i>“Don't really have any favourite people, but as for my fetishes, uhm...”</i> She blushes again. <i>“I-I like being tied down and... used by a big strong man or woman that can fuck me silly...”</i> She immediately hides her face behind a napkin. You raise an eyebrow at that. ");
	if (silly) output("Well helloooo Nurse!");
	else output("Well hel-lo miss subby! You grin, plans for what you want to do to her already running through your head.");
	
	if (flags["WILLOW_TALK2"] == undefined || flags["WILLOW_TALK3"] == undefined)
	{
		addDisabledButton(0, "Herself");
		if (flags["WILLOW_TALK2"] == undefined) addButton(1, "Past", topicPastWillow, undefined, "", "");
		else addDisabledButton(1, "Past");
		if (flags["WILLOW_TALK3"] == undefined) addButton(2, "Why Here", topicHereWillow, undefined, "", "");	
		else addDisabledButton(2, "Why Here");
	}
	else
	{
		addButton(0, "Next", finishTalkWillow);
	}
}

public function topicPastWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] += 1;
	flags["WILLOW_TALK1"] = 1;
	
	output("<i>“Tell me a bit about your past, Willow. Parents, siblings, I want to hear it all,”</i> you say, slicing off a bit of steak and bringing the fork to your mouth to take a bite. Mmm. This is delicious...");
	output("\n\n<i>“Hm? Well... I grew up on Solan 7, a desert planet on the inner edges of the Middle Rim. I had a more or less normal childhood; had pretty much everything a kid could want, and loving parents too. My siblings consisted of one very annoying older brother, and a very doting younger sister. Dad is a hunter, and a pretty good one too,”</i> she says with pride. <i>“There were some wild animals in the deserts that were quite hostile, and the bounty office payed out a hefty sum for the skulls of those animals, so that was pretty much our bread and butter," she eats a bit of her food before continuing. <i>“Mom... Mom was a farmer, and she grew what she could in the sand. And she...”</i> Willow sniffles. <i>“She died a day after I left.”</i>");
	output("\n\nYou place your hand on hers and offer your condolences.");
	output("\n\n<i>“N-no. I'm sorry. I shouldn't have gotten so worked up like that...”</i> she murmurs, dabbing at her eyes with a tissue. <i>“Anyway, Dad was a human, Mom was a half-ausar. I turned out looking human, sis and bro got some doggy traits. Chad got a tail and Mina got dog ears," she says, smiling fondly at the memory.");
	output("\n\n<i>“If I may ask... why did you leave?”</i> You ask tentatively.");
	output("\n\n<i>“I... I don't want to talk about it,”</i> she says, pushing her food around the plate.");
	
	addButton(0, "Drop it", topicPastDropWillow);
	addButton(0, "Push it", topicPastPushWillow);
}

public function topicPastPushWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] -= 5;
	
	output("<i>“Come on. Tell me. Please?”</i> You beg.");
	output("\n\nShe sighs. <i>“Jeez, [pc.name] there was a giant flashing red hint back there... I just felt a little cooped up is all,”</i> she says, not meeting your eyes. She's clearly hiding something, but you decide to drop it for now.");
	
	if (flags["WILLOW_TALK1"] == undefined || flags["WILLOW_TALK3"] == undefined)
	{
		addDisabledButton(1, "Past");
		if (flags["WILLOW_TALK1"] == undefined) addButton(0, "Herself", topicHerselfWillow, undefined, "", "");
		else addDisabledButton(0, "Herself");
		if (flags["WILLOW_TALK3"] == undefined) addButton(2, "Why Here", topicHereWillow, undefined, "", "");	
		else addDisabledButton(2, "Why Here");
	}
	else
	{
		addButton(0, "Next", finishTalkWillow);
	}
}

public function topicPastDropWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] += 2;
	
	output("<i>“Sorry. I was just curious,”</i> you say.");
	output("\n\nShe nods. <i>“Anything else you want to talk about?”</i>");
	
	if (flags["WILLOW_TALK1"] == undefined || flags["WILLOW_TALK3"] == undefined)
	{
		addDisabledButton(1, "Past");
		if (flags["WILLOW_TALK1"] == undefined) addButton(0, "Herself", topicHerselfWillow, undefined, "", "");
		else addDisabledButton(0, "Herself");
		if (flags["WILLOW_TALK3"] == undefined) addButton(2, "Why Here", topicHereWillow, undefined, "", "");	
		else addDisabledButton(2, "Why Here");
	}
	else
	{
		addButton(0, "Next", finishTalkWillow);
	}
}

public function topicHereWillow)():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] += 1;
	flags["WILLOW_TALK3"] = 1;
	
	output("<i>“So why are you here on this frozen hell of a planet? Got too bored with all the hot sand?”</i> You ask cheekily, eating more of the food.");
	output("\n\n<i>“Well, that's one reason!”</i> She laughs. <i>“Plus I wanted to get away from home, you know? It was getting kinda cramped. Aaaand I wanted to earn for myself. Figured I'd come to this place. The toves pay well!”</i> She says, shrugging.");
	output("\n\nYou nod. Toves being rich, yes they pay well... when it suits them. Otherwise, they would pay you minimum wage, less if they could. You suspect that what she's earning now is less than what her parents were earning back home, yet she seems to be quite happy here.");
	
	if (flags["WILLOW_TALK1"] == undefined || flags["WILLOW_TALK2"] == undefined)
	{
		addDisabledButton(2, "Why Here");
		if (flags["WILLOW_TALK1"] == undefined) addButton(0, "Herself", topicHerselfWillow, undefined, "", "");
		else addDisabledButton(0, "Herself");
		if (flags["WILLOW_TALK2"] == undefined) addButton(2, "Past", topicPastWillow, undefined, "", "");	
		else addDisabledButton(2, "Past");
	}
	else
	{
		addButton(0, "Next", finishTalkWillow);
	}
}

public function finishTalkWillow():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	output("\n\nThe two of you quickly finish your meal, you paying the bill like a proper courteous person. You offer your arm to her, which she gladly takes as you lead her out onto the frozen streets of Uveto. She turns to you, looking up as her eyes shine. <i>“I had a really great time tonight, [Name]. I hope we can do this again!”</i> She says, smiling. She looks like she's expecting a little something extra. What do you do?");
	
	addButton(0, "Kiss Her", , undefined, "", "");
	addButton(1, "TeaseKiss", , undefined, "", "");
	addButton(2, "Leave", , undefined, "", "");
}

public function willowKissKiss():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] += 5;
	
	output("You'll be damned if you don't give this girl what she wants... Your finger slides under her chin as you tilt her face up, pressing your lips to hers. You feel a quick gust of air on your cheek, a sign that she had just gasped. You pull away after a few seconds, your finger still resting on her chin. ");
	output("\n\n<i>“I enjoyed myself too... Willow. We definitely should do this again...”</i> You murmur into her ear, turning to walk away.");
	
	addButton(0, "Next", willowDateSexyTime, undefined, "", "");
}

public function willowTeaseKiss():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	flags["WILLOW_AFFECTION"] += 2;
	
	output("You cup her chin and lean in close for a kiss... and brush your lips against hers. <i>“Tease!”</i> she whines, punching you lightly in the chest, but smiling.");
	output("\n\n<i>“In truth, I had a great time, Willow. We're definitely doing this again," you say, turning to leave.");
	
	addButton(0, "Next", willowDateSexyTime, undefined, "", "");
}

public function willowLeaveKiss():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	output("<i>“Yeah. We definitely should do this again!”</i> you say, turning to leave.");
	
	addButton(0, "Next", willowDateSexyTime, undefined, "", "");
}

public function willowDateSexyTime():void
{
	clearOutput();
	author("Archangel99");
	showWillow();
	clearMenu();
	
	pc.lust(33);
	
	output("<i>“Hooold it right there, " + pc.mf("mister", "miss") + "!”</i> she says. You turn around and raise an eyebrow. <i>“Now what kind of a lady would I be if I didn't let the " + pc.mf("man", "woman") + " who treated me so nicely walk away without a treat...?”</i> She says, beckoning to you with a finger. You grin and walk to her.");
	output("\n\nShe turns and falls into step beside you, leading you to her apartment, which is a somewhat short and ugly building, with brown walls and hardly any windows to speak of. She climbs the steps, her ass swaying from side, giving you something to fix your eyes on the whole way. She leads you right to the top of the building, where there's a small, somewhat triangular door set into the wall. She takes out a key and unlocks the door, stepping inside and holding the door open for you, grinning and waving her arm as you enter.");
	output("\n\nYou step inside and take a look around the room. It is rather bare bones, with wood walls and floors; but you can see that Willow has tried to spruce the place up a bit. A vase filled with blue flowers sits on a nightstand next to a double bed, and the shelves of a bookcase on the left side of the room are filled with various books as well as one shining green gem. The back of the room has a window overlooking the frozen settlement, lights glimmering and sparkling in the darkness. The center of the room is occupied by a small round table with two chairs. The small space is lit by a single bulb hanging down from the ceiling, casting a warm yellow glow over everything. You can see a small stove and sink in the corner with an unwashed pan in the sink. The room is warm, lit from underneath by some unknown source of heat.");
	output("\n\n<i>“Well... Welcome to mi casa!”</i> Willow says. <i>“I know it's not much, but... it's home!”</i> She does a little twirl to show off the room. You smile as you take in the room. Rather homey and cozy, you think to yourself.");
	output("\n\n<i>“Nice place you got here. I like it,”</i> you say, taking off you [pc.armor] and draping it over the back of one of the chairs. She does the same before turning to you.");
	output("\n\n<i>“So... What do you wanna do now?”</i> she asks with a sultry expression that leaves no doubt as to what she means.");
	output("\n\nYou raise an eyebrow at her provocative look and step forward, grabbing her around the waist to pull her closer, your lips locking with hers. Her hands go up to your face, eyes drifting closed as she purrs softly, eagerly returning the kiss.");
	output("\n\nYour hands hook under her shirt, pulling it up and over her head before tossing it to the side, and then dropping lower to squeeze her ass. Unbuckling her jeans, you pull them down and off, tossing them to join her shirt. Her bra and panties follow soon after, and she looks at you while panting slightly, eyes wide and bright, her naked body yours to do with as you please.");
	
	addButton(0, "Vaginal", willowSexVaginal, undefined, "", "");
	addButton(1, "Anal", willowSexAnal, undefined, "", "");
}

public function willowSexVaginal():void
{
	
	
	
	
	
}