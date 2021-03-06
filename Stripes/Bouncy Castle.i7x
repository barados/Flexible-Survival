Version 2 of Bouncy Castle by Stripes begins here.
[Version 2.0B - Extended castle w/more sexy traps]
"Save the vixen 'princess' from the 'castle'."

Section 1 - Starting Event

Snared Vixen is a situation.  The level of Snared Vixen is 5.
the sarea of Snared Vixen is "Beach".
vixdol is a number that varies.
vixcountdown is a number that varies.
dolphinbundle is a number that varies.
dolphinlist is a list of text that varies.
dolcastleturn is a number that varies.
dolcastlefight is a number that varies.
bcending is a number that varies.

when play begins:
	add Snared Vixen to badspots of girl;
	add Snared Vixen to badspots of furry;

Instead of resolving a Snared Vixen:
	say "     As you're travelling along the beach, you can hear some giggling in the distance.  As you crest the next sandy rise, you can see several bright pink dolphin girls playing with a vixen they've found.  She's struggling a little, but her resistance becomes less and less as the playful inflatables tease her body while taking off what few scraps of clothes she has.  As they're several hundred yards away, you'd not be able to get there in time to interfere if you wanted to.  It's hard to make out all the details at this distance, but are you interested in watching (Y) or shall you just continue on your way? (N)[line break]";
	if the player consents:
		say "     While one of the dolphin girls gives the vixen a kiss and another buries her bottlenose in her furry crotch, the third removes an uninflated dolphin toy from a satchel they were carrying.  As the pink dolphins start sliding it over the vixen, she hardly struggles, the trio keeping her too lustful to quite notice what's going on until it's too late.  Her arms are held to her sides as they start enclosing her in the large, inflatable cetacean.  It's only as they're sealing her up completely in it that she starts to scream, but those are soon muffled somehow.  The vixen, now fully encased in a dolphin-shaped inflatable, is carried into the water by the giggling girls.  You watch as they pull her out to sea.  You're confused by this at first, as they just seem to be floating her along, but you eventually spot a sky blue bouncy castle floating out on the water past the rocks that appears to be their destination.";
		say "     As you're watching all this, you continue walking along the beach.  By the time you get to the site of the vixen's capture, you can see the dolphin girls pulling the buoyant inflatable into the castle to meet whatever fate the dolphins eventually have planned for her.  You sort through the vixen's clothes and her small collection of gear.  You don't spot anything of use to you, though you do find a small pad of notes the vixen seems to have been using to keep track of stuff.  Most of it doesn't interest you until you spot a note about having recently found a large stash of bottled water.  Suddenly concerned about the vixen's fate, you find yourself wondering if there's any way to rescue her, or at least learn from her where these supplies can be found.";
		if boatfound is 0 and hasgills is 0:
			say "     But first, you'll need to find a means of getting out there.  You'll need to either be a better swimmer or find a boat you can use to get there.  She probably doesn't have too long, so you'll need to move quickly.";
			now boatfound is 1;
		otherwise if boatfound is 3:
			say "     The boat you've used to travel to the pirate island is more than capable of handling the short jaunt out to the bouncy castle, so you should be able to make it out there.";
		otherwise if hasgills is 1:
			say "     It would take a bit of work, but you should be able to swim all the way out to the bouncy castle thanks to your gills.";
		now Bouncy Castle is known;
		now vixdol is 1;
		now vixcountdown is 25;
		now dolphinlist is { "C", "A", "X", "B", "X", "C", "A", "D", "X", "C", "X", "A" };
		let templist be { "A", "C", "D", "E"};
		sort templist in random order;
		now entry 3 of dolphinlist is entry 1 of templist;
		now entry 5 of dolphinlist is entry 2 of templist;
		now entry 9 of dolphinlist is entry 3 of templist;
		now entry 11 of dolphinlist is entry 4 of templist;
	otherwise:
		say "     Deciding that it's not of interest to you, you turn away and head back the way you came.";
	now Snared Vixen is resolved;


Section 2 - Travelling to the Bouncy Castle

rowing is a truth state that varies.  rowing is usually false.

instead of navigating Bouncy Castle:
	if vixdol is 0:
		say "Go where now?";
		stop the action;
	if vixdol is 100:
		say "By this point, there's no reason to risk going there.";
		stop the action;
	otherwise if vixdol > 2:
		say "Don't you remember?  You sent it out to sea.";
		stop the action;
	if hasgills is 0 and boatfound <= 1:
		say "You have no means to make it out to the inflatable castle out in open water.  You'll need to find some means to get there.";
		stop the action;
	if location of player is not fasttravel and location of player is not Public Beach:
		say "You can't navigate from here.";
		stop the action;
	if location of player is Bouncy Castle:
		say "You're already here.";
		stop the action;
	if location of player is Beach Plaza or location of player is Public Beach:
		let x be 0;		[already at a valid starting point]
	otherwise:
		say "You begin by making your way back to the beach";
		let the bonus be (( the perception of the player minus 10 ) divided by 2);
		now battleground is "Outside";
		if a random number from 1 to 20 is less than 10 minus bonus:
			say ", encountering an enemy on the way there.";
			if there is a area of Battleground in the table of random critters:
				Fight;
				if ( ( hardmode is true and a random chance of 1 in 10 succeeds ) or ( "Bad Luck" is listed in feats of player and a random chance of 1 in 12 succeeds ) ) and battleground is not "void":
					say "As you are trying to recover from your last encounter, another roving creature finds you.";
					Fight;
		otherwise:
			say ", avoiding trouble as best you can.";
		move player to Beach Plaza;
	if boatfound is 3:			[boat]
		say "     Returning to where you moored your boat at the beachside, you set sail for the floating play castle.  You manage to sail out to it without incident.  It would take more sailing finesse than you have to pull up alongside the sky blue castle, so you drop anchor nearby and swim the remaining distance rather than risk puncturing its inflatable hide.";
		move player to Bouncy Castle;
	otherwise if boatfound is 2:		[rowboat]
		say "     Returning to the rowboat you found, you drag it into the water and start your journey.  It is hard work rowing the boat, but it certainly beats swimming the whole way.  As you're making your way through the rocking outcroppings on your way to the floating castle, you watch warily for any signs of the creatures infesting these waters.";
		now rowing is true;
		if a random number between 1 and 20 is greater than the perception of the player:
			swimmingfight;
		now rowing is false;
		say "     Eventually, you make it out to the buoyant castle, rowing up close to it.  Your arms are sore from all the rowing, but you have managed to arrive at your destination.  Worried your boat might scrape a hole in its rubbery hide, you moor your boat to one of the tethers tying the castle between the rocks.  You swim the short distance to the floating castle and make your way inside.";
		let dam be 16 - ( strength of player / 2 ) - (stamina of player / 2 );
		if dam < 0, now dam is 0;
		decrease hp of player by dam;
		move player to Bouncy Castle;
		follow the turnpass rule;
	otherwise if hasgills is 1:		[swam there]
		say "     Returning to the section of beach near the floating castle, you swim out into the waters.  While your aquatic affinity makes the swim easier, you still struggle against the turbulent waters in this area.  As you're making your way through the rocking outcroppings on your way to the floating castle, you watch warily for any signs of the creatures infesting these waters.";
		swimmingfight;	[details in Hellerhound\underwater zone.i7x]
		say "     Eventually, you make it out to the buoyant castle, managing to swim to one of the lines that is keeping it tethered between the rocky outcroppings.  You follow that line up to the castle and climb inside, quite tired, but having reached your destination.";
		let dam be 20 - ( strength of player / 2 ) - (stamina of player / 2 );
		if dam < 0, now dam is 0;
		decrease hp of player by dam;
		move player to Bouncy Castle;
		follow the turnpass rule;
	now dolcastleturn is 0;


Section 3 - Bouncy Castle Layout

bcswordplay is a truth state that varies.  bcswordplay is normally false.
bcseenplayroom is a truth state that varies.  bcseenplayroom is normally false.
lastsealfight is a number that varies.  lastsealfight is normally 255.
lastoctofight is a number that varies.  lastoctofight is normally 255.
lastorcafight is a number that varies.  lastorcafight is normally 255.
lastbcchair is a number that varies.  lastbcchair is normally 255.


The Bouncy Castle is a room.  Bouncy Castle is fasttravel.  Bouncy Castle is unknown.  Bouncy Castle is private.
The description of Bouncy Castle is "[bcentrance]".

The Fencing Room is a room.  The Fencing Room is east of Bouncy Castle.
The description of Fencing Room is "[bcfencingroom]".

The Bouncing Play Room is a room.  The Bouncing Play Room is south of Fencing Room.  The Bouncing Play Room is east of Ball Pit Room.
The description of Bouncing Play Room is "[bcplayroom]".

The Ball Pit Room is a room.  The Ball Pit Room is south of Toy Room.
The description of Ball Pit Room is "[bcballpitroom]".

The Toy Room is a room.  The Toy Room is west of Bouncy Castle.
The description of Toy Room is "[bctoyroom]".

The Parapets is a room.  The Parapets is up from Ball Pit Room.
The description of Parapets is "[bcparapets]".

The Slide Room is a room.  The Slide Room is east of Parapets.
The description of Slide Room is "[bcslideroom]".

BouncyCastleExit is a room.  "Leaving the bouncy castle."  BouncyCastleSlideExit is east of Slide Room.  BouncyCastleExit is north of Bouncy Castle.

the scent of Bouncy Castle is "This place smells of rubber and the ocean.";

the scent of Fencing Room is "This place smells of rubber and the ocean.";

the scent of Bouncing Play Room is "This place smells of rubber and the ocean, though there's a lingering scent of arousal and sex as well.";

the scent of Ball Pit Room is "This place smells of rubber and the ocean.";

the scent of Toy Room is "This place smells of rubber and the ocean.";

the scent of Parapets is "This place smells of rubber and the ocean.";

the scent of Slide Room is "This place smells of rubber and the ocean.";


Section 4 - Inside the Bouncy Castle

Chapter 1 - Entrance

to say bcentrance:
	if vixdol is 1:
		say "     As you approach your destination, you can see it's much larger than you'd originally guessed.  Being around 20 yards across on each side, it could probably accommodate several dozen rambunctious, jumping kids at once.  It even seems to be two tiered, with a waterslide coming down from the upper level on the west side.  You didn't think these things were made this large, but maybe.  The exterior of the castle is sky blue, making it difficult to see at a distance.  The large inflatable has been secured by two long ropes which lead to rocky outcroppings, mooring it safely inbetween them.  But despite this, it does shift and sway around considerably.  Coupling that with its bouncy floor makes movement inside rather difficult.";
		say "     You pull yourself into the first room and look around the entrance room.  It has a soft, bouncy floor and is a couple of feet above the water level, necessitating an easy climb up a mesh ladder that hangs from the entrance mouth.  The interior of this room has a dark green floor, blue walls with yellow arches and columns and a ceiling of red.  There's a couple of beach balls and pool noodles left scattered on the floor here, probably by the airheaded dolphin girls[if daytimer is night].  Despite the late hour, the castle strangely seems lit, though you can find no light sources[end if].";
		now vixdol is 2;
		increase score by 5;
	otherwise:
		say "     This inflatable castle floats on the water, tethered between two rocks by thick ropes.  It sways and bobs on the water, adding to the instability of its floor, making it difficult for you to move around.  The bouncy castle itself is brightly coloured with the exterior a sky blue, making it hard to spot on the water in the distance.  The interior has a dark green floor, blue walls with yellow arches and columns, and a ceiling of red vinyl[if daytimer is night].  Despite the late hour, the castle strangely seems lit, though you can find no light sources[end if].";
	say "     Aside from the yawning mouth to the castle which you entered to the south of you, there are two separate child-sized doorways out of this room, one to the east and one to the west.  While each doorway is obscured by strips on hanging clear plastic, pushing them aside, you glance quickly in them both before pressing onward.  The one to the [link]east[end link] has a few columns in it and some foam swords and other toys scattered on the floor.  To the [link]west[end link], you see large assortment of beach toys and equipment, including some several beach balls, plastic pails and buckets and a couple of those floating mats people can lie across while in the pool.  Alternatively, you could exit to the [link]north[end link] and make your way back to the beach.";

