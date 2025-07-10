void main (string sender , string message, string channel){
   if (channel == "/hobopolis"){
      print("message is "+message);
      if (message == "tented"){
         int people_tented = to_int(get_property("people_tented"));
         people_tented += 1;
         set_property("people_tented" , people_tented);
      }
      if (message == "staged"){
         int people_staged = to_int(get_property("people_staged"));
         people_staged += 1;
         set_property("people_staged" , people_staged);
      }
      if (message == "moshed"){
         set_property("moshed" , "true");
      }
      if (message == "off stage"){
         int people_unstaged = to_int(get_property("people_unstaged"));
         people_unstaged += 1;
         set_property("people_unstaged" , people_unstaged);
      }
   }
}

void boots_prep(){
    if (outfit ("boots") == false ){
        print("No outfit named boots (capitalization matters), wearing a generic outfit", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        cli_execute("maximize hot spell damage, spell damage percent, -lantern");
    }
    if (have_skill($skill[Flavour of Magic]) == true){
        cli_execute("cast Spirit of Cayenne");
    }
    if (set_ccs("boots") == false){
        print("No custom combat script named boots (capitalization matters), setting auto attack to Awesome Balls of Fire", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        if (have_skill($skill[Awesome Balls of Fire]) == false){
            abort("Missing skill Awesome Balls of Fire, please set a ccs named boots");
        } else {
            set_auto_attack(0028);
        }
    }
    set_property("currentMood", "boots");
}

void eyes_prep(){
    if (outfit ("eyes") == false ){
        print("No outfit named eyes (capitalization matters), wearing a generic outfit", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        cli_execute("maximize cold spell damage, spell damage percent, -lantern");
    }
    if (have_skill($skill[Flavour of Magic]) == true){
        cli_execute("cast Spirit of Peppermint");
    }
    if (set_ccs("eyes") == false){
        print("No custom combat script named eyes (capitalization matters), setting auto attack to Snowclone", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        if (have_skill($skill[Snowclone]) == false){
            abort("Missing skill Snowclone, please set a ccs named eyes");
        } else {
            set_auto_attack(0030);
        }
    }
    set_property("currentMood", "eyes");
}

void guts_prep(){
    if (outfit ("guts") == false ){
        print("No outfit named guts (capitalization matters), wearing a generic outfit", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        cli_execute("maximize stench spell damage, spell damage percent, -lantern");
    }
    if (have_skill($skill[Flavour of Magic]) == true){
        cli_execute("cast Spirit of Garlic");
    }
    if (set_ccs("guts") == false){
        print("No custom combat script named guts (capitalization matters), setting auto attack to Eggsplosion", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        if (have_skill($skill[Eggsplosion]) == false){
            abort("Missing skill Eggsplosion, please set a ccs named guts");
        } else {
            set_auto_attack(0032);
        }
    }
    set_property("currentMood", "guts");
}

void skulls_prep() {
    if (outfit ("skulls") == false ){
        print("No outfit named skulls (capitalization matters), wearing a generic outfit", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        cli_execute("maximize spooky spell damage, spell damage percent, -lantern");
    }
    if (have_skill($skill[Flavour of Magic]) == true){
        cli_execute("cast Spirit of Wormwood");
    }
    if (set_ccs("skulls") == false){
        print("No custom combat script named skulls (capitalization matters), setting auto attack to Raise Backup Dancer", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        if (have_skill($skill[Raise Backup Dancer]) == false){
            abort("Missing skill Raise Backup Dancer, please set a ccs named skulls");
        } else {
            set_auto_attack(0042);
        }
    }
    set_property("currentMood", "skulls");
}

void crotches_prep(){
        if (outfit ("crotches") == false ){
        print("No outfit named crotches (capitalization matters), wearing a generic outfit", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        cli_execute("maximize sleaze spell damage, spell damage percent, -lantern");
    }
    if (have_skill($skill[Flavour of Magic]) == true){
        cli_execute("cast Spirit of Bacon Grease");
    }
    if (set_ccs("crotches") == false){
        print("No custom combat script named crotches (capitalization matters), setting auto attack to grease lightning", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        if (have_skill($skill[Grease Lightning]) == false){
            abort("Missing skill Grease Lightning, please set a ccs named crotches");
        } else {
            set_auto_attack(0036);
        }
    }
    set_property("currentMood", "crotches");
}

void skins_prep(){
    if (outfit ("skins") == false ){
        print("No outfit named skins (capitalization matters), wearing a generic outfit", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        cli_execute("maximize spell damage percent, -lantern");
    }
    if (set_ccs("skins") == false){
        print("No custom combat script named skins (capitalization matters), setting auto attack to Toynado", "blue");
        if (get_property("parts_collection") != "scarehobo"){
            wait (3);
        }
        if (have_skill($skill[Toynado]) == false){
            abort("Missing skill Toynado, please set a ccs named skins");
        } else {
            set_auto_attack(0057);
        }
    }
    set_property("currentMood", "skins");
}

string LastAdvTxt() {
    string lastlog = session_logs(1)[0];
    int nowmark = max(last_index_of(lastlog,"["+my_turncount()+"]"),last_index_of(lastlog,"["+(my_turncount()+1)+"]"));
    return substring(lastlog,nowmark);
}

string town_map = visit_url("clan_hobopolis.php?place=2");
int mapimage(){
    town_map = visit_url("clan_hobopolis.php?place=2");
    int mapnumber = 0;
    matcher matcher_mapnumber = create_matcher("Town Square \\(picture #(\\d+)(o?)\\)", town_map); 
    if(matcher_mapnumber.find()){
        mapnumber += matcher_mapnumber.group(1).to_int();
    }
    return mapnumber;
}

boolean tent_open(){
    town_map = visit_url("clan_hobopolis.php?place=2");
    matcher matcher_mapnumber = create_matcher("Town Square \\(picture #(\\d+)(o?)\\)", town_map); 
    if (matcher_mapnumber.find()){
    }
    return contains_text(matcher_mapnumber.group(2).to_string(), "o");
}

string rlogs = visit_url("clan_raidlogs.php");

int grates_opened() {
    rlogs = visit_url("clan_raidlogs.php");
    matcher sewer_grate_matcher = create_matcher("\\bopened\\s+(\\d+)\\s+sewer grates?", rlogs);
    int sewer_grate_turns = 0;
    while(sewer_grate_matcher.find()){
        sewer_grate_turns += (sewer_grate_matcher.group(1)).to_int();
    }
    return sewer_grate_turns;
}

int num_mosh() {
    rlogs = visit_url("clan_raidlogs.php");
    int mosh_num;
    matcher mosh_turns = create_matcher( "started (.+?) mosh pits? in the tent \\((\\d+) turn" , rlogs );
    if (mosh_turns.find()) {
        mosh_num += mosh_turns.group( 2 ).to_int();
    }
    return mosh_num;
}

string richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
int boots(){
    richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
    int boots_count = 0;
    matcher matcher_boots = create_matcher("Richard has <b>(\\d+)</b> pair(s)? of charred hobo boot(s)?", richard);
    if(matcher_boots.find()){
        boots_count += matcher_boots.group(1).to_int();
    }
    return boots_count;
}
int eyes(){
    richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
    int eyes_count= 0;
    matcher matcher_eyes = create_matcher("Richard has <b>(\\d+)</b> pair(s)? of frozen hobo eyes?", richard);
    if(matcher_eyes.find()){
        eyes_count += matcher_eyes.group(1).to_int();
    }
    return eyes_count;
}
int guts(){
    richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
    int guts_count = 0;
    matcher matcher_guts = create_matcher("Richard has <b>(\\d+)</b> pile(s)? of stinking hobo guts", richard);
    if(matcher_guts.find()){
        guts_count += matcher_guts.group(1).to_int();
    }
    return guts_count;
}
int skulls(){
    richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
    int skulls_count = 0;
    matcher matcher_skulls = create_matcher("Richard has <b>(\\d+)</b> creepy hobo skull(s)?", richard);
    if(matcher_skulls.find()){
        skulls_count += matcher_skulls.group(1).to_int();
    }
    return skulls_count;
}
int crotches() {
    richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
    int crotches_count = 0;
    matcher matcher_crotches = create_matcher("Richard has <b>(\\d+)</b> hobo crotch(es)?", richard);
    if(matcher_crotches.find()){
        crotches_count += matcher_crotches.group(1).to_int();
    }
    return crotches_count;
}
int skins (){
    richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
    int skins_count = 0;
    matcher matcher_skins = create_matcher("Richard has <b>(\\d+)</b> hobo skin(s)", richard);
    if(matcher_skins.find()){
        skins_count += matcher_skins.group(1).to_int();
    }
    return skins_count;
}

buffer b = "if hasskill Spring Away \n skill spring away \n endif \n if hasskill Snokebomb \n skill snokebomb \n endif \n skill cleesh \n attack with weapon";
write_ccs( b, "cleesh free runaway" );

if (get_property("initialized") == 1 || get_property("initialized") == ""){
    set_property("sewer_progress", 100); //saying that there's 100 chieftans until sewers is cleared
    if (user_confirm("You are currently in the clan "+get_clan_name()+" is the correct?") == false){
        abort();
    }
    set_property("is_mosher", user_confirm("Are you the mosher?"));
    set_property("parts_collection", user_prompt("What part will you be collecting (no caps)? \n boots \n eyes \n guts \n skulls \n crotches \n skins \n scarehobo \n cagebot"));
    if (get_property("parts_collection") == ""){
        abort();
    }
    if (get_property("parts_collection") != "boots" && get_property("parts_collection") != "eyes" && get_property("parts_collection") != "guts" && get_property("parts_collection") != "skulls"  && get_property("parts_collection") != "crotches" && get_property("parts_collection") != "skins" && get_property("parts_collection") != "scarehobo" && get_property("parts_collection") != "cagebot"){
        repeat{
            if (get_property("parts_collection") == ""){
                abort();
            }
            set_property("parts_collection", user_prompt("It appears that you entered an invalid part (no caps) \n boots \n eyes \n guts \n skulls \n crotches \n skins \n scarehobo \n cagebot"));
        } until (get_property("parts_collection") == "boots" || get_property("parts_collection") == "eyes" || get_property("parts_collection") == "guts" || get_property("parts_collection") == "skulls"  || get_property("parts_collection") == "crotches" || get_property("parts_collection") == "skins" || get_property("parts_collection") == "scarehobo" || get_property("parts_collection") == "cagebot");
    }
    set_property("adv_checked", "false");
    set_property("people_tented" , "0");
    set_property("people_staged" , "0");
    set_property("moshed" , "false");
    set_property("people_unstaged" , "0");
    set_property("tent_stage","unstarted");
    set_property("hpAutoRecovery",0.5);
    set_property("hpAutoRecoveryTarget",0.95);
    set_property("mpAutoRecovery",0.25);
    set_property("mpAutoRecoveryTarget",0.75);
    set_property("chatbotScriptStorage", get_property("chatbotScript"));
    set_property("chatbotScript", "Hamster.ash");
    cli_execute("/s hobopolis");
    set_property("initialized", 4); //to skip future initializations
} else if(get_property("initialized") == 2){
    set_property("sewer_progress", 100); //saying that there's 100 chieftans until sewers is cleared
} else if(get_property("initialized") == 3){
    set_property("is_mosher", user_confirm("Are you the mosher?"));
    set_property("parts_collection", user_prompt("What part will you be collecting (no caps)? \n boots \n eyes \n guts \n skulls \n crotches \n skins \n scarehobo \n cagebot"));
    if (get_property("parts_collection") == ""){
        abort();
    }
    if (get_property("parts_collection") != "boots" && get_property("parts_collection") != "eyes" && get_property("parts_collection") != "guts" && get_property("parts_collection") != "skulls"  && get_property("parts_collection") != "crotches" && get_property("parts_collection") != "skins" && get_property("parts_collection") != "scarehobo" && get_property("parts_collection") != "cagebot"){
        repeat{
            if (get_property("parts_collection") == ""){
                abort();
            }
            set_property("parts_collection", user_prompt("It appears that you entered an invalid part (no caps) \n boots \n eyes \n guts \n skulls \n crotches \n skins \n scarehobo \n cagebot"));
        } until (get_property("parts_collection") == "boots" || get_property("parts_collection") == "eyes" || get_property("parts_collection") == "guts" || get_property("parts_collection") == "skulls"  || get_property("parts_collection") == "crotches" || get_property("parts_collection") == "skins" || get_property("parts_collection") == "scarehobo" || get_property("parts_collection") == "cagebot");
    }
    set_property("initialized", 4);
}

if (my_class() == $class[seal clubber]) {
    if (item_amount($item[sealskin drum]) < 1 && get_property("is_mosher") != "true" && get_property("parts_collection") != "cagebot"){
        abort("Looks like you're missing your class instrument... to reset your role (ie mosher or cagebot) type \"set initialized = 3\"");
    }
}
if (my_class() == $class[turtle tamer]) {
    if (item_amount($item[washboard shield]) < 1 && get_property("is_mosher") != "true" && get_property("parts_collection") != "cagebot"){
        abort("Looks like you're missing your class instrument... to reset your role (ie mosher or cagebot) type \"set initialized = 3\"");
    }
}
if (my_class() == $class[pastamancer]) {
    if (item_amount($item[spaghetti-box banjo]) < 1 && get_property("is_mosher") != "true" && get_property("parts_collection") != "cagebot"){
        abort("Looks like you're missing your class instrument... to reset your role (ie mosher or cagebot) type \"set initialized = 3\"");
    }
}
if (my_class() == $class[sauceror]) {
    if (item_amount($item[marinara jug]) < 1 && get_property("is_mosher") != "true" && get_property("parts_collection") != "cagebot"){
        abort("Looks like you're missing your class instrument... to reset your role (ie mosher or cagebot) type \"set initialized = 3\"");
    }
}
if (my_class() == $class[disco bandit]) {
    if (item_amount($item[makeshift castanets]) < 1 && get_property("is_mosher") != "true" && get_property("parts_collection") != "cagebot"){
        abort("Looks like you're missing your class instrument... to reset your role (ie mosher or cagebot) type \"set initialized = 3\"");
    }
}
if (my_class() == $class[accordion thief]) {
    if (item_amount($item[left-handed melodica]) < 1 && get_property("is_mosher") != "true" && get_property("parts_collection") != "cagebot"){
        abort("Looks like you're missing your class instrument... to reset your role (ie mosher or cagebot) type \"set initialized = 3\"");
    }
}
if (have_skill($skill[CLEESH]) == false ){
    abort("Having CLEESH is essential, and my data says you don't");
}

int sewer_progress = to_int(get_property("sewer_progress"));
if ( contains_text( town_map , "clan_hobopolis.php?place=3") ) { //checking if sewers is already cleared
    print ("The Maze of Sewer Tunnels is already clear, skipping sewers", "orange") ;
    set_property("initialized", 2);
} else {
    set_property("lucky_sewers", user_confirm("Select yes if you will be using clovers to fight your way through sewers, select no if you will be cleeshing enemies and using ladders only"));
    if (get_property("lucky_sewers") == "false"){
        set_property("HalfnHalf", user_confirm("Select yes if when there is 10 or less explorations left, you want to finish sewers with clovers"));
        set_ccs ("cleesh free runaway");
        cli_execute("maximize -combat");
        if (get_property("parts_collection") == "cagebot"){
            if(contains_text (rlogs, "stared at an empty cage for a while") == true){
                abort("someone else is already caged");
            }
            set_property("choiceAdventure211", 0);
            set_property("choiceAdventure212", 0);
            set_property("choiceAdventure198", 3);
            set_property("choiceAdventure199", 2);
            set_property("choiceAdventure197", 2);
            repeat {
                if(grates_opened() < 9){
                    set_property ("choiceAdventure198" , "3") ;
                } else {
                    set_property( "choiceAdventure198" , "2");
                }
                adventure( 1, $location[A Maze of Sewer Tunnels] );
                if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
                }
            } until (last_choice() == 211 || last_choice() == 212);
        }
        matcher someone_caged = create_matcher("stared at an empty cage for a while", rlogs);
        repeat {
            rlogs = visit_url("clan_raidlogs.php");
            print("waiting for cagebot");
            wait (5);
            if(contains_text (rlogs, "stared at an empty cage for a while") == true){
                break;
            }
        } until (contains_text (rlogs, "stared at an empty cage for a while") == true);
        set_property("choiceAdventure198", 1);
        set_property("choiceAdventure199", 1);
        set_property("choiceAdventure197", 1);
        repeat{
            if(item_amount($item[sewer wad]) == 0) {
                buy(1 , $item[sewer wad]);
            }
            if(item_amount($item[unfortunate dumplings]) == 0) {
                buy(1 , $item[unfortunate dumplings]);
            }
            if(item_amount($item[bottle of Ooze-O]) == 0) {
                buy(1 , $item[bottle of Ooze-O]);
            }
            if(item_amount($item[gatorskin umbrella]) == 0) {
                buy(1 , $item[gatorskin umbrella]);
            }
            if(item_amount($item[oil of oiliness]) < 3) {
                cli_execute("acquire 3 oil of oiliness");
            }
            if (grates_opened() < 9){
                set_property("choiceAdventure198", 3);
                set_property("choiceAdventure199", 2);
                set_property("choiceAdventure197", 2);
            } else {
                set_property("choiceAdventure198", 1);
                set_property("choiceAdventure199", 1);
                set_property("choiceAdventure197", 1);
                cli_execute("equip gatorskin umbrella");
                cli_execute("equip hobo code binder");
            }
            string visit_sewers = visit_url("clan_hobopolis.php?place=1");
            if (contains_text(visit_sewers, "Round 1")){
                run_combat();
            } else {
                run_choice(-1);
                if (contains_text(visit_sewers, "You head down the 'shortcut' tunnel.")){
                    sewer_progress -= 1;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "This ladder just goes in a big circle.")){
                    sewer_progress -= 3;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "You head toward the Egress.")){
                    sewer_progress -= 5;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "These will indubitably satisfy my refined appetite. Merci Beaucoup, old chap! Pip pip!")){
                    sewer_progress -= 1;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "He grabs the wad and runs away")){
                    sewer_progress -= 1;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "He finds a bottle of Ooze-O")){
                    sewer_progress -= 1;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "you douse yourself with oil of oiliness")){
                    sewer_progress -= 1;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "your gatorskin umbrella allows you to pass beneath the sewagefall without incident")){
                    sewer_progress -= 1;
                    set_property("sewer_progress", sewer_progress);
                }
                if (contains_text(visit_sewers, "looks like somebody else opened this grate from the other side")){
                    sewer_progress -= 5;
                    set_property("sewer_progress", sewer_progress);
                }
                if(get_property("choiceAdventure198") == "3"){
                    run_combat();
                }
            }
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                abort ("It appears you lost the last combat, look into that");
            }
            if (sewer_progress <= 10 && get_property("HalfnHalf") == "true"){
                set_property("lucky_sewers", "true");
                set_property("adv_checked", "true");
                break;
            }
        } until (get_property("lastEncounter") == "At Last!");
    }
        if (get_property("lucky_sewers") == "true"){
        if (get_property("parts_collection") == "cagebot"){
            abort("There's no point in doing lucky while being a cagebot? To reset your role (ie mosher or cagebot) type \"set initialized = 3\"");
        }
        if (item_amount($item[11-leaf clover]) < sewer_progress){ //checks if there is enough clovers
            print ("Not enough clovers?", "orange");
            abort ("If you've already cleared some of the sewers manually, type set sewer_progress = how many sewers adventures are left");
        }
        if (my_buffedstat($stat[moxie]) < 340 && get_property("sewer_fights") != "true") { //340 moxie is how much is needed for safe adventuring in the sewers
            abort ("Buffed moxie should be at least 340 to guarentee a safe passage. Contact organizers for help. If you are confident in your skillz set sewer_fights = true");
        }
        if (my_adventures() < 270 && get_property("adv_checked") != "true") { //I'm approximating that 140 adventures are needed for the entire run
            set_property("adv_checked", "true");
            abort("I would recommend having at least 270 adventures before starting");
        } else {
            set_property("adv_checked", "true"); //setting it so that the adventure check only happens once
        }
        if (outfit ("sewers") == false ){
            print("No outfit named sewers (capitalization matters), wearing a generic outfit", "blue");
            wait (3);
            cli_execute("maximize weapon damage");
        }
        if (set_ccs("sewers") == false){
            print("No custom combat script, setting auto attack to weapon");
            wait(3);
            set_auto_attack(1);
        }
        repeat { //using 11-leaf clover before adventuring in sewers once
            if ((have_effect($effect[Lucky!]) == 0) && item_amount($item[11-leaf clover]) > 0){
                cli_execute("use 11-leaf clover");
            } else {
                abort("Lacking clovers????");
            }
            adventure( 1, $location[A Maze of Sewer Tunnels] );
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                abort ("It appears you lost the last combat, look into that");
            }
            sewer_progress -= 1; //doing some calculations on how many chieftans are left
            set_property("sewer_progress", sewer_progress);
            print ("C.H.U.M Chieftans left: " + sewer_progress, "orange");
        } until (contains_text( town_map , "clan_hobopolis.php?place=3") || to_int(get_property("sewer_progress")) <= 0); //checks if town map is open or the calculations say there are 0 chieftains left
        print ("Sewers shouuuuuld be complete, I think", "orange");
        set_auto_attack(0);
    }
}
set_property("initialized", 2);
set_property("choiceAdventure230", "2"); //Skipping binder purchase
set_property("choiceAdventure272", "2"); //skipping marketplace
set_property("choiceAdventure230", "2"); //shouldn't ever happen but leaving Hodgeman alone
set_property("choiceAdventure225", "0"); //stopping if A Tent is encountered

if (mapimage() <= 6) { //phase 1 collect 106 hobo parts
    if (get_property("parts_collection") == "boots"){
        boots_prep();
        int boots_left = 106 - boots();
        while (boots() < 106) {
            adventure(1, $location[Hobopolis Town Square] );
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
            }
            if (!contains_text(LastAdvTxt(), "Richard takes a charred hobo boots")){
                abort ("Richard failed to get boots, look into that");
            }
            boots_left = 106 - boots();
            print ("Boots left to collect: " + boots_left);
        }
    }
    if (get_property("parts_collection") == "eyes"){
        eyes_prep();
        int eyes_left = 106 - eyes();
        while (eyes() < 106){
            adventure(1, $location[Hobopolis Town Square] );
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
            }
            if (!contains_text(LastAdvTxt(), "Richard takes a frozen hobo eyeballs")){
                abort ("Richard failed to get eyes, look into that");
            }
            eyes_left = 106 - eyes();
            print ("eyes left to collect: " + eyes_left);
        }
    }
    if (get_property("parts_collection") == "guts"){
        guts_prep();
        int guts_left = 106 - guts();
        while (guts() < 106){
            adventure(1, $location[Hobopolis Town Square] );
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
            }
            if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                abort ("Richard failed to get guts, look into that");
            }
            guts_left = 106 - guts();
            print ("guts left to collect: " + guts_left);
        }
    }
    if (get_property("parts_collection") == "skulls"){
        skulls_prep();
        int skulls_left = 106 - skulls();
        while (skulls() < 106){
            adventure(1, $location[Hobopolis Town Square] );
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
            }
            if (!contains_text(LastAdvTxt(), "Richard takes a creepy hobo skull")){
                abort ("Richard failed to get skull, look into that");
            }
            skulls_left = 106 - skulls();
            print ("Skulls left to collect: " + skulls_left);
        }
    }
    if (get_property("parts_collection") == "crotches"){
        crotches_prep();
        int crotches_left = 106 - crotches();
        while(crotches() < 106){
            adventure(1, $location[Hobopolis Town Square] );
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
            }
            if (!contains_text(LastAdvTxt(), "Richard takes a hobo crotch")){
                abort ("Richard failed to get crotches, look into that");
            }
            crotches_left = 106 - crotches();
            print ("crotches left to collect: " + crotches_left);
        }
    }
    if (get_property("parts_collection") == "skins"){
        skins_prep();
        int skins_left = 106 - skins();
        while (skins() < 106){
            adventure(1, $location[Hobopolis Town Square] );
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
            }
            if (!contains_text(LastAdvTxt(), "Richard takes a hobo skin")){
                abort ("Richard failed to get skins, look into that");
            }
            skins_left = 106 - skins();
            print ("skins left to collect: " + skins_left);
        }
    }
    set_auto_attack(0);
    set_property("currentMood", "apathetic");
    while (boots() < 106 && eyes() < 106 && guts() < 106 && skulls() < 106 && crotches() < 106 && skins() < 106){
        if (boots() < 106){
            int boots_left = 106 - boots();
            print("Looks we are short " + boots_left + " boots");
        }
        if (eyes() < 106){
            int eyes_left = 106 - eyes();
            print("Looks we are short " + eyes_left + " eyes");
        }
        if (guts() < 106){
            int guts_left = 106 - guts();
            print("Looks we are short " + guts_left + " guts");
        }
        if (skulls() < 106){
            int skulls_left = 106 - skulls();
            print("Looks we are short " + skulls_left + " skulls");
        }
        if (crotches() < 106){
            int crotches_left = 106 - crotches();
            print("Looks we are short " + crotches_left + " crotches");
        }
        if (skins() < 106){
            int skins_left = 106 - skins();
            print("Looks we are short " + skins_left + " skins");
        }
        print("Not all parts have been collected, waiting");
        wait(5);
        if (boots() >= 106 && eyes() >= 106 && guts() >= 106 && skulls() >= 106 && crotches() >= 106 && skins() >= 106){
            break;
        }
    }
}

