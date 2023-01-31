"The Game" by Valentina Tucelj

Release along with an interpreter.
Release along with a website.
Release along with the introductory booklet.

Use American dialect.

[**************Općenito*************]
When play begins:
	say "Pronađi sve tragove koje ti je mama ostavila i obavi potrebne zadatke kako bi ti dozvolila da ideš kod prijatelja. Ne zaboravi, igrat ćete igrice pa moraš ponijeti i jednu svoju."; 
	now the time of day is 11:00 am;
	now the right hand status line is "[time of day]";

After reading a command:
	let T be text;
	let T be the player's command;
	replace the regular expression "pregledaj" in T with "examine";
	replace the regular expression "uzmi" in T with "take";
	replace the regular expression "procitaj poruku" in T with "take mobitel";
	replace the regular expression "sto nosim" in T with "inventory";
	replace the regular expression "idi sjeverno" in T with "go north";
	replace the regular expression "idi juzno" in T with "go south";
	replace the regular expression "idi istocno" in T with "go east";
	replace the regular expression "idi zapadno" in T with "go west";
	replace the regular expression "pusti" in T with "drop";
	replace the regular expression "otvori" in T with "open";
	replace the regular expression "stavi" in T with "put";
	replace the regular expression " iz " in T with " from ";
	replace the regular expression " u " in T with " in ";
	replace the regular expression " s " in T with " with ";
	replace the regular expression " o " in T with " about ";
	replace the regular expression "pitaj" in T with "ask";
	replace the regular expression "otkljucaj" in T with "unlock";
	replace the regular expression "daj stolcic mami" in T with "give stolcic to Mama";
	replace the regular expression "daj knjigu mami" in T with "give knjigu to Mama";
	change the text of the player's command to T.
	
Instead of taking inventory:
	let sadrzaj be the list of things carried by the player;
	if the number of entries in sadrzaj is 0:
		say "Ne nosiš još ništa!";
	otherwise:
		say "Ti nosiš:[line break]";
		repeat with Z running through sadrzaj:
			say "[Z], ".
	
After taking something:
	say "[noun] - Uzeto!".
	
The carrying capacity of the player is 4.

[*****Tvoja soba*****]
The Tvoja soba is a room. "[if unvisited][bold type]11 je sati, još samo 3 sata dijele te od druženja s prijateljima. Tvoja stara Nokia je negdje na radnom stolu ispod hrpe razbacane odjeće.  Kupaonica je sjeverno od hodnika koji je sjeverno od tvoje sobe.[roman type][otherwise]Što si zaboravio u sobi?"

Before going to the Tvoja soba:
	if the player is in the Hodnik:
		if the majica is not carried by the player:
			if the velika vrecica is carried by the player:
				if  the majica is not in the velika vrecica:
					say "Ne možeš natrag u sobu!";
					stop the action;
			otherwise:
				say "Ne možeš natrag u sobu!";
				stop the action;
		if the potkosulja is not carried by the player:
			if the velika vrecica is carried by the player:
				if the potkosulja is not in the velika vrecica:
					say "Ne možeš natrag u sobu!";
					stop the action;
			otherwise:
				say "Ne možeš natrag u sobu!";
				stop the action.

[Velika vrecica]
The velika vrecica is an open container in the Tvoja soba. "Velika vrećica je u kutu jer ti možeš nositi samo 4 stvari odjednom."The velika vrecica is a player's holdall.Understand "veliku vrecicu", "vrecica", "vrecice" and "vrecicu" as velika vrecica.

Instead of examining velika vrecica:
	let sad be the list of things in the noun;
	if the number of entries in sad is 0:
		say "Nemaš ništa u vrećici!";
	otherwise:
		say "U velikoj vrećici su:  ";
		repeat with Z running through sad:
			say "[Z], "
			
After inserting something into velika vrecica:
	say "[noun] je sada u velikoj vrećici."

[Ormar]
The ormar is an open container in the Tvoja soba."Ormar je prepun robe, no ima još nešto mjesta u njemu."

Before inserting something into ormar:
	if the noun is not carried by the player:
		say "Ne možeš staviti u ormar nešto što još nisi uzeo! Možda ti je u vrećici pa moraš prvo izvaditi.";
		stop the action;
	if the noun is the majica:
		say "Majica je prljava. Treba na pranje.";
		stop the action;
	if the noun is the potkosulja:
		say "Potkošulja je prljava. Treba na pranje.";
		stop the action.