instead of going north from Bouncy Castle:
	say "     You head back into the water and make your way back to the beach to consider your next move.";
	move player to Public Beach;
	follow the turnpass rule;


Chapter 2 - Fencing Room

to say bcfencingroom:
	say "     This room is similar to the first room you were in, but has an arched window set into each of the two outer walls[if daytimer is day], letting in some light[otherwise].  Despite the late hour, the castle strangely seems lit, though you can find no light sources[end if].  Unlike the first room, there are several drawings of knights swordfighting on the walls";
	if bcswordplay is false:		[swords active - foam sword fight!]
		say ".  Scattered on the floor are several foam swords which, as you pause for a moment to look at them, start to rise up into the air on their own, swinging wildly at you.  The blows don't really hurt, but you are knocked around on the unsteady floor.";
		say "     Shall you: Grab one of the swords and [link]fight back (1)[as]1[end link] or make a break for the [if bcseenplayroom is true]play room[otherwise]doorway[end if] to the [link]south (2)[as]2[end link] or back to the entrance to the [link]west (3)[as]3[end link]?";
		now calcnumber is 0;
		while calcnumber < 1 or calcnumber > 3:
			say "Choose 1-3> [run paragraph on]";
			get a number;
		if calcnumber is 1:
			say "     You snatch at one of the swords and easily catch it by the hilt, turning and swinging it towards with others with a loud 'Aha!'  The sword parries a few strikes coming at you, but others strike you from behind.  Laughing, you hop to turn around and face those, fencing with them.  Soon you're hopping around the room and trying to weave around the pillars to swordfight with the boffer weapons as you laugh heartily.  Having fun playing with the animated weapons, you lose track of time until you are eventually left exhausted and drop to the floor, panting to regain your breath as you giggle merrily.  The swords, also appearing to be tired or content with their playtime, settle back down onto the floor.";
			increase morale of player by 2;
			decrease humanity of player by 5;
			decrease libido of player by 5;
			if libido of player < 0, now libido of player is 0;
			now bcswordplay is true;
			follow the turnpass rule;
		otherwise if calcnumber is 2 or calcnumber is 3:
			let shieldbonus be 0;
			let bonus be ( dexterity of player - 10 ) / 2;
			repeat with x running through equipped equipment:
				if ac of x > 0 and placement of x is "shield":
					let shieldbonus be 2;
			let dice be a random number from 1 to 20;
			say "     You roll 1d20([dice])+[bonus]+[shieldbonus]: [dice + bonus + shieldbonus] vs 16: ";
			if bonus + dice + shieldbonus is greater than 15:
				say "You move as best you can, weaving between the boffer swords as they swing at you.  Some blows hit, but you manage to stay on your feet as they pound onto you[if shieldbonus > 0] and your shield[end if] and make your escape, diving through into the next room.";
				if calcnumber is 2:
					move player to Bouncing Play Room;
				otherwise:
					move player to Bouncy Castle;
			otherwise:
				say "You try your best to move towards the door, but the unsteady footing and the wild blows from every direction send you tumbling around until you finally fall to the floor.  The foam swords pound on you for a while as you squirm around, trying to get up but becoming increasingly giddy.  You laugh and giggle madly as they bash you around for what seems like a couple of hours until the swords settle down and you manage to crawl into the next room.";
				decrease humanity of player by 3;
				follow the turnpass rule;
				if calcnumber is 2:
					move player to Bouncing Play Room;
				otherwise:
					move player to Bouncy Castle;
	otherwise:
		say ".  Scattered on the floor are the foam swords, still and inactive, at least for now.  You have two directions you can go from here, either back to the entrance by going [link]west[end link] or heading [link]south[end link] to the next room.  A preliminary peek in there shows a larger room there with only a few scattered items littering the floor.";


Chapter 3 - Bouncing Play Room

to say bcplayroom:
	now bcseenplayroom is true;
	say "     This room is a large, open room with a plenty of space for kids to bounce and play inside it.  It is very similar to the entrance room with its green floor, blue walls, red ceiling and yellow for the rounded columns that form the corners.  There's a small arched window on the east wall and two more on the west wall[if daytimer is day], letting in some light[otherwise].  Despite the late hour, the castle strangely seems lit, though you can find no light sources[end if].  There's a few toys and things scattered around this room, clearly from when the dolphin girls would frolic in here.  From the scent in the air, you can tell that the room's been used for more adult frolicing as well.";
	if lastsealfight - turns >= 4:
		if lastsealfight is 255:
			say "     Now that you're in the room, you do notice a bright yellow seal-shaped floating seat in the northwest corner.  It's fairly small and would only really be suitable for toddlers.  It has a drawn-on face with a friendly smile, blue eyes, black nose and cute whiskers and a pair of small handles at its shoulders.  As you look at it, it starts to stir, flapping its flippers and giving a squeaking bark.  'Play!' it squeaks, crawling forward to have fun with the newcomer.  As it moves, you spot a pointed penis inflating at its underside - clearly a new feature to this once innocent toy.";
		otherwise:
			say "     Looking over, you notice that the bright yellow seal has managed to reinflate itself and is looking towards you.  'Play?' it squeaks enquiringly before waddling forward on its flippers, clearly intent on again trying to play with you.";
		attempttowait;
		let weaponbonus be weapon damage of player / 3;
		let bonus be ( dexterity of player - 10 ) / 2;
		let dice be a random number from 1 to 20;
		say "     You roll 1d20([dice])+[bonus]+[weaponbonus]: [dice + bonus + weaponbonus] vs 14: ";
		if bonus + dice + weaponbonus is greater than 13:
			say "You manage to stay standing and take a few swings at the yellow seal, popping one of its seams and sending it flopping back into the corner as it deflates with a sad whine.  You can see the tear already starting to mend, though you don't expect it'll give you trouble for a little while.";
			now lastsealfight is turns;
		otherwise:
			now lastsealfight is turns;
			say "You try to knock the seal toy away with a few blows, but you are too unsteady on your feet and the small seat squirms between your legs, tripping you onto the soft floor.  Even as you're still swaying atop the yielding floor, the seal hops atop you pressing his hindquarters to your face.  You fumble to push him away, but are treated to a mouthful of his inflatable cock.  As he humps your face, you find yourself submitting to just let the lonely creature have his fun.  It starts to dribble a latex-like precum that becomes increasingly enjoyable and makes you all the more aroused and playful.";
			if cunts of player > 0:
				let baby be 0;
				if child is born or gestation of child is not 0, now baby is 1;
				say "     After humping your face for a while, the toy shuffles around and starts trying to nose your clothes and gear off as he nuzzles at your crotch.  Knowing what he's after and too overcome to resist it, you strip down and offer to let the cute seat ride you for a little while.  He hops up behind you and grips you lightly with his inflated flippers as his slick shaft slides into your juicy pussy.  You moan softly and push back, letting the little guy thrust into you until he cums with a happy squeak.  Spent from his orgasm, he starts to deflate somewhat and waddles back to the corner to rest and reinflate.[impregchance]";
				say "     You stretch out on the soft floor and decide to rest for a bit, feeling happy and bouyed by the experience, loosing track for a while of your intended mission.";
				if baby is 0 and gestation of child is not 0:
					now facename of child is "Seal Toy";
					now bodyname of child is "Seal Toy";
					now skinname of child is "Seal Toy";
				increase libido of player by 10;
				decrease humanity of player by 10;
				follow the turnpass rule;
			otherwise if "More Anal" is listed in feats of player and a random chance of 1 in 2 succeeds:
				let baby be 0;
				if child is born or gestation of child is not 0, now baby is 1;
				say "     After humping your face for a while, the toy shuffles around and starts trying to nose your clothes and gear off as he nuzzles at your rear.  Knowing what he's after and too overcome to resist it, you strip down and offer to let the cute seat ride you for a little while.  He hops up behind you and grips you lightly with his inflated flippers as his slick shaft slides into your tight bottom.  You moan softly and push back, letting the little guy thrust into you until he cums with a happy squeak.  Spent from his orgasm, he starts to deflate somewhat and waddles back to the corner to rest and reinflate.[mimpregchance]";
				say "     You stretch out on the soft floor and decide to rest for a bit, feeling happy and bouyed by the experience, loosing track for a while of your intended mission.";
				if baby is 0 and gestation of child is not 0:
					now facename of child is "Seal Toy";
					now bodyname of child is "Seal Toy";
					now skinname of child is "Seal Toy";
				increase libido of player by 10;
				decrease humanity of player by 10;
				follow the turnpass rule;
			otherwise:
				say "     You rub your hands over the cute toy's white underbelly, making it squeak happily.  As the strange blowjob continues, you become a more active participant, licking and sucking at the inflated prick stuffing your mouth as it leaks a latexy precum down your throat.  After a few more minutes of thrusting, he gives a happy squeak and thrusts into you one last time before unleashing spurts of gooey cum.  Spent from his orgasm, he starts to deflate somewhat and waddles back to the corner to rest and reinflate.";
				say "     You stretch out on the soft floor and decide to rest for a bit, feeling happy and bouyed by the experience, loosing track for a while of your intended mission.";
				increase libido of player by 10;
				decrease humanity of player by 8;
				follow the turnpass rule;
	otherwise:
		say "     Taking a quick glance to the northwest corner, you can see that the yellow seal is still partially deflated and isn't ready to try to play again, giving you a chance to continue undistracted.  At quick glance shows two kid-sized doorways leading out of here, one to the west and other to the north.  A quick glance through the hanging flaps between rooms shows the [link]north[end link] leads to the smaller room you saw earlier with the foam swords.  The door to the [link]west[end link] leads to a ball pit room as big as this play room.  You also notice a mesh climbing ladder at the back corner of the ball pit which heads up to the upper level.";


Chapter 4 - Ball Pit Room

to say bcballpitroom:
	say "     The ball pit room has a rounded, raised edge and seems sunk further into the floor, making it somewhat less springy under all those balls.  You are able to wade your way through them slowly to move around.  The room itself is fairly large, bigger than the entrance room, but having the same overall design.  There's two arch-shaped windows in the south wall and another on the west wall[if daytimer is day], letting in some light[otherwise].  Despite the late hour, the castle strangely seems lit, though you can find no light sources[end if].  In the southwest corner of the room, there is a large mesh ladder for the children to climb [link]up[end link] to the upper level of the bouncy castle.  There are also two doorways out of here, one to the [link]north[end link] leading to the smaller room with all the beach toys the dolphin girls have collected, and the other to the [link]east[end link] and a play room as large as this one.";


Chapter 5 - Toy Room