if (get_property("parts_collection") == "scarehobo"){
    int scobo_used = 0;
    int manual_hobos_killed = 0;
    if (mapimage() < 9){
        print("Letting other people's script catch up");
        wait(15);
        rlogs = visit_url("clan_raidlogs.php");
        matcher manual_hobos = create_matcher("\\bdefeated\\s+Normal hobo x\\s+(\\d+)", rlogs);
        while (manual_hobos.find()){
            manual_hobos_killed += (manual_hobos.group(1)).to_int();
        }
        scobo_used = ceil(1375-manual_hobos_killed)/10;
        richard;
        visit_url("clan_hobopolis.php?preaction=simulacrum&place=3&qty="+ scobo_used);
    }
    while (mapimage() < 12){
        if (min(boots(), eyes(), guts(), skulls(), crotches(), skins()) >= 1){
            richard;
            visit_url("clan_hobopolis.php?preaction=simulacrum&place=3&qty=1");
            scobo_used += 1;
        } else {
            repeat {
                if ( boots() == 0){
                    boots_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a charred hobo boots")){
                        abort ("Richard failed to get boots, look into that");
                    }
                } else if (eyes() == 0){
                    eyes_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a frozen hobo eyeballs")){
                        abort ("Richard failed to get eyes, look into that");
                    }
                } else if (guts() == 0) {
                    guts_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                        abort ("Richard failed to get guts, look into that");
                    }
                } else if (skulls() == 0 ) {
                    skulls_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a creepy hobo skull")){
                        abort ("Richard failed to get skull, look into that");
                    }
                } else if (crotches() == 0 ){
                    crotches_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a hobo crotch")){
                        abort ("Richard failed to get crotches, look into that");
                    }
                } else if (skins() == 0 ){
                    skins_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a hobo skin")){
                        abort ("Richard failed to get skins, look into that");
                    }
                }
                set_auto_attack(0);
                set_property("currentMood", "boots");
                if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                    abort ("It appears you lost the last combat, look into that");
                }
                if (mapimage() >= 12){
                    break;
                }
            } until (min(boots(), eyes(), guts(), skulls(), crotches(), skins()) >= 1);
        }
    }
    print ("Town Square image is currently at " + mapimage(), "blue");
    print(scobo_used + " scarehobos used, average is " + floor(1375-manual_hobos_killed)/8, "blue");
    if (mapimage() == 12 && get_property("tent_stage") != "stage1"){
        set_property("tent_stage","started");
        int scobo_to_use = 0;
        if (get_property("scobo_needed") != ""){
            if ((min(11,boots())+min(11,eyes())+min(11,guts())+min(11,skulls())+min(11,crotches())+min(11,skins()))>=60){
                scobo_to_use += 11;
                set_property("scobo_needed","11");
            } else if ((min(10,boots())+min(10,eyes())+min(10,guts())+min(10,skulls())+min(10,crotches())+min(10,skins()))>=44){
                scobo_to_use += 10;
                set_property("scobo_needed","10");
            } else if ((min(9,boots())+min(9,eyes())+min(9,guts())+min(9,skulls())+min(9,crotches())+min(9,skins()))>=28){
                scobo_to_use += 9;
                set_property("scobo_needed","9");
            } else if ((min(8,boots())+min(8,eyes())+min(8,guts())+min(8,skulls())+min(8,crotches())+min(8,skins()))>=12){
                scobo_to_use += 8;
                set_property("scobo_needed","8");
            } else {
                scobo_to_use += 7;
                set_property("scobo_needed","7");
            }
        } else {
            scobo_to_use = to_int(get_property("scobo_needed"));
        }
        while (boots() < scobo_to_use){
            boots_prep();
            adventure(1, $location[Hobopolis Town Square] );
            if (!contains_text(LastAdvTxt(), "Richard takes a charred hobo boots")){
                abort ("Richard failed to get boots, look into that");
            }
        }
        while (eyes() < scobo_to_use){
            eyes_prep();
            adventure(1, $location[Hobopolis Town Square] );
            if (!contains_text(LastAdvTxt(), "Richard takes a frozen hobo eyeballs")){
                abort ("Richard failed to get eyes, look into that");
            }
        }
        while (guts() < scobo_to_use){
            guts_prep();
            adventure(1, $location[Hobopolis Town Square] );
            if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                abort ("Richard failed to get guts, look into that");
            }
        }
        while (skulls() < scobo_to_use){
            skulls_prep();
            adventure(1, $location[Hobopolis Town Square] );
            if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                abort ("Richard failed to get guts, look into that");
            }
        }
        while (crotches() < scobo_to_use){
            crotches_prep();
            adventure(1, $location[Hobopolis Town Square] );
            if (!contains_text(LastAdvTxt(), "Richard takes a hobo crotch")){
                abort ("Richard failed to get crotches, look into that");
            }
        }
        while (skins() < scobo_to_use){
            skins_prep();
            adventure(1, $location[Hobopolis Town Square] );
            if (!contains_text(LastAdvTxt(), "Richard takes a hobo skin")){
                abort ("Richard failed to get skins, look into that");
            }
        }
        set_auto_attack(0);
        set_property("currentMood", "boots");
        set_property("scobo_needed","");
        richard = visit_url("clan_hobopolis.php?place=3&action=talkrichard&whichtalk=3");
        visit_url("clan_hobopolis.php?preaction=simulacrum&place=3&qty="+scobo_to_use);
        set_property("tent_stage", "stage1");
    }
    if (mapimage() == 12 && get_property("tent_stage") == "stage1"){
        while (tent_open() == false){
            if ( boots() == min(boots(), eyes(), guts(), skulls(), crotches(), skins())){
                boots_prep();
                adventure(1, $location[Hobopolis Town Square] );
                if (!contains_text(LastAdvTxt(), "Richard takes a charred hobo boots")){
                    abort ("Richard failed to get boots, look into that");
                }
            } else if (eyes() == min(boots(), eyes(), guts(), skulls(), crotches(), skins())){
                eyes_prep();
                adventure(1, $location[Hobopolis Town Square] );
                if (!contains_text(LastAdvTxt(), "Richard takes a frozen hobo eyeballs")){
                    abort ("Richard failed to get eyes, look into that");
                }
            } else if (guts() == min(boots(), eyes(), guts(), skulls(), crotches(), skins())) {
                guts_prep();
                adventure(1, $location[Hobopolis Town Square] );
                if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                    abort ("Richard failed to get guts, look into that");
                }
            } else if (skulls() == min(boots(), eyes(), guts(), skulls(), crotches(), skins()) ) {
                skulls_prep();
                adventure(1, $location[Hobopolis Town Square] );
                if (!contains_text(LastAdvTxt(), "Richard takes a creepy hobo skull")){
                    abort ("Richard failed to get skull, look into that");
                }
            } else if (crotches() == min(boots(), eyes(), guts(), skulls(), crotches(), skins()) ){
                crotches_prep();
                adventure(1, $location[Hobopolis Town Square] );
                if (!contains_text(LastAdvTxt(), "Richard takes a hobo crotch")){
                    abort ("Richard failed to get crotches, look into that");
                }
            } else if (skins() == min(boots(), eyes(), guts(), skulls(), crotches(), skins()) ){
                skins_prep();
                adventure(1, $location[Hobopolis Town Square] );
                if (!contains_text(LastAdvTxt(), "Richard takes a hobo skin")){
                    abort ("Richard failed to get skins, look into that");
                }
            }
            set_auto_attack(0);
            set_property("currentMood", "boots");
            if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                abort ("It appears you lost the last combat, look into that");
            }
        }
        set_property ("tent_stage", "finished");
    }
} else {
    repeat{
        if (tent_open() == false){
            print("Tent not opened yet, waiting for designated person to open it");
            wait (5);
        }
    } until (tent_open() == true);
}