After inserting something into ormar:
	if the noun is the hlace:
		say "[noun] su sad u ormaru";
	otherwise:
		say "[noun] je sad u ormaru."

[Radni stol]
The radni stol is a supporter in the Tvoja soba.The radni stol is scenery. Understand "stolic" and "razbacani radni stol" as radni stol.
Instead of examining radni stol:
	let sad be the list of things on the noun;
	say "Na radnom stolu su:  ";
	repeat with Z running through sad:
		say "[Z], "	

[Odjeca]
The majica is on the radni stol. "Prljava majica je na radnom stolu."Understand "majicu", "prljavu majicu" and "prljava majica" as majica.
The hlace is on the radni stol. "Hlače su na radnom stolu."
The potkosulja is on the radni stol. "Prljava potkošulja je na radnom stolu."Understand "potkosulju", "prljavu potkosulju" and "prljava potkosulja" as potkosulja.
The jakna is on the radni stol. "Jakna je na radnom stolu."Understand "jaknu" as jakna.
The pulover is on the radni stol. "Pulover je na radnom stolu."

[Mobitel]
The mobitel is on the radni stol."[if unvisited]Mobitel ti je zazvonio. Izgleda da ti je stigla poruka. Bilo bi dobro da je pročitaš, ali najprije se moraš nekako riješiti hrpe robe koja je na njemu.[otherwise] ."Understand "Nokia", "stara Nokia" and "stari mobitel" as mobitel.
Instead of taking mobitel:
	if majica is on the radni stol:
		say "Ne možeš do mobitela jer je majica na stolu. Makni svu odjeću najprije.";
	if hlace is on the radni stol:
		say "Ne možeš do mobitela jer su hlače na stolu. Makni svu odjeću najprije.";
	if potkosulja is on the radni stol:
		say "Ne možeš do mobitela jer je potkošulja na stolu. Makni svu odjeću najprije.";
	if jakna is on the radni stol:
		say "Ne možeš do mobitela jer je jakna na stolu. Makni svu odjeću najprije.";
	if pulover is on the radni stol:
		say "Ne možeš do mobitela jer je pulover na stolu. Makni svu odjeću najprije.";
	otherwise:
		continue the action.
		
After taking mobitel:
	say "Nova poruka od MAMA: Prije druženja s prijateljima zadatke je potrebno obaviti, najbolje da kreneš od svoje sobe i čistu spremiš u ormar, a prljavu robu odneseš na pranje."


[*****Hodnik*****]
The Hodnik is a room.The Hodnik is north of the Tvoja soba.The description is "[bold type]Sjeverno vidiš kupaonicu, a istočno kuhinju. Ako nosiš prljavo rublje idi u kupaonicu, inače idi u kuhinju.[roman type]"

Before going to the Hodnik:
	if the player is in the Tvoja soba:
		if the majica is not carried by the player:
			if the velika vrecica is carried by the player:
				if  the majica is not in the velika vrecica:
					say "Prljavu majicu moraš nositi na pranje u Kupaonicu koja je sjeverno od hodnika.";
					stop the action;
			otherwise:
				say "Prljavu majicu moraš nositi na pranje u Kupaonicu koja je sjeverno od hodnika.";
				stop the action;
		if the potkosulja is not carried by the player:
			if the velika vrecica is carried by the player:
				if the potkosulja is not in the velika vrecica:
					say "Potkošulja je prljava i treba ju odnijeti na pranje u kupaonicu koja je sjeverno od hodnika.";
					stop the action;
			otherwise:
				say "Potkošulja je prljava i treba ju odnijeti na pranje u kupaonicu koja je sjeverno od hodnika.";
				stop the action;
		if the mobitel is not carried by the player:
			say "Nisi pročitao poruku na mobitelu.";
			stop the action;
		if the hlace is not in the ormar:
			say "Nisi pospremio hlače u ormar.";
			stop the action;
		if the jakna is not in the ormar:
			say "Nisi pospremio jaknu u ormar";
			stop the action;
		if the pulover is not in the ormar:
			say "Nisi pospremio pulover u ormar.";
			stop the action;
	otherwise:
		if the majica is carried by the player:
			say "Nisi ostavio majicu na pranje!";
			stop the action;
		if the potkosulja is carried by the player:
			say "Nisi ostavio potkosulju na pranje!";
			stop the action;
		if the velika vrecica is carried by the player:
			if the majica is in the velika vrecica:
				say "Nisi ostavio majicu na pranje!";
				stop the action;
			if the potkosulja is in the velika vrecica:
				say "Nisi ostavio potkosulju na pranje!";
				stop the action.