to say bctoyroom:
	say "     This side room has the same colour scheme as the adjoining entrance room with a green floor, blue walls and red ceiling.  In the corners there, are curved yellow sections to symbolize columns.  The room is quite cluttered with beach toys and pool toys scattered all around the room and even clumped into several piles.  There's a bit of everything in here, with pool noodles and paddle boards all over the place, plastic pails and buckets of all colours and beach balls everythere.  It looks like the dolphin girls have been storing any beach toys they've found in here.";
	if lastoctofight - turns >= 4:
		if lastoctofight is 255:
			say "     As you're looking around, some of the junk scattered here starts to shift and move.  Thinking at first it only the result of your weight shifting the floor, you try to tread more carefully.  But when the yellow tentacles start to appear from beneath the mess, you find yourself surrounded.  One large pile shifts and you see a grinning inflatable with a vapid expression of joy on its smooth, round face.  The inflatable octopus is sunshine yellow with amber along the underside of the inflated tentacles and on a few spots atop its head.  It shambles towards you as its curled tentacles try to wrap around you.";
		otherwise:
			say "     As you try to move around the room, the yellow octopus rouses itself and makes another grab at you with its sunshine yellow tentacles.  It grins at you with the same, unchanging expression of giggling happiness.";
		let bonus be ( strength of player - 10 ) / 2;
		let dice be a random number from 1 to 20;
		say "     You roll 1d20([dice])+[bonus]: [dice + bonus] vs 17: ";
		if bonus + dice is greater than 16:
			say "     The octopus inflatable wraps a few tentacles around you, but you manage to push them off and kick them away for the moment.  You have an opportunity to get away either by their heading further into the castle by heading [link]south (Y)[as]y[end link] or going to the [link]east (N)[as]n[end link] to return to the castle entrance.";
			if the player consents:
				move player to Ball Pit Room;
			otherwise:
				move player to Bouncy Castle;
		otherwise:
			say "     The octopus inflatable wraps a few tentacles around you and pulls you in towards it before you can push free.  It has a surprisingly strong grip for a creature made of thin plastic and air.  It reaches forward with two shorter tentacles and starts to grope and fondle you, drawing an involuntary moan out of you.  Soon it's many tentacles are roaming over your body, squeezing your [if breast size of player > 0]breasts and [end if] ass as it sends another tentacle between your legs.  While groping your [if cocks of player > 0]maleness[otherwise if cunts of player > 0]crotch[otherwise]bare crotch[end if], a few of its other tentacles divest you of your clothes and gear, dropping them among the scattered beach toys here[if cocks of player > 0].  It shuffles itself forward and climbs onto your stiff cock, sinking it into a surprisingly warm and wet hole, riding your erection.  Made to fuck the octopus toy's lubricated pussy, you eventually groan loudly as you cum hard into the wanton creature[end if][if cunts of player > 1].  While this is going on, the octopus plays with your pussies, resizing the ends of its tentacles to be a perfect fit for your dripping cunts.  It works eagerly, pushing you to orgasm and soak the rubbery floor in your juices[end if][if anallevel is not 1].  It also works a tentacle into your tight sphincter, pumping and rubbing inside you[end if].";
			say "     When it's finally finished with you a couple of hours[if cunts of player > 0 or cocks of player > 0] and several orgasms[end if] later, it drops you down onto the padded floor to recover and gather up your stuff[if lastoctofight is 255].  You do spot a can of soda half-buried among the beach toys near you and toss it into your pack before flopping on the floor to rest and catch your breath[end if].";
[			say "     The octopus inflatable wraps a few tentacles around you and pulls you in towards it before you can push free.  It has a surprisingly strong grip for a creature made of thin plastic and air.  It reaches out towards you with two shorter tentacles like some cartoony hentai monster.  Once you're within range, those two tentacles dive at your sides and it starts to tickle you with them.  At first, your surprise keeps you from laughing, but soon you're giggling in a mix of relief and its squirming appendages['] playful tickling.  You fall into laughing hysterics as the large pool toy continues to brush those rubber appendages across your sides.  You laugh and laugh, tears running down your face as it continues to play with you until you collapse, exhausted both physically and mentally.  The octopus shuffles back into the junk to lurk quietly, waiting to surprise the next dolphin girl to come along with a tickle attack.";
			if lastoctofight is 255:
				say "     You do spot a can of soda half-buried among the beach toys near you and toss it into your pack before flopping on the floor to rest and catch your breath.";		]
			now lastoctofight is turns;
			decrease humanity of player by 3;
			increase libido of player by 3;
			follow the turnpass rule;
	otherwise:
		say "     You glance over and notice the yellow octopus lurking among the junk, but it seems content to leave you alone for now.  You can see two child-sized doors out of here.  The one to the [link]east[end link] heads back to the entrance room you started in while the [link]southern[as]south[end link] one leads to a large ball pit in which you can see a mesh ladder to climb to the upper level.";


Chapter 6 - Parapets

to say bcparapets:
	say "[bcparapets_new]";

to say bcparapets_old:
	say "     Up at the top level of the castle, this room is designed to look like it's parapets.  There floor and walls here are sky blue, as are the towers rising up to enclose the room between mesh netting to keep excited children from falling.  This netting extends above you as well, enclosing the space for safety.  This section covers western half of the bouncy castle with a wall dividing the two parts and another arched doorway between them.  The floor, while springy and swaying, seems just as solid as those below despite being the inflatable ceiling to the area below.";
	if lastorcafight is 255:
		say "     You are not alone up here.  There is a large, inflatable orca toy.  It is very round and bigger than the dolphin toys you've seen, being over two yards in from end to end and big enough for an adult to use.  The black and white inflatable bobs up in to the air and rolls over a few times with a trilling noise before charging towards you to bump you with its nose.  The blow doesn't really hurt much, but makes you stumble back on the rocking, swaying floor.  It seems intent on playfully bumping you back down the hole you climbed up to get here.";
		now lastorcafight is turns;
	otherwise:
		say "     You find yourself facing off with the inflatable orca again as it trills happily to play its odd game of king of the castle.  It rolls around in the air once, then floats forward to try and bump you again.";
	let bonus be ( dexterity of player - 10 ) / 2;
	let dice be a random number from 1 to 20;
	say "     You roll 1d20([dice])+[bonus] + [3 - scalevalue of player]: [dice + bonus + 3 - scalevalue of player] vs 16: ";
	if bonus + dice + 6 - scalevalue of player is greater than 15:
		say "     You manage to weave in one direction and then push off in the other, dodging another charge from the orca which would have knocked you roughly down the hole.  You have a quick moment to decide which direction you'd like to go.  [link]East (Y)[as]y[end link] to the other half of the upper level or to climb [link]back down (N)[as]n[end link] to the first level.";
		if the player consents:
			say "     You move quickly over to the wall and move through the archway into the other room.  The archway seems too large for the big orca toy, making you briefly wonder if it was deflated to bring in here.";
			move player to Slide Room;
		otherwise:
			say "     You move quickly to the hole and grab onto the netting to safely climb down before the orca can instead send you tumbling down there.";
			move player to Ball Pit Room;
	otherwise:
		say "     You try to dodge, but the unsure footing [if scalevalue of player > 3]and your large size make[otherwise]makes[end if] you an easy target and you're bumped back and sent tumbling down into the ball room.  You are left a little dizzy and confused from your tumble, but seem otherwise unharmed.";
		decrease humanity of player by 5;
		if humanity of player < 10:
			say "That last tumble knocks something loose in your already shaken mind and the last threads of your humanity snap.";
			end the game saying "Your brain (shaken, not stirred) gave into the infection.";
		otherwise:
			move player to Ball Pit Room;


to say bcparapets_new:
	let compnumber be the number of entries in childrenfaces;
	if companion of player is not nullpet, increase compnumber by 1;
	say "     Up at the top level of the castle, this room is designed to look like it's parapets.  There floor and walls here are sky blue, as are the towers rising up to enclose the room between mesh netting to keep excited children from falling.  This netting extends above you as well, enclosing the space for safety.  This section covers western half of the bouncy castle with a wall dividing the two parts and another arched doorway between them.  The floor is covered in a regular pattern of large, red dots and, while springy and swaying, seems just as solid as those below despite being the inflatable ceiling to the area below.";
	if lastbcchair is 255:
		say "     Seeing a clear path to the next room and no reason to risk staying here and getting spotted, you move quickly towards the archway.  You take a few steps, but as you're approaching the center of the room, you feel the floor give way suddenly.  For a moment, you imagine the inflatable castle to be unable to support your weight, but a quick glance down shows your feet have sunk into two of the red spots[if compnumber > 1].  A noise behind you alerts you to the fact that your companions are being ensnared by bands of material growing from the mesh walls[otherwise if compnumber is 1].  A noise behind you alerts you to the fact that your companion is being ensnared by the bands of material growing from the mesh walls[otherwise].  You try to lift your feet out[end if], but the unsteady footing sends you falling forwards[if compnumber > 0] as you turn to look[end if][if weapon object of player is not journal], dropping your weapon in the process[end if].  Shall you try to [link]resist (Y)[as]y[end link] this bizarre trap or shall you relax and [link]accept (N)[as]n[end link] whatever my come?";
		now lastbcchair is turns;
		if the player consents:
			say "[bcchairfight]";
		otherwise:
			say "[bcchairsubmit]";
	otherwise if lastbcchair - turns >= 4:
		let playernum be a random number between 1 and dexterity of player;
		let chairnum be 15;
		if hardmode is true, increase chairnum by ( level of player / 4 );
		let chairnum be a random number between 1 and chairnum;
		if playernum >= chairnum:
			say "     You take care as you navigate the room, planning to avoid the red spots in the hopes of not activating the chair again.  But you are suddenly surprised as one of the spots slides across the floor, almost getting under your foot before you can hop to avoid it.  You take your last few steps quickly before the floor has the chance to put another spot underfoot.  Shall you head [link]east (Y)[as]y[end link] to the slide room or [link]down (N)[as]n[end link] into the ball room?";
			if the player consents:
				move player to Slide Room;
			otherwise:
				move player to Ball Pit Room;
		otherwise:
			say "     You take care as you navigate the room, planning to avoid the red spots in the hopes of not activating the chair again.  But you are suddenly surprised as one of the spots slides across the floor, moving quickly under your foot as you're bringing it down.  Your foot sinks into the flesh-like hole that forms and your other foot is similarly caught moments later[if compnumber > 1].  Nearby, you can hear your companions struggling against bands of material growing out of the mesh safety walls[otherwise if compnumber is 1].  Nearby, you can hear your companions struggling against bands of material growing out of the mesh safety walls[end if][if weapon object of player is journal]You end up dropping your [weapon object of player] when the spots shift quickly back to their original positions and you're sent tumbling forwards.  Shall you attempt to struggle against the sex chair again?";
			now lastbcchair is turns;
			if the player consents:
				say "[bcchairfight]";
			otherwise:
				say "[bcchairsubmit]";
	otherwise:
		say "     You take care as you navigate the room, stepping to avoid the red spots in the hopes of not activating the chair again.  You don't dare linger here given the fiendish traps hiding here.  Shall you head [link]east (Y)[as]y[end link] to the slide room or [link]down (N)[as]n[end link] into the ball room?";
		if the player consents:
			move player to Slide Room;
		otherwise:
			move player to Ball Pit Room;
		

to say bcchairfight:
	let compnumber be ( number of entries in childrenfaces / 3 );
	if companion of player is not nullpet, increase compnumber by 1;
	let bcchairescape be 0;
	let x be a random number between 1 and 3;
	if x is 1:				[dexterity]
		let playernum be a random number between 1 and dexterity of player;
		let chairnum be 15;
		if hardmode is true, increase chairnum by ( level of player / 4 );
		let chairnum be a random number between 1 and chairnum;
[		say "Dex: Playernum: [playernum] vs Chairnum: [chairnum]";]
		if playernum >= chairnum:
			increase bcchairescape by 1;
[			say " [special-style-1]Success[roman type].";]
			say "     As your precarious position sends you tumbling forward, you manage to keep your hands from landing on more red spots by wrenching your back painfully.  Checking your feet, you find them firmly trapped by a flesh-like orifice made from the same latex-vinyl material as the rest of this place.  It inflates into a pink tube that climbs up your ankles.  With your added leverage, you try to pull your legs free, feeling them get looser before one of your hands slips and is sucked into another red spot.  As you turn to look at it, your other hand is pulled in as well.  The spots gripping them start to inflate as well, as does the material beneath you, forming into a padded blue seat.  Even as you try to squirm your limbs free, your head gets envelopped in a hood of thick rubber, blocking your vision and restraining you further.";
		otherwise:
