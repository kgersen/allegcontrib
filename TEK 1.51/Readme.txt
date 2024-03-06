TE's Kneeboard 1.51 Readme
=========================================

CoreTool has been updated based on your feedback, and has changed names to TEK: TE's Kneeboard.
As such, the focus has shifted from being an informational tool to an in-flight reference
similar to those strapped to pilots' knees.

I learned a lot while making this program, and I hope you learn just as much while using it.

Enjoy,

--Tigereye


Differences between TEK and CoreTool
====================================
1. TEK has been redesigned to fit side-by-side Allegiance running in an 800x600 window on 1024x768 desktops.
2. As such, the screens have been shrunk and rearranged to take up far less space
3. Addition of "Me" and "My Team" to aid in quick comparisons between you and them.
4. Damage calculations are now 100% accurate, taking into account all missiles, recharge rates and reload times.

Changes since last revision
===========================
-Fixed crash bug when firing turrets on a ship without primary weapons (Thanks Psylence)
-Fixed the accuracy slider. When the heck did this stop working? (Thanks Psylence)
-Fixed calculation bug where ships wouldn't "reload ammo", yielding incorrect TTKs
-Clicking in most places of the Comparison form now closes any open AngleChoosers. (Thanks Ksero)
-Aleph Resonators now work as in game: They don't inflict any damage, or contribute to 'Time To Kill" calculations. (Thanks Psylence, GreyVulpine)
-Added grey bars to help visually separate the 3 areas on the Comparison form
-DM/AC form now shows which DM or AC it's listing. (Thanks Noir)
-Fixed calculation bug when using a ship that had 0 energy by default (non-belters interceptors). (Thanks GreyVulpine)

Known Issues
============
- The "Load Last Played Core" algorithm doesn't work all the time...
	It currently grabs the core with the most recent access time.
	Allegiance accesses them all when launching, and depending on how it reads files, will read one of them last.
	I was hoping this would tell me the currently loaded core ingame, but it doesn't :(
- Checking research entries too quickly unchecks the previously checked one.
	That's a bug in the .NET control, it's registering it as a doubleclick and undoing the original click. Blame Microsoft.
- TEK will crash if it doesn't find its .dll files in its directory. This ain't a bug, just put all the files together in a single folder!!
- Some parts (LRM Hunter 3) *sometimes* appear twice in the parts menu.
	... no clue why
--------------------------------------------------------------------------------------------
Special thanks go out to everyone who helped me write and test this program, and offered suggestions.
-Ksero
-UKDude
-_Fox_Four
-Noir
-Spunkmeyer
-GreyVulpine
-Pook
-Noble
-Anguirel
-SRM_Petit_Mort
-Schnobs
-Idanmel
-Psylence
-Weedman
-InsanityBoy
-Da_Muck
-Ozzy
-Larask