[*****Kupaonica*****]
The Kupaonica is a room.The Kupaonica is north of the Hodnik.The description is "[bold type]U kutu vidiš veliku košaru za prljavo rublje.[roman type]"

[Košara]
The velika kosara is an open container in the Kupaonica.The velika kosara is scenery.Understand "kosara", "kosaru", "kosare" and "veliku kosaru" as velika kosara.

Before inserting something into velika kosara:
	if the noun is not carried by the player:
		say "Ne možeš staviti u košaru nešto što nisi uzeo! Možda ti je u vrećici pa moraš prvo izvaditi.";
		stop the action;
	if the noun is the mobitel:
		say "To ne treba na pranje.";
		stop the action;
	if the noun is the velika vrecica:
		say "To ne treba na pranje.";
		stop the action.

After inserting something into velika kosara:
	say "[noun] je sad u košari za pranje."

[*****Kuhinja*****]
The Kuhinja is a room.The Kuhinja is east of the Hodnik. The description is "[bold type ]U kuhinji je mama. Pitaj je za sljedeći zadatak.[roman type]."

[Mama]
Mama is a woman in the Kuhinja. "Mama je niska i stoji kod velikog kuhinjskog stola."Understand "mamu" as mama.

Table of Mama Responses
Opcija	Odgovor
1	"Dodaj mi stolčić"
2	"Dodaj mi knjigu s receptima"
3	"Kosilica je u garaži koja je istočno, treba pokositi travu! Nju čuva TAJNA."

Instead of giving something to Mama:
	if the noun is the stolcic:
		say "Mama sad stoji na stolčiću da bude viša.";
		remove the stolcic from play;
	if the noun is the knjiga:
		say "Mama sad ima svoju knjigu s receptima!";
		remove the knjiga from play.

After asking Mama about something:
	if the stolcic is in the Kuhinja:
		say "[Odgovor corresponding to the Opcija of 1 in the Table of Mama Responses].";
	if the stolcic is not in the Kuhinja:
		if the knjiga is on the kuhinjski stol:
			say "[Odgovor corresponding to the Opcija of 2 in the Table of Mama Responses].";
	if the stolcic is not in the Kuhinja:
		if the knjiga is not on the kuhinjski stol:
			say "[Odgovor corresponding to the Opcija of 3 in the Table of Mama Responses]".		

[Kuhinjski stol]
The kuhinjski stol is a supporter in the Kuhinja.The kuhinjski stol is scenery. Understand "veliki stol" as kuhinjski stol.
Instead of examining kuhinjski stol:
	let sad be the list of things on the noun;
	say "Na kuhinjskom stolu su:  ";
	repeat with Z running through sad:
		say "[Z], "	
		
[Knjiga]
The knjiga is on the kuhinjski stol. "Knjiga s receptima za kolače je na stolu."Understand "kuharica", "knjigu s receptima", "knjiga s receptima" and "knjigu" as knjiga.

[Stolčić]
The stolcic is a thing. The stolcic is in the Kuhinja."Maleni stolčić je u kuhinji."

[*****Garaža*****]
The Garaza is a room.The Garaza is east from the Kuhinja. The description is "[bold type]Tamo južno u dvorištu vidiš da je već stvarno visoka trava.[roman type]"

Before going to the Garaza:
	if the stolcic is in the Kuhinja:
		say "Nisi ispunio mamine zadatke.";
	if the stolcic is not in the Kuhinja:
		if the knjiga is on the kuhinjski stol:
			say "Nisi ispunio mamine zadatke.";

[Kosilica]
The kosilica is a thing in the Garaza."Kosilica je nasred garaže."Understand "kosilicu" as kosilica.

Instead of taking kosilica:
	now the command prompt is "Lozinka: ".
	