[			say " [special-style-2]Fail[roman type].";]
			say "     With your precarious position sending you tumbling forward, you try to land safely, but one of your hands ends up just inside one of the red spots.  It sinks into it as a flesh-like orifice made from the same latex-vinyl material as the rest of this place is formed.  You try to pull it out, your free hand slips and ends up trapped as well as you notice the material at your feet inflating upwards into a pink tube the climbs up your ankles.  The those at your hands begin to inflate as well, the material beneath you starts to swell up, forming into a padded blue seat.  Even as you try to squirm your limbs free, your head gets envelopped in a hood of thick rubber, blocking your vision and restraining you further.";
	otherwise if x is 2:		[strength]
		let playernum be a random number between 1 and strength of player;
		let chairnum be 17;
		if hardmode is true, increase chairnum by ( level of player / 4 );
		let chairnum be a random number between 1 and chairnum;
[		say "Str: Playernum: [playernum] vs Chairnum: [chairnum]";]
		if playernum >= chairnum:
			increase bcchairescape by 1;
[			say " [special-style-1]Success[roman type].";]
			say "     Your hands land on the rubbery floor and are similarly trapped by red spots.  They, like your feet, are caught in flesh-like orifices made from the same latex-vinyl material as the rest of this place.  Not wanting to wait around and see what it has in mind for you, you fight to pull yourself free.  It has a surprisingly strong grip, but you keep fighting even as the red spots start to swell and inflate, forming pink tubes that climb up your ankles and wrists.  As this is happening, the section beneath you starts to bulge up, inflating into a padded blue seat.  Using this for what little leverage it provides you pull harder on your limbs, feeling the grip give partially.  But as you're doing so, your head gets envelopped in a hood of thick rubber, blocking your vision and restraining you further.";
		otherwise:			[perception]
[			say " [special-style-2]Fail[roman type].";]
			say "     Your hands land on the rubbery floor and are similarly trapped by red spots.  They, like your feet, are caught in flesh-like orifices made from the same latex-vinyl material as the rest of this place.  Not wanting to wait around and see what it has in mind for you, you fight to pull yourself free.  It has a surprisingly strong grip and are unable to get the leverage you need to do any good.  As the red spots start to swell and inflate, they form pink tubes that climb up your ankles and wrists.  As this is happening, the section beneath you starts to bulge up, inflating into a padded blue seat.  Using this for what little leverage it provides you pull harder on your limbs, feeling the grip give partially.  But as you're doing so, your head gets envelopped in a hood of thick rubber, blocking your vision and restraining you further.";
	otherwise if x is 3:
		let playernum be a random number between 1 and perception of player;
		let chairnum be 18;
		if hardmode is true, increase chairnum by ( level of player / 4 );
		let chairnum be a random number between 1 and chairnum;
[		say "Per: Playernum: [playernum] vs Chairnum: [chairnum]";]
		if playernum >= chairnum:
			increase bcchairescape by 1;
[			say " [special-style-1]Success[roman type].";]
			say "     Your hands land on the rubbery floor and are similarly trapped by red spots, but you are already looking around the room in search of a means to get yourself out of this mess, struggling the whole time[if weapon object is not journal].  Your weapon's fallen out of your reach even if you had a hand free to hold it[end if][if compnumber > 1] and your increasingly bound allies will not be able to assist you either[otherwise] and your increasingly bound ally will not be able to assist you either[end if].  Glancing back at your dilemma, you see that the red spots have started to swell up into pink tube-like protrusions with orifices make of latex-vinyl [']flesh['] with a strong grip on you.  As the material beneath you starts to inflate into a padded blue seat, you continue to search for a means of espace.  This means, when this strange chair starts to form a mask to envelop your face, your head is out of position.  This buys you more time to struggle and, while its focus in on capturing your head, the grip on your limbs loosens slightly.";
		otherwise:
[			say " [special-style-2]Fail[roman type].";]
			say "     Your hands land on the rubbery floor and your attention is fixed on watching their capture.  The red spots seems to morph and form into flesh-like orifices seamlessly.  They are made of the same latex-vinyl material as the rest of this place.  The red colour fades to pink as they start to inflate, swelling up into tubes that creep slowly up your wrists and ankles trapping you further.  After going up a couple of inches, the material beneath you begins to bulge upwards, forming into a blue, padded seat.  This strange chair bulges up and lifts you up off the floor, your trapped hands and feet held by the tubes attached seamlessly into it.  And then a hood of latex material flows over your head, cutting you off from seeing any more.";
	say "     The bubble over your head begins to pump in a thick gas that makes you feel light-headed and aroused, as well as increasing the pleasure you feel from the smooth vinyl rubbing against your [bodytype of player] body.  Breathing in the aphrodisiac, you can't help but become aroused as the motion of the strange chair increases[if cocks of player > 1].  Your stiffening cocks slide into slick orifices which form in the seat beneath you.  These squeeze and milk at your erections, increasing your pleasure and making it harder to stay focused on escape[otherwise if cocks of player is 1].  Your stiffening cock slides into a slick orifice which form in the seat beneath you.  This squeezes and milks at your erection, increasing your pleasure and making it harder to stay focused on escape[end if][if cunts of player > 1].  You feel some of the rubbery material bulge up and push its way into your damp pussies.  These inflate slowly, filling you with pulsing dildos that shiver delightfully inside you from the chair's vibrations[otherwise if cunts of player is 1].  You feel some of the rubbery material bulge up and push its way into your damp pussy.  This inflates slowly, filling you with a pulsing dildo that shiver delightfully inside you from the chair's vibrations[end if][if cocks of player is 0 and cunts of player is 0].  The chair's material probes at your bare groin and, finding no genitals, forms rippling protrusions which stroke and rub against your flat crotch, sending soft shivers of delight through you[end if].";
	attempttowait;
	let playernum be ( 150 + humanity of player - libido of player + ( level of player * 2 ) );
	let playernum be a random number between 1 and playernum;
	let chairnum be 175;
	if hardmode is true, increase chairnum by level of player;
	let chairnum be a random number between 1 and chairnum;
[	say "Libido: Playernum: [playernum] vs Chairnum: [chairnum]";]
	if playernum >= chairnum:
		increase bcchairescape by 1;
[		say " [special-style-1]Success[roman type].";]
		say "     Keeping your goal of escape in mind, you continue to struggle as the chair seeks to pleasure you.  You can't help but become aroused and respond to the stimulation with moans of pleasure, but quickly close your mouth as a protrusion tries to swell past your lips.  Eventually you are made to relent as the stimulation you're subjected to increases and it forms into a decidedly phallic shape to stuff your mouth and throat.  During this distraction, it inadvertently weakens the grip on your limbs enough for you to make some more progress towards escape.";
	otherwise:
[		say " [special-style-2]Fail[roman type].";]
		say "     You try to keep your goal of escape in mind, but as the pleasure increases, your struggling diminishes.  The pleasure you're feeling from the chair distracts your lust-addled mind and you respond to the stimulation with moans of pleasure.  As a protrusion swells up in the mask, it slides into your mouth with a decidedly phallic shape to stuff your mouth and throat.";
	if bcchairescape < 2:
		say "     The sex chair stimulates you without stop - it's motion against you, the feel of its [if cunts of player > 0]prodes[otherwise]probe[end if] throbbing inside you[if cocks of player > 0], those gripping holes around your maleness[end if] - all work without tire to pleasure you[if cocks of player > 0].  Your man meat pulses and throbs as the rubbery flesh squeezes and milks at you until you finally cum hard.  You groan around that phallic protrusion in your mouth as your balls are drained and the pleasure of orgasm overtakes you[end if][if cunts of player > 0].  Those throbbing probes inside you inflate to fill you to your limits and even a little further each time they pulse inside you, sendings waves of delight through you.  You soak them and seat beneath you with your juices as you climax[end if][if cunts of player is 0 and cocks of player is 0].  Your body is rubbed and rocked against the seat beneath you, the smooth surface sliding wonderfully against your body while those stimulating bumps send shivers through your bare groin, making you cry out in delight[end if].  You pant and sag down atop the seat as the pleasure of your afterglow fills you.";
		say "     The chair's motion slows and your mind becomes further clouded as the gas continues to sap your will to resist such a delight as this.  But when you notice the tubes resuming their climb up your limbs and can feel the vinyl material sliding up over your waist and over your ass, you stir yourself back into activity.  Clearly this thing is not going to be content with using you just once but seems quite intent on keeping you.";
		attempttowait;
		let x be a random number between 1 and 3;
		if x is 1:				[intelligence]
			let playernum be a random number between 1 and intelligence of player;
			let chairnum be 15;
			if hardmode is true, increase chairnum by ( level of player / 4 );
			let chairnum be a random number between 1 and chairnum;
[			say "Int: Playernum: [playernum] vs Chairnum: [chairnum]";]
			if playernum >= chairnum:
				increase bcchairescape by 1;
[				say " [special-style-1]Success[roman type].";]
				say "     As you try to pull yourself free, you notice that the grip on your other limbs loosens as one of the other tubes is inflated further.  Following this pattern, you throw your effort into working the one opposite the current growth out, shifting from one to the next as the inflation continues, pulling yourself closer to freedom";
			otherwise:
[				say " [special-style-2]Fail[roman type].";]
				say "     As you struggle, you try to wrack your brain to find a way out of your predicament, but your recent orgasm and the gas have left you too muddle-headed to think straight.  Soon you're pulling and squirming randomly, which only ends up arousing you further as you grind against the seat";
		otherwise if x is 2:		[dexterity]
			let playernum be a random number between 1 and dexterity of player;
			let chairnum be 17;
			if hardmode is true, increase chairnum by ( level of player / 4 );
			let chairnum be a random number between 1 and chairnum;
[			say "Dex: Playernum: [playernum] vs Chairnum: [chairnum]";]
			if playernum >= chairnum:
				increase bcchairescape by 1;
[				say " [special-style-1]Success[roman type].";]
				say "     Noticing the swaying of the seat as the waves rock the castle, you work to time your movements with the motion caused by the waves rocking the place.  The water is a little choppy here around the rocks, so it is difficult to follow the pattern, but you stay focused and try to block out the added stimulation this added motion gives and you can feel the chair, as if distracted by the sudden added stimulus, having trouble gripping your limbs as it tries to continue enveloping you";
			otherwise:
[				say " [special-style-2]Fail[roman type].";]
				say "     Getting the idea to try and use the chair's own motion against it, you try moving in tandem with it to pull harder for freedom.  You try your best to follow the pattern, but the pleasure of the movement on your already aroused body proves too distracting for you to hold a proper rhythm and all you end up doing it arousing yourself further against all the features seeking to stimulate you";
		otherwise:				[strength]
			let playernum be a random number between 1 and strength of player;
			let chairnum be 18;
			if hardmode is true, increase chairnum by ( level of player / 4 );
			let chairnum be a random number between 1 and chairnum;
[			say "Str: Playernum: [playernum] vs Chairnum: [chairnum]";]
			if playernum >= chairnum:
				increase bcchairescape by 1;
[				say " [special-style-1]Success[roman type].";]
				say "     Your recent orgasm has left you feeling drained and weak, but you summon up your remaining strength with a surge of adrenaline and do your best to fight against those growing tubes climbing up your limbs.  Busy with inflating itself further, the sudden burst of strength helps you regain some more freedom of movement";
			otherwise:
[				say " [special-style-2]Fail[roman type].";]
				say "     You try to summon up your strength to keep fighting, but your recent orgasm has left you feeling drained and weak.  You continue to struggle, but can make little headway against the inexorable grip of the chair";
		if bcchairescape < 2:
			say ".  Unable to get free, the chair's vinyl tubes climb further up your limbs, now having your forearms and lower legs completely enclosed.  The material around your lower body grips your tighter, pulling you down into the seat[if anallevel is not 1] as it presses a swelling bulge against your anus.  With it tightly gripping your lower half, your struggles are in vain as your pucker is spread open a swelling, cock-like bulge inflates inside you, causing you to moan.  With this new anchor-point stuffed inside you[otherwise].  With you further restrained by the material wrapped around your hips[end if], its motion starts up again in earnest again, sending fresh waves of pleasure as another blast of the aphrodisiac gas fills your lungs.";
			attempttowait;
			let playernum be ( 150 + humanity of player - libido of player + ( level of player * 2 ) );
			let playernum be a random number between 1 and playernum;
			let chairnum be 175;
			if hardmode is true, increase chairnum by level of player;
			let chairnum be a random number between 1 and chairnum;
