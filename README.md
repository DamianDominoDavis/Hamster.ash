# Hamster.ash

A Kingdom of Loathing script that is intended to be a low set up script for getting the Hamster from Hodgman. This is mostly original with some inspiration from Grotfang's Hands Free Hamster script. I've also yoinked some lines from a hobopolis script that I can't find anymore and a Forums of Loathing post.

Be wary that this only works in theory, I've tested what I could, but I haven't been able to do a test run, not enough interest in my clan TT.

## Installation
To install this script in KolMafia, simply use the following command in the gCLI:

`git checkout Astro3207/Hamster`

## What will I need to run it?
I've tried to keep the requirements as minimal as possible. You have the option to have outfits, custom combat script (ccs), or moods named sewers (no mood and only if you choose to go Lucky!), boots, eyes, guts, skulls, crotches, skins. If you lack the outfits then the script runs a modifier maximum best for the situation. If you don't have a ccs for the respective body parts, the script will fall back on the 120MP hobopolis skills. There will be no mood set if you didn't make one. You will also need sufficient stats to do all of this of course. So basically if you have nothing set up to your preference __you only need the Hobopolis skills, if your stats are not sufficient to collect the parts, I would reccommend creating your own outfit, ccs, and mood__.
  >Note about moods: seems like the function isn't well fleshed out in Mafia, so it will make a mood named boots (for example) if you don't already have it, but there will be nothing in it, you will have to delete it each time if you don't want to clog up your moods.

## What will this script do?
- It will first ask you for your role: one of the six body part makers, scarehobo maker, cagebot, and/or mosher.  
> What is the scarehobo maker? They will making the scarehobos, but also be responsible for collecting the parts one at a time after the initial tent opening. While others will spend 106 adventure collecting parts before the first tent, the scarehobo maker can spend 0 to 320 turns in total collecting body parts, but likely will spend around 160. If the scarehobo maker is spending more than 205 turns collecting parts, it is likely to be over 1100 adventures.  

- It will ask if you want to Lucky! Your way through the sewers, otherwise it will CLEESH and tunnel your way through the sewers. It will also give you the option to finish off with Lucky! when you have 10 or less explorations left. It will first wait for cagebot to get caged. Then it will prioritize opening 9 grates before going down any sewer tunnels. I (and one other person has validated) that 9 to 12 grates opened is optimal, although I could be wrong. Then it'll take the tunnels and switch to Lucky! for the last <10 explorations if desired.  
- Then the 6 parts collectors will collect 106 body parts.  
- Once 106 of each part is collected the scarehobo maker will try to get to town square image 12 (to determine how good your scarehobo RNG is) then move towards image 125. If they ever run out of parts the script will make more, but only 1 kill at a time until tent is open.  
- Once tent is open each person will CLEESH until tent and then say into Hobopolis clan chat that they are "tented".  
- Once 7 people has said that, people will get on stage and say "staged".   
- Once 6 people has said staged, mosher will mosh and say "moshed".  
- When 6 people say "off stage" the scarehobo maker will continue. This repeats for 6 more moshes. Before tent 8 is open, the scarehobo maker will instead use scarehobos as they are prepared (before this the -script will save scarehobos for the next mosh as necessary).
- Everything said into chat will be automated and detected by the chatbot script
- Everyone's script will stop when image 25 is seen meaning that Hodgman is up allowing you to collect any banquets and fighting Uber-Hodge.  

## What are it's features?
  - It will abort if a combat is lost.
  - It will abort if a body part fails to collect.
  - It will check with you that you are in the right clan.
  - It is hands free after answering the initial questions.
  - It is two scripts for everyone.
  - It is tolerant to aborts, wether it's from you or the script.
  - It is tolerant to others people who are not running the script or Mafia (my clan has people who doesn't run Mafia). For more info see people not running the script below. The only people who really should be running the script is the scarehobo maker (or they just have to be flawless).

## Things that it does not do:
  - Check that you are on track for a Hamster (considering adding it, but requires calculations on my part)
  - Optimize your setup to make sure you can get the parts (definitely will not be adding this because I am no good at this, but if someone wants to take a stab at it they can)
  - Does not use sneaks, free kills, and free runaways (except snokebomb)

## For people not running the script:
  Simple all you have to do is your given role. The only specifics are that you should only collect 106 body parts initially and I would not reccomend you being the scarehobo maker. And when you are at tent you must say "tented" (not sure if capitalization matters yet), when you are staged say "staged", when you are moshing say "moshed", when you are off stage say "off stage".