repeat{
    if (tent_open() == true){
        if (my_class() == $class[seal clubber] && get_property("is_mosher") != "true") {
            if (equipped_item($slot[off-hand]) != $item[sealskin drum]);
            set_ccs ("cleesh free runaway");
            cli_execute("maximize -combat; equip sealskin drum");
        }
        if (my_class() == $class[turtle tamer] && get_property("is_mosher") != "true") {
            if (equipped_item($slot[off-hand]) != $item[washboard shield]);
            set_ccs ("cleesh free runaway");
            cli_execute("maximize -combat; equip washboard shield");
        }
        if (my_class() == $class[pastamancer] && get_property("is_mosher") != "true") {
            if (equipped_item($slot[off-hand]) != $item[spaghetti-box banjo]);
            set_ccs ("cleesh free runaway");
            cli_execute("maximize -combat; equip spaghetti-box banjo");
        }
        if (my_class() == $class[sauceror] && get_property("is_mosher") != "true") {
            if (equipped_item($slot[off-hand]) != $item[marinara jug]);
            set_ccs ("cleesh free runaway");
            cli_execute("maximize -combat; equip marinara jug");
        }
        if (my_class() == $class[disco bandit]&& get_property("is_mosher") != "true") {
            if (equipped_item($slot[off-hand]) != $item[makeshift castanets]);
            set_ccs ("cleesh free runaway");
            cli_execute("maximize -combat; equip makeshift castanets");
        }
        if (my_class() == $class[accordion thief] && get_property("is_mosher") != "true") {
            if (equipped_item($slot[off-hand]) != $item[left-handed melodica]);
            set_ccs ("cleesh free runaway");
            cli_execute("maximize -combat; equip left-handed melodica");
        }
        if (get_property("is_mosher") == "true"){
            set_ccs ("cleesh free runaway");
            cli_execute("maximize -combat");
        }
        int TS_noncom = 0;
        string town_square = visit_url("adventure.php?snarfblat=167");
        matcher matcher_TS_noncom = create_matcher("whichchoice value=(\\d+)", town_square); 
        if(matcher_TS_noncom.find()){
            TS_noncom += to_int(matcher_TS_noncom.group(1));
        } else {
            run_combat();
        }  
        if (TS_noncom == 272){
            print("At marketplace");
            run_choice(2);
        } 
        if (TS_noncom == 225){
            cli_execute("/hobopolis tented");
            while (to_int(get_property("people_tented")) < 7 ){
                print("At tent, waiting until everyone is at tent", "blue");
                print("If there is an incorrect count on the number of at tent, type \"set people_tented = #\"", "blue");
                wait(10);
            }
            if (get_property("is_mosher") != "true"){
                run_choice(1);
                cli_execute("/hobopolis staged");
                while (get_property("moshed") == "true" ){
                    print("At tent, waiting for others to stage and mosher", "blue");
                    wait(10);
                }
                run_choice(1);
                cli_execute("/hobopolis offstage");
            }
            if(get_property("is_mosher") == "true"){
                while (to_int(get_property("people_staged")) < 6 ){
                    print("At tent, waiting until everyone is staged before moshing", "blue");
                    print("If there is an incorrect count on the number of people staged, type \"set people_staged = #\"", "blue");
                    wait(10);
                }
                run_choice(2);
                run_choice(2);
                cli_execute("/hobopolis moshed");
            }
        }
    }
    if (tent_open() == false){
        while (to_int(get_property("people_unstaged")) < 6){
            print("waiting for everyone to get off stage");
            wait (5);
        }
        set_property("people_tented", "0");
        set_property("people_staged", "0");
        set_property("people_unstaged", "0");
        set_property("moshed", "false");
        if (get_property("parts_collection") == "scarehobo"){
            if (get_property("tent_stage") != "stage1"){
                set_property("tent_stage","started");
                int scobo_to_use = 0;
                if (get_property("scobo_needed") != ""){
                    if (min(10,boots())+min(10,eyes())+min(10,guts())+min(10,skulls())+min(10,crotches())+min(10,skins())>=60){
                        scobo_to_use += 10;
                        set_property("scobo_needed","10");
                    } else if ((min(9,boots())+min(9,eyes())+min(9,guts())+min(9,skulls())+min(9,crotches())+min(9,skins()))>=44){
                        scobo_to_use += 9;
                        set_property("scobo_needed","9");
                    } else if ((min(8,boots())+min(8,eyes())+min(8,guts())+min(8,skulls())+min(8,crotches())+min(8,skins()))>=28){
                        scobo_to_use += 8;
                        set_property("scobo_needed","8");
                    } else if ((min(7,boots())+min(7,eyes())+min(7,guts())+min(7,skulls())+min(7,crotches())+min(7,skins()))>=12){
                        scobo_to_use += 7;
                        set_property("scobo_needed","7");
                    } else {
                        scobo_to_use += 6;
                        set_property("scobo_needed","6");
                    }
                } else {
                    scobo_to_use = to_int(get_property("scobo_needed"));
                }
                while (boots() < scobo_to_use){
                    boots_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a charred hobo boots")){
                        abort ("Richard failed to get boots, look into that");
                    }
                }
                while (eyes() < scobo_to_use){
                    eyes_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a frozen hobo eyeballs")){
                        abort ("Richard failed to get eyes, look into that");
                    }
                }
                while (guts() < scobo_to_use){
                    guts_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                        abort ("Richard failed to get guts, look into that");
                    }
                }
                while (skulls() < scobo_to_use){
                    skulls_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    string LastAdvTxt() {
                        string lastlog = session_logs(1)[0];
                        int nowmark = max(last_index_of(lastlog,"["+my_turncount()+"]"),last_index_of(lastlog,"["+(my_turncount()+1)+"]"));
                        return substring(lastlog,nowmark);
                    }
                    if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                        abort ("Richard failed to get guts, look into that");
                    }
                    if (skulls() >= scobo_to_use){
                        break;
                    }
                }
                while (crotches() < scobo_to_use){
                    crotches_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a hobo crotch")){
                        abort ("Richard failed to get crotches, look into that");
                    }
                }
                while (skins() < scobo_to_use){
                    skins_prep();
                    adventure(1, $location[Hobopolis Town Square] );
                    if (!contains_text(LastAdvTxt(), "Richard takes a hobo skin")){
                        abort ("Richard failed to get skins, look into that");
                    }
                }
                set_auto_attack(0);
                set_property("currentMood", "boots");
                set_property("scobo_needed","");
                richard;
                visit_url("clan_hobopolis.php?preaction=simulacrum&place=3&qty="+scobo_to_use);
                set_property("tent_stage", "stage1");
            }
            if (get_property("tent_stage") == "stage1"){
                while (tent_open() == false){
                    if ( boots() == min(boots(), eyes(), guts(), skulls(), crotches(), skins())){
                        boots_prep();
                        adventure(1, $location[Hobopolis Town Square] );
                        if (!contains_text(LastAdvTxt(), "Richard takes a charred hobo boots")){
                            abort ("Richard failed to get boots, look into that");
                        }
                    } else if (eyes() == min(boots(), eyes(), guts(), skulls(), crotches(), skins())){
                       eyes_prep();
                        adventure(1, $location[Hobopolis Town Square] );
                        if (!contains_text(LastAdvTxt(), "Richard takes a frozen hobo eyeballs")){
                            abort ("Richard failed to get eyes, look into that");
                        }
                    } else if (guts() == min(boots(), eyes(), guts(), skulls(), crotches(), skins())) {
                        guts_prep();
                        adventure(1, $location[Hobopolis Town Square] );
                        if (!contains_text(LastAdvTxt(), "Richard takes a stinking hobo guts")){
                            abort ("Richard failed to get guts, look into that");
                        }
                    } else if (skulls() == min(boots(), eyes(), guts(), skulls(), crotches(), skins()) ) {
                        skulls_prep();
                        adventure(1, $location[Hobopolis Town Square] );
                        if (!contains_text(LastAdvTxt(), "Richard takes a creepy hobo skull")){
                            abort ("Richard failed to get skull, look into that");
                        }
                    } else if (crotches() == min(boots(), eyes(), guts(), skulls(), crotches(), skins()) ){
                        crotches_prep();
                        adventure(1, $location[Hobopolis Town Square] );
                        if (!contains_text(LastAdvTxt(), "Richard takes a hobo crotch")){
                            abort ("Richard failed to get crotches, look into that");
                        }
                    } else if (skins() == min(boots(), eyes(), guts(), skulls(), crotches(), skins()) ){
                        skins_prep();
                        adventure(1, $location[Hobopolis Town Square] );
                        if (!contains_text(LastAdvTxt(), "Richard takes a hobo skin")){
                            abort ("Richard failed to get skins, look into that");
                        }
                    }
                    set_auto_attack(0);
                    set_property("currentMood", "boots");
                    if (num_mosh() >= 8 && min(boots(), eyes(), guts(), skulls(), crotches(), skins()) >= 1){
                        visit_url("clan_hobopolis.php?preaction=simulacrum&place=3&qty="+ min(boots(), eyes(), guts(), skulls(), crotches(), skins()));
                    }
                    if (get_property("_lastCombatLost") == "true"){ //KoL Mafia detected that the last combat was lost so that the script is aborted and a whole bunch of adventures aren't wasted
                        abort ("It appears you lost the last combat, look into that");
                    }
                }
                set_property ("tent_stage", "finished");
            }
        } else {
            while (tent_open() == false || mapimage() < 25) {
                print("Waiting for tent to open");
                wait (10);
            }
        }
    }
} until (mapimage() >= 25);

if (get_property("initialized") != "1"){
    set_property("initialized" ,"1");
    set_property("chatbotScript", get_property("chatbotScriptStorage"));
    set_auto_attack(0);
    set_property("currentMood", "boots");
}