[			say "Libido: Playernum: [playernum] vs Chairnum: [chairnum]";]
			if playernum >= chairnum:
				now bcchairescape is 2;
[				say " [special-style-1]Success[roman type].";]
				say "     With the grip on your limbs too strong now to simply break free, your sex-addled mind can see no other alternative but to give the strange chair exactly what it wants and more.  Hoping to overload it with pleasure, you throw yourself into riding it as long and as hard as you can.  You move yourself with the chair's rocking motion, pushing yourself [if cunts of player > 0 or anallevel is not 1]onto those wonderfully thrusting dildos it had stuffed inside you[otherwise]to lick and suck at that throbbing projection stuffed into your mouth[end if][if cocks of player > 1].  You drive your cocks into those gripping holes of its, nearly losing yourself in the pleasure of fucking those slick, squeezing orifices[otherwise if cocks of player is 1].  You drive your cock into that gripping hole of its, nearly losing yourself in the pleasure of fucking that slick, squeezing orifice[end if][if cunts of player > 0].  You squeeze with your thighs, tightening your inner muscles around the rubbery flesh stuffed inside you, taking delight in the pulsing probes filling you so wonderfully[end if][if anallevel is not 1].  You even squeeze down on the inflating butt plug inside you, the feel of it swelling deeper as it slides along your silky inner walls feeling great to your lust-clouded body[end if].";
				say "     You try your best to hold back as long as you can, constantly reminding yourself your need to escape.  When your climax finally comes[if cocks of player > 0] and you pump your hot seed into the sex chair[end if], your cries are muffled by the thick rod stuffed into your mouth[if cunts of player > 1].  Your cunts clamp down around the throbbing dildos inside you as you release another flow of your hot juices over them, soaking yourself and the seat[otherwise if cunts of player is 1].  Your cunt clamps down around the throbbing dildo inside you as you release another flow of your hot juices over them, soaking yourself and the seat[end if].  Through all this, you barely manage to keep your mind on track.  With thoughts of escape returning, you resume your struggles as your powerful climax comes to an end.  As you'd hoped, the chair's grip on your has relaxed.  Whether you believe it merely thinks you complacent and accepting now or that it has somehow been momentarily overloaded by your powerful release doesn't matter, only that you must seize this window of opportunity.";
			otherwise:
[				say " [special-style-2]Fail[roman type].";]
				say "     With the grip on your limbs too strong now to simply break free, your sex-addled mind to throw itself into the pursuit of pleasure in the hopes of satisfying this strange chair's needs or overloading it.  You begin to ride it, telling yourself that nothing stops you from enjoying this ride as well.  You move yourself with the chair's rocking motion as best you can, pushing yourself [if cunts of player > 0 or anallevel is not 1]onto those wonderfully thrusting dildos it had stuffed inside you[otherwise]against it while licking and sucking lustfully at that throbbing projection stuffed into your mouth[end if][if cocks of player > 1].  You pound your cocks into those gripping holes of its, losing yourself in the pleasure of fucking those slick, squeezing orifices for all they're worth[otherwise if cocks of player is 1].  You pound your cock into that gripping hole of its, losing yourself in the pleasure of fucking that slick, squeezing orifice for all its worth[end if][if cunts of player > 0].  You squeeze with your thighs, tightening your inner muscles around the rubbery flesh stuffed inside you, taking delight in the pulsing probes filling you so wonderfully[end if][if anallevel is not 1].  You eagerly squeeze down on the inflating butt plug inside you, the feel of it swelling deeper as it slides along your silky inner walls feeling great to your lust-clouded body[end if].";
				say "     You push yourself to further heights, your sex-crazed mind only seeking another release, your thoughts of escape momentarily forgotten.  When your climax finally comes[if cocks of player > 0] and you pump your hot seed into the sex chair[end if], your cries are muffled by the thick rod stuffed into your mouth[if cunts of player > 1].  Your cunts clamp down around the throbbing dildos inside you as you release another flow of your hot juices over them, soaking yourself and the seat[otherwise if cunts of player is 1].  Your cunt clamps down around the throbbing dildo inside you as you release another flow of your hot juices over them, soaking yourself and the seat[end if].  Once spent, you collapse onto the seat, basking in the powerful afterglow and breathing in more of that arousing gas as you pant for breath.";
				say "     By the time the haze lifts, you realize that the chair has recovered and is resuming to engulf you.  The tubes have continued to climb up your arms and legs.  They join up with the other material from the seat itself, starting to seal you in seemlessly.  The vinyl flows up across your back and melds with the hood, encapsulating you fully.  While it is hard to tell from within your latex prison, you get the feeling that you're sinking.  Realizing that the chair pod, and you with it, is being drawn into the castle itself, you push yourself to continue struggling.";
				attempttowait;
				let x be a random number between 1 and 3;
				if x is 1:			[libido]
					say "     Desperate, you decide to give your plan another attempt, trying your best to maintain your focus as you rock and push your body against the stimulating chair's surface[if cocks of player > 0 and cunts of player > 0], holes and probes[otherwise if cocks of player > 0] and holes[otherwise if cunts of player > 0] and probes[end if].  The motion pauses while you ride it to another orgasm that sends waves of pleasure through you.  You have difficulty focusing after your mind-numbing climax, but the chair suffers no pause, now familiar with how much pleasure you can provide and fully able to take it all in.  It resumes sinking and even starts up again, getting you aroused for another go right away.";
				otherwise if x is 2:	[strength]
					say "     You try to fight your way free, but with you fully bound and encapsulated, as well as worn out from your orgasms and struggling, you cannot muster the might to pull yourself free.  Even as the chair continues to sink, the gas continues to make thought difficulty, only your growing arousal starting to matter as the chair starts up again, getting you worked up for another go right away.";
				otherwise::			[intelligence]
					say "     You struggle to figure a way out of your predicamment, but your mind is too foggy from the gas and your powerful afterglow, making thought too difficult now.  You try to pull, push and squeeze, but with the pod fully formed around you and your limbs all tightly held, there seems to be no way out of it.  Even as the chair continues to sink, the gas gets you aroused again and the chair starts up again, preparing you for another go right away.";
				say "     Even as your mind sinks away, fading away beneath the gas that keeps you constantly aroused, so does the pod encapsulating you fade back into the floor.  Slick liquid flows in around you and your gear is either dissolved or expelled from the pod, leaving you naked and able to enjoy smooth stimulation over every square inch of your body.  You give into the pleasure, succumbing as a mindless prisoner of lust as you enjoy orgasm after orgasm in the hidden safety of your new home.";
				now bcending is 1;
				now bodyname of player is "Captured";
				now facename of player is "Captured";
				now skinname of player is "Captured";
				now tailname of player is "Captured";
				now cockname of player is "Captured";
				now humanity of player is 0;
				end the game saying "You are imprisoned by the Bouncy Castle.";
		otherwise:
			say ".  As you continue fighting, you can feel the sex chair's grip on you loosen and you pull hard to get free.";  
	if bcchairescape is 2:
		say "     Your effort finally pays off as you're able to pull your [one of]left[or]right[purely at random] arm free.  You grab the back of the mask and pull it from your face, popping the thick, rubbery phallus from your mouth.  Gasping in the fresh sea air, your head starts to clear and you turn your focus to getting out of this trap.  Grabbing the inflated tube around your other hand, you squeeze it firmly, partially deflating it.  When you release it, it is looser momentarily, allowing you to pull your arm free.  You do the same for your legs and push yourself off the seat before it can devise some new means to hold you[if cocks of player > 0 or cunts of player > 0].  There is a wet, slick sound as you pull your groin free of the sticky seat and its stimulating devices[end if][if compnumber > 1].  You quickly rush over and assist your companions, who have been making headway in freeing themselves thanks to the distraction your escape has caused and finish pulling them free[end if][if weapon object of player is not journal].  Moving quickly, you grab your weapon and consider your possible exits from the room.";
		say "     A quick glances shows none of the red spots located in the next room.  Shall you [link]east (Y)[as]y[end link] into it or head back [link]downstairs (N)[as]n[end link] into the relative safety of the room below?";
		if the player consents:
			say "     Stepping carefully, you move around the deflating sex chair and avoid the other red spots in case this castle had more surprises.  You head to the separating wall and move through the archway into the other room.";
			move player to Slide Room;
			follow the turnpass rule;
		otherwise:
			say "     You move quickly to the hole and grab onto the netting to safely climb down before this room can try anything else.";
			move player to Ball Pit Room;
			follow the turnpass rule;