After reading a command when the command prompt is "Lozinka: ":
	if the player's command matches "TAJNA":
		say "Odlično! Kosilica je tvoja.Sada guraj kosilicu prema dvorištu!";
		move the kosilica to the player;
	otherwise:
		say "Kriva lozinka!";
	now the command prompt is ">";
	reject the player's command.


[*****Dvorište*****]
The Dvoriste is a room.The Dvoriste is south from the Garaza.The description is "[bold type]Vidiš plava vrata koja te vode zapadno u predvorje. Trava je stvarno visoka, ali možeš li istog trena početi s košnjom? Izgleda da se mačka neće samo tako maknuti.[roman type]"

[Vrata i  Tajni ključ]
The plava vrata is a door.The plava vrata is west from the Dvoriste and east from the Predvorje.The plava vrata is scenery.The plava vrata is lockable and locked.
The tajni kljuc unlocks the plava vrata."Tajni ključ krije visoka trava. Kad je pokosiš možda ga nađeš."The tajni kljuc is in the Dvoriste.Understand "tajnim kljucem" as tajni kljuc.

After unlocking the plava vrata with the tajni kljuc:
	say "Otključao si plava vrata. Sada možeš zapadno u predvorje.".
	
After opening the plava vrata:
	say "Otvorio si plava vrata!".

After reading a command:
	if the player is in the Dvoriste and the macka is in the Dvoriste:
		if the player's command matches "9":
			say "Bravo. Točno si odgovorio na moje pitanje. Možeš nastaviti s košnjom.";
			remove the macka from play;
			stop the action;
		otherwise:
			say "[bold type]Mačka: [roman type]Još uvijek nisi točno odgovorio na moje pitanje!";
			stop the action;
	otherwise:	
		if the player's command matches "pokosi dvoriste":
			if the kosilica is carried by the player:
				say "Trebalo ti je 30 minuta da pokosiš dvorište. Tajni ključ sad je u tvojim rukama. Bilo bi dobro da odeš u predvorje po igricu.";
				now the time of day is 30 minute after the time of day;
				remove the kosilica from play;
				move the tajni kljuc to the player;
				stop the action;
			otherwise:
				say "Izgleda da je trava već pokošena!";
				stop the action;
		if the player's command matches "pokosi travu":
			if the kosilica is carried by the player:	
				say "Trebalo ti je 30 minuta da pokosiš dvorište.Tajni ključ sad je u tvojim rukama. Bilo bi dobro da odeš u predvorje po igricu.";
				now the time of day is 30 minute after the time of day;
				remove kosilica from play;
				move the tajni kljuc to the player;
				stop the action;
			otherwise:
				say "Izgleda da je trava već pokošena!";
				stop the action.

[Mačka]
The macka is an animal in the Dvoriste."[bold type]Mačka: [roman type]Maknut ću se samo ako mi odgovoriš točno na moje pitanje. Koliko života mačke imaju?"

[*****Predvorje*****]
The Predvorje is a room."Bravo, tek je [1 minute after the time of day], a ti si već obavio sve zadatke."

[Igrica]
The igrica is a thing in the Predvorje."Tvoja omiljena igrica je spremna za druženje s prijateljima."Understand "igricu" as igrica.

After taking the igrica:
	say "Izgleda da si obavio sve zadatke i da smiješ na igranje kod prijatelja. [bold type]Igra je završena.[roman type]";
	end the story.

[***************Testiranja***************]
[Uspješan završetak]
Test me with "uzmi vrecicu/uzmi majicu/uzmi hlace/uzmi potkosulju/uzmi jaknu/uzmi pulover/procitaj poruku/stavi pulover u ormar/stavi jaknu u ormar/uzmi hlace iz vrecice/stavi hlace u ormar/idi sjeverno/idi sjeverno/uzmi majicu iz vrecice/stavi majicu u kosaru/uzmi potkosulju iz vrecice/stavi potkosulju u kosaru/idi juzno/idi istocno/pitaj mamu o sljedecem zadatku/daj stolcic mami/pitaj mamu o sljedecem zadatku/daj knjigu mami/pitaj mamu o sljedecem zadatku/idi istocno/uzmi kosilicu/TAJNA/idi juzno/pokosi travu/9/pokosi travu/sto nosim/otkljucaj plava vrata s tajnim kljucem/otvori plava vrata/idi zapadno/uzmi igricu".