to say bcchairsubmit:
	say "     You don't resist and let yourself fall forward, your hands landing squarely on two more large red spots.  This transform immediately into flesh-like orifices make of the same latex-vinyl material as everything else here and your hands sink into them.  You watch as the red spots start to inflate, stretching upwards into pink tubes that pleasantly squeeze and grip around your arms and legs as they climb up a few inches.  Beneath you, the blue material starts to inflate into a large, padded seat.  With this support beneath you, you rub yourself onto it.  You are momentarily concerned as a sheet of it flows up over your head covering your face in a mask, but the gas it releases causes your worries to fade as its aphrodisiac qualities kick in, getting your instantly aroused.";
	say "     As the thick gas that makes you feel light-headed and aroused, it also increases the pleasure you feel from the smooth vinyl rubbing against your [bodytype of player] body.  Breathing in the aphrodisiac, you can't help but become aroused as the motion of the strange chair increases[if cocks of player > 1].  Your stiffening cocks slide into slick orifices which form in the seat beneath you.  These squeeze and milk at your erections, increasing your pleasure and making it harder to stay focused on escape[otherwise if cocks of player is 1].  Your stiffening cock slides into a slick orifice which form in the seat beneath you.  This squeezes and milks at your erection, increasing your pleasure and making it harder to stay focused on escape[end if][if cunts of player > 1].  You feel some of the rubbery material bulge up and push its way into your damp pussies.  These inflate slowly, filling you with pulsing dildos that shiver delightfully inside you from the chair's vibrations[otherwise if cunts of player is 1].  You feel some of the rubbery material bulge up and push its way into your damp pussy.  This inflates slowly, filling you with a pulsing dildo that shiver delightfully inside you from the chair's vibrations[end if][if cocks of player is 0 and cunts of player is 0].  The chair's material probes at your bare groin and, finding no genitals, forms rippling protrusions which stroke and rub against your flat crotch, sending soft shivers of delight through you[end if].  Taking all these pleasures the chair has to offer, you grind yourself down atop it, moaning happily.";
	attempttowait;
	say "     Making no attempt to resist the pleasures the chair brings, you become quite aroused and respond to the stimulation with moans of pleasure.  As a protrusion swells up in the mask, it slides into your mouth with a decidedly phallic shape to stuff your mouth and throat.  You lick and suck at this, eager to show the chair how much you appreciate the wonderful delight it's bringing you.";
	say "     The sex chair stimulates you without stop - it's motion against you, the feel of its [if cunts of player > 0]prodes[otherwise]probe[end if] throbbing inside you[if cocks of player > 0], those gripping holes around your maleness[end if] - all work without tire to pleasure you[if cocks of player > 0].  Your man meat pulses and throbs as the rubbery flesh squeezes and milks at you until you finally cum hard.  You groan around that phallic protrusion in your mouth as your balls are drained and the pleasure of orgasm overtakes you[end if][if cunts of player > 0].  Those throbbing probes inside you inflate to fill you to your limits and even a little further each time they pulse inside you, sendings waves of delight through you.  You soak them and seat beneath you with your juices as you climax[end if][if cunts of player is 0 and cocks of player is 0].  Your body is rubbed and rocked against the seat beneath you, the smooth surface sliding wonderfully against your body while those stimulating bumps send shivers through your bare groin, making you cry out in delight[end if].  You pant and sag down atop the seat as the pleasure of your afterglow fills you.";
	attempttowait;
	say "     The chair's motion slows and your mind becomes further clouded as you continue to breath in that wonderfully euphoric gas.  Noticing the tubes continuing to inflate and rise up your arms, you wait patiently, letting the chair continue to grow up your limbs, contenting yourself for the moment with licking and sucking at the dildo tube in your mouth.  Sensing your compliance, the chair continues to envelop you, flowing up over your arms and legs to fully encase them.  It also forms a snug enclosure around your body, flowing up over your hips and back.  This eventually joins in with the mask over your head and the fully grown tubes covering your limbs, sealing you in fully[if anallevel is not 1].  Feeling a light pressure at your ass, you relax your anal ring, allowing another delightful probe to push into your backside, stuffing that hole as well[end if].";
	say "     You start to rub and grind yourself against the seat for further stimulation, setting the strange sex chair into motion again, building you up towards another climax even as you can feel it slowly sinking down into the floor, taking you with it.  Your sex-addled mind does not care at this point, willingly enjoying this strange capsule's delights and accepting whatever it may wish to do with you.  You move yourself with the chair's rocking motion as best you can, pushing yourself [if cunts of player > 0 or anallevel is not 1]onto those wonderfully thrusting dildos it had stuffed inside you[otherwise]against it while licking and sucking lustfully at that throbbing projection stuffed into your mouth[end if][if cocks of player > 1].  You pound your cocks into those gripping holes of its, losing yourself in the pleasure of fucking those slick, squeezing orifices for all they're worth[otherwise if cocks of player is 1].  You pound your cock into that gripping hole of its, losing yourself in the pleasure of fucking that slick, squeezing orifice for all its worth[end if][if cunts of player > 0].  You squeeze with your thighs, tightening your inner muscles around the rubbery flesh stuffed inside you, taking delight in the pulsing probes filling you so wonderfully[end if][if anallevel is not 1].  You eagerly squeeze down on the inflating butt plug inside you, the feel of it swelling deeper as it slides along your silky inner walls feeling great to your lust-clouded body[end if].";
	attempttowait;
	say "     You push yourself to further heights, your sex-crazed mind only seeking another release and more pleasure.  When your climax finally comes[if cocks of player > 0] and you pump your hot seed into the sex chair[end if], your cries are muffled by the thick rod stuffed into your mouth[if cunts of player > 1].  Your cunts clamp down around the throbbing dildos inside you as you release another flow of your hot juices over them, soaking yourself and the seat[otherwise if cunts of player is 1].  Your cunt clamps down around the throbbing dildo inside you as you release another flow of your hot juices over them, soaking yourself and the seat[end if].  Once spent, you collapse onto the seat, basking in the powerful afterglow and breathing in more of that arousing gas as you pant for breath.  Even as your mind sinks away, fading away beneath the gas that keeps you constantly aroused, so does the pod encapsulating you fade back into the floor.  Slick liquid flows in around you and your gear is either dissolved or expelled from the pod, leaving you naked and able to enjoy smooth stimulation over every square inch of your body.  You give into the pleasure, giving yourself over to become a part of this wonderful castle and to the wonderful delights your new home can give.";
				now bcending is 2;
				now bodyname of player is "Captured";
				now facename of player is "Captured";
				now skinname of player is "Captured";
				now tailname of player is "Captured";
				now cockname of player is "Captured";
				now humanity of player is 0;
				end the game saying "You become part of the Bouncy Castle.";


Chapter 7 - Slide Room

to say bcslideroom:
	say "     The second half of the bouncy castle's upper level has the same bright, colourful walls on three sides.  The eastern wall and the ceiling are made with open mesh across parapets and towers like the previous room.  Unlike that one, there is a gap in the mesh wall to allow access to the blue waterslide down into the sea below.  There is a constant flow of water and even some sprinklers running on the way down despite the lack of any motor or pump you could hear anywhere in the castle to keep it inflated or to send water up here.  If you want to leave the castle and head back to shore, you can [link]take the slide[end link].  Alternatively, there's also the doorway to the [link]west[end link] to the parapets.";
	say "     Despite the bright colours and soft, rounded shapes of this place, you cannot help but be disturbed.  For while the bouncy castle looks fun and safe enough as a kiddy play area, it is the contents of this room which draw your eyes.  You came hoping to find the captured vixen in her inflatable dolphin prison, but instead find a dozen of the inflatable dolphin suits hanging along the walls.";
	say "     As you try to remain standing, the dolphins on the wall seem to shift about, perhaps from the feeble struggles of their occupants or from the simple swaying brought on by the waves.  You look over the inflated dolphin suits, trying to decide which to search first, as these are more opaque than the ones you've seen on the beach.  Since they're all inflated and full, you can't tell for certain which may hold the vixen you seek, or if they hold anyone at all.";
	say "     There are a dozen inflated dolphins like the one you saw the vixen being stuffed into.  You will have to start checking them if you want to find her.  (Type [link]check dolphin[as]dolchecklist[end link] followed by the number you'd like to check out.)[line break]";


Part 1 - Sliding

understand "take slide" and "take the slide" and "use slide" and "use the slide" as sliding.

sliding is an action applying to nothing.

check sliding:
	if location of player is not Slide Room:
		say "There is no slide here.";

carry out sliding:
	say "     You slide down the castle's waterslide, feeling a small rush of glee as you do so beyond just getting away from the strange set of dolphin suits.  Coming off the inflatable slide, you splash into the water and move to make your way back to shore.";
	increase morale of player by 1;
	move player to Public Beach;
	follow the turnpass rule;

instead of going east from Slide Room:
	try sliding;


Section 5 - Checking the Dolphin Suits

understand "dolchecklist" as dolchecklisting.
understand "dolphin list" as dolchecklisting.

dolchecklisting is an action applying to nothing.

check dolchecklisting:
	if location of player is not Slide Room, say "You don't see those here." instead;

carry out dolchecklisting:
	say "check dolphin:  [link][bracket]1[close bracket][as]check dolphin 1[end link] [link][bracket]2[close bracket][as]check dolphin 2[end link] [link][bracket]3[close bracket][as]check dolphin 3[end link] [link][bracket]4[close bracket][as]check dolphin 4[end link] [link][bracket]5[close bracket][as]check dolphin 5[end link] [link][bracket]6[close bracket][as]check dolphin 6[end link] [link][bracket]7[close bracket][as]check dolphin 7[end link] [link][bracket]8[close bracket][as]check dolphin 8[end link] [link][bracket]9[close bracket][as]check dolphin 9[end link] [link][bracket]10[close bracket][as]check dolphin 10[end link] [link][bracket]11[close bracket][as]check dolphin 11[end link] [link][bracket]12[close bracket][as]check dolphin 12[end link][line break]";


understand "check dolphin [number]" as dolchecking.

dolchecking is an action applying to one number.

check dolchecking:
	if location of player is not Slide Room, say "You don't see those here." instead;

carry out dolchecking:
	let x be the number understood;
	let status be "";
	if x > 12:
		say "There are only a dozen to search.";
	otherwise:
		let status be entry x of dolphinlist;
		if status is "A":
			say "[dolcheckA]";
		otherwise if status is "B":
			now entry x of dolphinlist is "A";
			say "[dolcheckB]";
		otherwise if status is "C":
			say "[dolcheckC]";
		otherwise if status is "D":
			now entry x of dolphinlist is "A";
			say "[dolcheckD]";
		otherwise if status is "E":
			say "[dolcheckE]";
		otherwise:
			say "Error - unknown variation.";
		increase dolcastleturn by 1;
		if remainder after dividing dolcastleturn by 3 is 0 and vixdol is not 3:
			now dolcastleturn is 0;
			follow the turnpass rule;		[three searches per turn]


to say dolcheckA:		[empty]
	[puts Bottlenose Toy as lead monster in case of impregnation]
	repeat with y running from 1 to number of filled rows in table of random critters:
		choose row y in table of random critters;
		if name entry is "Bottlenose Toy":
			now monster is y;
			break;
	if dolcastlefight is not 2:		[empty suit]
		say "     With some effort, you make your way over to one of the large dolphin inflatables and start looking for the seam to open it.  You are able to find it readily and start opening it up.  As you do so, it starts to shift and move.  You are momentarily hopeful that it contains the struggling vixen, but you instead find it empty.  Moving under its own power, the inflated dolphin suit tries to envelop you.  Shall you resist?";
	otherwise:					[lost to released toy dolphin - D]
		say "     After having had its fun, the inflatable dolphin dives into the water to frolic and look for some new amusement.  Still a little fuzzy headed after the romp with the dolphin toy, you momentarily forget about the dolphin suit which once held your recent playmate.  It makes a grab for you and wraps itself partially over you before you have a chance to react.  Moving under its own power, the strange suit tries to envelop you within itself.  Shall you resist?";
		now dolcastlefight is 0;
	let dolescape be 0;
	if the player consents:
		let x be a random number between 1 and 2;
		if x is 1:
			say "     As the dolphin suit tries to pull itself overtop of you, you struggle and squirm, trying to pull yourself free.  It's gotten a good grip of your upper body";
			let playernum be a random number between 1 and dexterity of player;
			let dolphinnum be a random number between 1 and dex entry;
			if playernum >= dolphinnum:
				say ", but you manage to twist yourself free and grab the head as it tries to slide overtop of your own.  You push it back off of you, forcing the air out of it until it starts to sag down, unable to continue holding you.  You pant from breath and toss it aside, looking over the others as you try and decide what to do next.";
				now dolescape is 1;
			otherwise:
				say "and, try as you might, you can't manage to squirm free of its grip.  It loosely slides the head portion over your face.  You find you can partially see out of its eyes, giving you a distorted, green-tinted view of the castle interior.";
		otherwise if x is 2:
			say "     As the dolphin suit tries to pull itself overtop of you, you struggle by pushing back against its inner walls.  It's gotten a good grip on your upper body";
			let playernum be a random number between 1 and strength of player;
			let dolphinnum be a random number between 1 and str entry;
			if playernum >= dolphinnum:
				say ", but you manage to push back the padded surface, stretching the inner body of the animated suit enough to pull yourself from its grip.  You push it back off of you, forcing the air out of it until it starts to sag down, unable to continue holding you.  You pant from breath and toss it aside, looking over the others as you try and decide what to do next.";
				now dolescape is 1;
			otherwise:
				say ", but the inner surface is too slick for your hands to get a good grip to push.  Try as you might, you can't push back the inflated sides of the creature before it manages to slide the head portion over your face.  You find you can partially see out of its eyes, giving you a distorted, green-tinted view of the castle interior.";
		if dolescape is 0:
			attempttowait;
			say "     With you partially pulled into its inflatable body, the strange suit's material stretches itself over you as it works to enclose your [bodydesc of player] body.  It feels very good and quite arousing, squeezing and rubbing against you as it does.  It seems to stretch and adjust itself to be just the right shape and size to contain you";
			let playernum be ( 150 + humanity of player - libido of player + ( level of player * 2 ) );
			let playernum be a random number between 1 and playernum;
			let dolphinnum be a random number between 1 and ( 150 + lev entry );
			if playernum >= dolphinnum:
				say ".  You manage to block out the pleasure that comes from the rubbery material rubbing and sliding agaisnt you and remain focused.  Sliding your hands along the slick inner surface, you reach outward and grab both sides of the seal and start pulling it back open.  You get the opening wide enough to pull yourself from its grip.  You push it back off of you, forcing the air out of it until it starts to sag down, unable to continue holding you.  You pant from breath and toss it aside, looking over the others as you try and decide what to do next.";
				now dolescape is 1;
			otherwise:
				say ".  You can feel a slick lubricant coating its inside, letting it slide easily over your flesh.  Guiding itself over your legs, it presses your feet into the bottom tail section.  It squeezes itself down around your legs, binding them together and molding its insides to grip around your feet.  Your joints bend and stretch as needed to make you painlessly fit into the oversized dolphin inflatable.";
				say "     As it starts sealing itself around you, you can feel the whole of this strange, inflatable suit swelling and pressing in around you.  Its inner walls press in snugly around your skin, squeezing your limbs and body tightly while inflates to become a large dolphin-shaped toy with you held inside.  You feel an increasing sense of euphoria as the inner lining [if cocks of player > 0 and cunts of player > 0]rubs against your throbbing cock and presses into your wet pussy[otherwise if cocks of player > 0]rubs against your maleness[otherwise if cunts of player > 0]presses into your wet pussy[otherwise]slides against your bare groin[end if] arousing you greatly[if cocks of player > 0 or cunts of player > 0].  You cum several times from the toy's motion against you as the rubbery walls slide over you";
	otherwise:
		say "     The strange suit starts pulling itself overtop of you, letting its slick inner surface slide across your [skinname of player] skin as it works to enclose your [bodydesc of player] body as best it can without assistance.  As the material is stretched over you, it feels very good and quite arousing, squeezing and rubbing against you as it does.  It seems to stretch and adjust itself to be just the right shape and size to contain you.  You can feel a slick lubricant coating its inside, letting it slide easily over your flesh.  Guiding itself over your legs, it presses your feet into the bottom tail section.  It squeezes itself down around your legs, binding them together and molding its insides to grip around your feet.  Your joints bend and stretch as needed to make you painlessly fit into the oversized dolphin inflatable.";
		say "     As it starts sealing itself around you, you can feel the whole of this strange, inflatable suit swelling and pressing in around you.  Its inner walls press in snugly around your skin, squeezing your limbs and body tightly while inflates to become a large dolphin-shaped toy with you held inside.  You feel an increasing sense of euphoria as the inner lining [if cocks of player > 0 and cunts of player > 0]rubs against your throbbing cock and presses into your wet pussy[otherwise if cocks of player > 0]rubs against your maleness[otherwise if cunts of player > 0]presses into your wet pussy[otherwise]slides against your bare groin[end if] arousing you greatly[if cocks of player > 0 or cunts of player > 0].  You cum several times from the toy's motion against you as the rubbery walls slide over you";
	if dolphinbundle is not 2 and dolescape is 0:
		say ".  After several orgasms, the suit begins to open up again, releasing you back onto the floor of the bouncy castle.  You lay there panting for a while, aroused by the strange experience.";
		infect "Bottlenose Toy";
		increase libido of player by 8;
		decrease humanity of player by 5;
		increase dolphinbundle by 1;
		now dolcastleturn is 0;
		follow the turnpass rule;
	otherwise if dolphinbundle is 2 and dolescape is 0:
		say ".";
		attempttowait;
		say "     You moan and squirm within the dolphin suit, lost in the lust of the physical pleasure it's providing when you feel something touch the outside of the suit.  Looking through the green eyes, you can see one of the dolphin girls has come along and you can hear others playing in the water outside.  The hope that she's here to play with you pops into your mind.  Her fin-hands slide over the suit, opening it a little to adjust its position.  She even slides off the head to give you a kiss before helpfully fitting the breather on properly and sliding the head back overtop of you so you can see properly[if cocks of player > 0 or cunts of player > 0].  She rubs firmly over your groin as she zips you back up, making you cum again[end if].  Once you're well-fitted into the inflatable dolphin suit, you are delighted as she pulls you by the suit's handles into the water.  She and the other dolphin girls giggle happily, swimming and playing around you.  The motion of the strange suit riding the rolling ocean waves sends shocks of pleasure through your body, and the pleasure only intensifies when the one who found you grabs the toy's handles and pulls herself out of the water to ride atop it.  The dolphin girl rides the toy for some time, stroking and hugging it's vinyl exterior, each motion sending another echo of pleasure through you.";
		say "     After playing in the water for a while, the girls decide to frolic in the bouncy castle and you're pulled back inside[if cocks of player > 0 or cunts of player > 0].  You cum several more times as the girls push, pull and squeeze the inflatable suit, dragging you out of the ocean into their floating castle[end if].  With you safely aboard, the excited girls resume their giggling playtime with you as their new toy.  The dolphin girls bounce around the castle happily, occasionally stopping to squeeze each other's inflatable bodies, or lick at the slits between their legs, but there are always several girls focusing on you, lavishing attention on the inflatable suit.  With the pleasure of each movement rolling through your body and the sounds of their trills and laughter echoing through you mind you're soon able to focus on nothing but the excitement around you.  Finally the girls seem to tire of their play, several of them pick you up and hang you alongside the other inflatable dolphin suits lining the walls of the castle before jumping back into the sea and heading for the shore.  With the breathing tube in your mouth, all you can do is moan softly as the strange suit continues to pleasure you over and over again, seeming to draw strength from it.";
		now dolinfloss is -100;
		now non-infectious entry is true;			[prevents regular dolphin girl infection from occurring]
		now tailname of player is "Bottlenose Toy";
		now facename of player is "Bottlenose Toy";
		now skinname of player is "Bottlenose Toy";
		now bodyname of player is "Bottlenose Toy";
		now cockname of player is "Bottlenose Toy";
		now tail of player is "You have a buoyant, inflatable dolphin tail.";
		now face of player is "that of a cute, smiling dolphin";
		now skin of player is "smooth and green plastic, stretched and shaped with visible seams";
		now body of player is "shaped like an inflatable dolphin water toy.  You are roughly as large as a real dolphin and have a pair of handles for someone to ride you";
		now cock of player is "tapered and made of clear, inflatable plastic, but can still become full and hard for mating.  It leaks a clear, slick lubricant as precum";
		now scalevalue of player is 3;
		now bodydesc of player is "inflatable";
		now bodytype of player is "dolphin";
		now the daycycle of player is 0;
		now breasts of player is 2;
		now breast size of player is 0;
		if hellHoundLevel is 0:
			follow the sex change rule;
			follow the sex change rule;
		if libido of player < 60, now libido of player is 60;
		now humanity of player is 0;
		now battleground is "void";
		now combat abort is 1;
		attempttowait;
		end the game saying "Trapped in the inflatable dolphin suit, your mind slowly fades away until there are no thoughts left in your air-filled head but that of playing at the beach.";


to say dolcheckB:		[free victim]
	say "     With some effort, you make your way over to one of the large dolphin inflatables and start looking for the seam to open it.  It takes a little time to find it, having partially melded itself shut, but you manage to start working it open.  As you begin to get it open, it starts to shift and move with the struggles of someone inside.  Your hopes are quickly dashed as a gray, flippered paw pushes free and the leopard seal inside starts to force its way to freedom.  Pulling the breathing piece from its mouth, the anthropomorphic seal gasps for fresh air.  'Ahhh!  Gimme out of here!'  The inflatable suit seems to struggle against its victim's escape attempt, but can't stop him (you realize as you spot his sheath) as you aid in his escape.";
	say "     As the seal gets out further, he starts squeezing on the inflatable dolphin, pushing the air out of it until it eventually sags to the colourful floor.  You are given a kiss and a grope by the seal.  'Thanks, hon,' he rumbles.  'I'd thank you properly, but I'm not sticking around here.  Mmm... too bad, too.  I think you'd make a lovely seal cow.  Oh well, plenty of others to find and breed,' he adds before leaping from the doorway into the water.  As you watch, he swims quickly out to sea, probably off to find an unprotected town to infect.  Uncertain how you feel about that, having saved him from the dolphin girls only to put others at risk of becoming seals.  Brushing your fingertips across your lips, remembering his kiss, you can't help but find the way his form cuts through the water sexy.  Certainly they'd be better off as seals than some of the other infections you've encountered.";
	increase score by 10;
	increase libido by 10;
	if libido of player > 100, now libido of player is 100;


to say dolcheckC:		[mostly tf victim]
	say "     With some effort, you make your way over to one of the large dolphin inflatables and start looking for the seam to open it.  It takes a little time to find it, having partially melded itself shut, but you manage to start working it open.  As you begin to get it open, it starts to shift and move a little.  But as you open it up further, you find a mostly transformed victim inside.  They simply moan softly, not bothering to struggle against the strange suit encapsulating them.  The victim has a few traces of having once been [one of]a canine[or]a feline[or]a bovine[or]an equine[or]an avian[at random] creature.  The being inside is now mostly transformed into an inflatable dolphin creature, only giggling with a vapid, chirping trill and asking if you'd like to play.  You seal it back up since it's too far gone and hope you can find the vixen before it's too late.";


to say dolcheckD:		[complete tf - fight]
	say "     With some effort, you make your way over to one of the large dolphin inflatables and start looking for the seam to open it.  At first, you struggle to find the seam, but then it pops into sharp relief.  But as you begin to open it, things start to go wrong.  The inflatable dolphin starts to move and open on its own, releasing its transformed victim upon you.  Whatever it was before, the victim has fully become an animated, inflatable dolphin toy.  '[one of]Ooo!  A playmate[or]Happy birthday to me[or]A new friend[or]I want to play[at random]!' the floating dolphin trills with a clicking laugh.  The balloon toy floats up into the air and moves to attack you while the now empty suit shuffles around, waiting for its opportunity to strike.";
	now dolcastlefight is 3;
	challenge "Bottlenose Toy";
	if dolcastlefight is 1:				[victory]
		say "     Despite the added difficulty of standing to fight on the wobbly castle floor, you've managed to beat the dolphin toy and toss it out of the castle.  With it swimming off to find some new amusement for itself, you turn your attention on the inflatable dolphin suit that created it.  Still partially deflated after performing its duty, it puts up a bit of a struggle, but you are able to squeeze it until fully deflated.";
	otherwise if dolcastlefight is 2:		[lose]
		say "[dolcheckA]";
	otherwise:						[flee]
		say "     Taking your only option for escape from the fight, you dive down the slide into the water and start swimming for it[if boatfound is 3].  You swim as quickly as you can to your boat.  The dolphin toy, thinking this is all part of some game or race, swims along with you, bumping her nose against you and nuzzling your groin.  You manage to stay focused despite this distraction and make it to the boat, pull up your anchor and sail off, much to the playful creature's momentary disappointment before the thought leaves its airy mind and it splashes off for fun elsewhere.  You pull back to shore to take a break before possibly returning, hoping the dolphin will have left the waters around the castle by then[otherwise if boatfound is 2].  You swim the short distance to your rowboat and detach your line.  You begin the hard row back to shore while the playful dolphin swims and dives around and even over your boat.  As you're approaching the shore, its airy mind thankfully gets distracted and it splashes off for fun elsewhere.  You continue to shore and pull your boat aground to take a break to recover your strength after your rush to shore before possibly returning[otherwise].  You swim as quickly as you can back to shore, but it is a long trip with the dolphin toy harassing you the whole time.  Thinking this is all part of some game or race, swims along with you, bumping her nose against you and nuzzling your groin.  You manage to stay focused with some effort despite the distraction and eventually make it back to shore.  The playful creature follows you all the way back, only getting distracted and splashing off for fun elsewhere as you're approaching the beach.  Tired after the long swim, you pull yourself onto the sandy shore and have to take a break before possibly returning[end if].";
		if boatfound is not 3:
			let dam be 15 - ( strength of player / 2 ) - (stamina of player / 2 );
			if dam < 0, now dam is 0;
			decrease hp of player by dam;
			if boatfound is not 2:
				increase libido of player by 10;
		move player to Public Beach;
		follow the turnpass rule;


to say dolcheckE:		[vixen]
	say "     With some effort, you make your way over to one of the large dolphin inflatables and start looking for the seam to open it.  It takes a little time to find it, having partially melded itself shut, but you manage to start working it open.  As you begin to get it open, it starts to shift and move with the struggles of someone inside.  When you get it open, you're pleased to see the orange fur of the vixen you seek.  Her fur has become a smooth, latex skin, but you continue on in the hope that it's not already too late.  As you get her head free and pull the breathing tube from her muzzle, her struggles grow all the more fervent.";
	say "     'Mmm... Can we play now?  No!  Ah!  Get me out of this silly thing!' she yips with a definite squeak to her voice.  You inform her that you're trying to free her, but that you want something in return.  'Oh!  That'd be fun!' she giggles.  'This thing's been teasing me for so long, I could certainly go for the real thing,' she adds with a moan.  After elaborating that you're actually after her stash of supplies, she nods and manages to focus enough to be more serious.  'No prob.  We'll split it if you can get me out of this mess,' she says eagerly, still fighting against the suit which seems very reluctant to release her.  With the both of you working at it, she's able to keep the suit from resealing her while you struggle to deflate it to the point it can no longer strive to hold her.";
	attempttowait;
	let x be 0;
	if pocketknife is owned or combat knife is owned or bonesaw is owned or infected sword is owned or cleaver is owned, let x be 1;	[blade]
	say "     She hugs you tight and giggles merrily at her freedom.  She dives happily down the slide with a giggling 'Wheeeee!' and into the water.  Her new form takes to it readily as she happily floats across the waves.  You grab your stuff and head down after her splashing into the water as she frolics about.  She swims alongside you as you head to the lines securing the bouncy castle and [if x is 0]release[otherwise]cut[end if] them.  The giant inflatable starts to drift away from shore, floating out to sea as the tide goes out and it's taken by the current.  You [if boatfound is 3 or boatfound is 2]climb back into your boat and head back to shore[otherwise]start the long swim back to shore[end if] with the sleek vixen.  Once on the beach, you both stare out over the water, feeling smug satisfaction as you watch the bouncy castle drift further and further out to sea.  Someone else will have to deal with it, but at least you've gotten rid of a bunch of those strange dolphin-making suits.";
	say "     During your trip back, you've come the realize that the vixen's still been considerably affected by her time in the dolphin suit.  While the impression you got from her old notes was different, she's certainly quite the airhead now.  She giggles and cavorts playfully, focusing on little past her own amusement from moment to moment.  Still worried about your reward, you keep talking to her, trying to keep her focused.  And while she won't divulge the location to you, you do thankfully get the impression she may still know where the stuff is hidden.";
	attempttowait;
	say "     It takes some prodding from you to keep her on track, but she leads you through the coastal neighbourhood.  She goes on about her new body, how sexy she's been finding this whole [']crazy-animal-sex-thingy['], and how much she's looking forward to just running around and having some fun instead of being such a stick-in-the-mud about it like she was before.  From the meandering path she takes, you worry that she has no idea where she's going, but she eventually leads you to an old house.  'See!  I knew I'd find my way back eventually.  This is my parent's old place, but they're not around, so I stashed my stuff under the porch so no one would find it.  Can you be a dear and get it out?  I don't want to tear my new, shiny skin,' she asks, running her paws over it with a happy giggle.";
	say "     It takes some squirming, but you manage to snag the pack of bottled water and, with the vixen's help, pull it and yourself free from under the porch.  She dances happily and gives you a kiss, splitting the pack with you.  Even split between the two of you, your water supplies have been considerably improved.  You ask if there's any food, but she shakes her head and grins.  'Nope.  I think I was out looking for some when I ran into those cute dolphin girls.  Mmm... I should see if I can find one of them again.  Just one this time, though.  As fun as that suit was, I do like being a sexy vixen,' she says, giving her tail a swish.  'Well, time for me to head off, sweety.  Thanks for the rescue,' she says, giving your ass a squeeze before dashing off with a girlish giggle.";
	increase carried of water bottle by 3;
	increase score by 50;
	now Bouncy Castle is unknown;
	now vixdol is 3;
	move player to Public Beach;
	follow the turnpass rule;


Section 6 - Rules Modifications and Everyturn Rule

Instead of exploring while player is in Bouncy Castle:
	say "There is nowhere to explore out here.";

Instead of exploring while player is in Bouncy Castle:
	say "There is nowhere to scavenge out here.";

an everyturn rule:
	if vixdol is 2 and the player is in Slide Room:
		now dolcastleturn is 0;
		decrease vixcountdown by 1;
		if vixcountdown <= 0:
			say "     You hear some noise coming from one of the suspended dolphins.  Following the moans, you struggle to open it up.  Inside you discover the vixen you were seeking, writhing in the throws of a rather powerful orgasm.  She's already become an inflatable and her arms seem to be fusing to her sides.  You quickly pull off the mouthpiece, but her eyes have gone vacant and she simply moans and trills happily as you try and ask her about her cache of supplies.  With her mind gone and her body well on its way to becoming just another inflatable dolphin toy, you grumble and seal her back up.";
			if pocketknife is owned or combat knife is owned or bonesaw is owned or infected sword is owned or cleaver is owned:
				say "     Frustrated with the time you've wasted on this project, you leap back into the water and swim to the mooring lines securing the castle and cut through them.  The giant inflatable starts to drift away from shore, floating out to sea as the tide goes out and it's taken by the current.  You [if boatfound is 3 or boatfound is 2]climb back into your boat and head back to shore[otherwise]start the long swim back to shore[end if].  Once on the beach, you stare out of the water, feeling smug satisfaction as you watch the bouncy castle drift further and further out to sea.  Someone else will have to deal with it, but at least you've gotten rid of a bunch of those strange dolphin-making suits.";
			otherwise:
				say "     Frustrated with the time you've wasted on this project, you leap back into the water and swim to the mooring lines securing the castle and untie them.  The giant inflatable starts to drift away from shore, floating out to sea as the tide goes out and it's taken by the current.  You [if boatfound is 3 or boatfound is 2]climb back into your boat and head back to shore[otherwise]start the long swim back to shore[end if].  Once on the beach, you stare out of the water, feeling smug satisfaction as you watch the bouncy castle drift further and further out to sea.  Someone else will have to deal with it, but at least you've gotten rid of a bunch of those strange dolphin-making suits.";
			move player to Beach Plaza;
			now Bouncy Castle is unknown;
			now vixdol is 99;
			decrease score by 10;
	otherwise if vixdol is 2 and ( the player is in Bouncy Castle or the player is in Fencing Room or the player is in Bouncing Play Room or the player is in Ball Pit Room or the player is in Toy Room or the player is in Parapets ):
		decrease vixcountdown by 1;
		if vixcountdown <= 0:
			say "     As you pause for a moment to catch your breath, you hear loud, muffled cries of ecstacy coming from somewhere on the upper level of the castle.  Given the mix of yiffs and trills to the sound and how they finish by becoming purely trills of delight, you sadly have to assume that that was the vixen girl finally giving in to whatever is happening to her.  Deciding there's little point in remaining here any longer, you push your way back to the entrance.";
			if pocketknife is owned or combat knife is owned or bonesaw is owned or infected sword is owned or cleaver is owned:
				say "     Frustrated with the time you've wasted on this project, you leap back into the water and swim to the mooring lines securing the castle and cut through them.  The giant inflatable starts to drift away from shore, floating out to sea as the tide goes out and it's taken by the current.  You [if boatfound is 3 or boatfound is 2]climb back into your boat and head back to shore[otherwise]start the long swim back to shore[end if].  Once on the beach, you stare out of the water, feeling smug satisfaction as you watch the bouncy castle drift further and further out to sea.  Someone else will have to deal with it, but at least you've gotten rid of a bunch of those strange dolphin-making suits.";
			otherwise:
				say "     Frustrated with the time you've wasted on this project, you leap back into the water and swim to the mooring lines securing the castle and untie them.  The giant inflatable starts to drift away from shore, floating out to sea as the tide goes out and it's taken by the current.  You [if boatfound is 3 or boatfound is 2]climb back into your boat and head back to shore[otherwise]start the long swim back to shore[end if].  Once on the beach, you stare out of the water, feeling smug satisfaction as you watch the bouncy castle drift further and further out to sea.  Someone else will have to deal with it, but at least you've gotten rid of a bunch of those strange dolphin-making suits.";
			move player to Beach Plaza;
			now Bouncy Castle is unknown;
			now vixdol is 99;
			decrease score by 10;
	otherwise if vixdol is 1 or vixdol is 2:
		decrease vixcountdown by 1;
		if vixcountdown <= 0:
			say "     Your thoughts stray back to the vixen and dolphin girls you saw on the beach.  It's been several days, so it's probably too late to help her now.";
			decrease score by 10;
			now vixdol is 100;



Section X - Debug - Not for release

dolphincastletesting is an action applying to nothing.
understand "dolcastletest" as dolphincastletesting.

carry out dolphincastletesting:
	try resolving Snared Vixen;
	wait for any key;
	move player to Bouncy Castle;


Section 7 - Captured Endings

when play ends:
	if bodyname of player is "Captured" and bcending is 1:
		say "     Your pod ends up hidden beneath the bouncy castle, attached to the underside.  There, you life becomes one of unending pleasure as the sex chair that's become your whole world stimulates you.  You have orgasm after unending orgasm, as somehow your pleasure satisfies some need of the giant inflatable play area.  You consciousness largely fades away under the contant treatment of the aphrodisiacs pumped into you as it sustains you with a sweet, nourishing liquid and air heavily laced with the mind-altering gasses.  You become its eternal prisoner, but somehow that doesn't matter, as long as it continues to let you [if cocks of player > 0 or cunts of player > 0]cum[otherwise]climax[end if].";
		if cunts of player > 0 or "MPreg" is listed in feats of player:
			say "     You are vaguely aware that there are other pods down there as well despite being fully enclosed and unable to see or sense anything but the pleasures provided.  Your womb is periodically pumped full of semen from these other prisoners, impregnating you with their offspring, providing your broken mind with another delight to enjoy.  Your children are born as inflatable versions of their sires.  They are removed from your pod as they are pushed from your [if cunts of player > 0]vagina[otherwise]ass as latex eggs[end if] and released as more servants for the bouncy castle[if cocks of player > 0].  Also being male, you take added pleasure in knowing your seed is similarly being used to impregnate females in other pods[end if].";
		otherwise if cocks of player > 0:
			say "     You are vaguely aware that there are other pods down there as well despite being fully enclosed and unable to see or sense anything but the pleasures provided.  Your semen is pumped out of you and periodically provided to the others, used to breed the female prisoners to sire inflatable young inside them to be more servants for the bouncy castle.";
	otherwise if bodyname of player is "Captured" and bcending is 2:
		say "     Your pod ends up hidden beneath the bouncy castle, attached to the underside.  But you don't remain entirely there, either.  A section of your mind, having so willingingly accepted the pleasures of the castle, is drawn away from your body and starts to meld into the consciousness that is the bouncy castle.  You care share in some of its senses and feel it drawing energy from the pleasure of others, both your body and the other prisoners in pods beneath the castle.  It has a small collection of them to sustain itself and this constant feeding brings a pleasure of its own to you as part of the inflatable castle.  Those converted by the floating play area and its creatures are its servants, providing additional energy and pleasure to it.  The others, more prisoners of their pods rather than fully part of the castle like you are, live in constant ecstacy and orgasm, as your body does.  These creatures are bred with one another as well, semen pumped from the males into the females so they may birth inflatable creatures like their parents to act as fresh servants for the castle";
		if cocks of player > 0 or cunts of player > 0 or "MPreg" is listed in feats of player:
			say ".  Still sharing some connection with your body, you get to enjoy this as well as all the other physical pleasures the castle provides, more directly sharing them with your united consciousness.";
		otherwise:
			say ".  Still sharing some connection with your body, you get to enjoy all the physical pleasures the castle provides, more directly sharing them with your united consiousness.";


Bouncy Castle ends here.