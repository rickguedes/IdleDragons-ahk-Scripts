; this is designed around farming INSERT EVENT NAME HERE
; the framework can be reused for other campaigns
; the network can have some issues 

CoordMode, Mouse, Client

target = IdleDragons.exe

Gui, Add, text, , DUE TO THE NATURE OF EVENTS, THIS SCRIPT NEEDS TO BE MANUALLY ADJUSTED
Gui, Add, text, , The keystroke to start this script is CTRL+R`nThis does not change your active patron.
Gui, Add, text, , In the map, enable Hide Locked and Hide Completed.`nIn the adventure, set your level strategy to "UPG".
Gui, Add, text, , This script will load your 3rd saved formation, using the E hotkey.
Gui, Add, text, , This script assumes you have Deekin, Gromma, Sentry, Briv, Shandie, Minsc, and Hitch in the saved formation.`nThis script also assumes have familiars set in the saved formation.
Gui, Add, text, , Minutes per run (starts from setting last familiar):
Gui, Add, Edit, vDduration_in_minutes
Gui, Add, text, , Event Year to run?
Gui, Add, Edit, vDyearMultiplier
Gui, Add, Button, default, OK
Gui, Show
Return

GuiClose:
ButtonOK:
Gui, Submit 

duration_in_ms := (Dduration_in_minutes * 60 * 1000)

reset_yes_x = 550
reset_yes_y = 520

go_to_map_x = 650
go_to_map_y = 600

campaigns_x = 105
torm_y = 100
kelv_y = 165
helm_y = 230
tiamat_y = 295
event_y = 395

evt_x = 640
evt_y = 420

neverwinter_x = 500
neverwinter_y = 685

daggerford_x = 640
daggerford_y = 420

adventures_x = 400

pan_top_y = 110
pan_bot_y = 600

adventure_height = 90

ror_fp_y = 90 ; Ring of Regeneration free play
mw_fp_y = 180 ; Mad Wizard free play
y1_fp_y = 90

target_fp := (y1_fp_y + adventure_height * (DyearMultiplier - 1))

go_x = 800
go_y = 590

fam_box_x = 670
fam_box_y = 540

fam_out_x = 945
fam_in_x = 875
fam_far_x = 1015

fam_top_out_y = 260
fam_top_in_y = 330
fam_bot_in_y = 395
fam_bot_out_y = 465

upgrade_y = 700
swap_y = 580
click_x = 155
slot1_x = 245
slot1u_x = 335

shop_x = 75
shop_y = 85

spec2_choice_left = 510
spec2_choice_right = 765
spec2_choice_y = 575

spec3_choice_left = 385
spec3_choice_mid = 640
spec3_choice_middle = 640
spec3_choice_right = 900
spec3_choice_y = 575
spec3_cancel_x = 890
spec3_cancel_y = 110

charsheet_cancel_x = 1100
charsheet_cancel_y = 130

^r::
Loop
{
	test := WinExist("Idle Champions")
	if (test == 0)
	{
		ExitApp
	}
	else
	{
		
		; If you're looking this closely at the code, judge for yourself if running this script
		; as an Administrator is a worthwhile risk just to prevent you from hijacking yourself.

		BlockInput, On
		
		; RESET
		Sleep, 1
		WinActivate, Idle Champions
		Sleep, 1000
		Send r ;
		Sleep, 1000 ;
		Click %reset_yes_x%, %reset_yes_y% ;
		Sleep, 22000 ;
		Click %go_to_map_x%, %go_to_map_y% ;
		Sleep, 3000 ;
		Click %campaigns_x%, %torm_y% ; Switch to Grand Tour...
		Sleep, 500 ;
		Click %campaigns_x%, %event_y% ; ...and then back to the event (to reset the map)
		Sleep, 500 ;
		Click %evt_x%, %evt_y% ; The "map node" for the Event (UPDATE THIS LINE WHEN YOU USE THIS SCRIPT)
		Sleep, 1000 ;
		Click, %adventures_x%, %pan_top_y%, down ;
		Sleep, 500 ;
		Click, %adventures_x%, %pan_bot_y%, up ;
		Sleep, 500 ;		
		Click, %adventures_x%, %target_fp% ; Free Play marker
		Sleep, 500 ;
		Click %go_x%, %go_y%
		
		Sleep, 5000 ;
		Send e 
		
		Sleep, 8000
		Loop 9
		{
			Sleep, 200
			Click %slot1_x%, %upgrade_y% ;Deekin is eight upgrades off of Confidence in the Boss, requiring no Spec choice
		}
		Sleep, 200
		
		Click 360, %upgrade_y% ;Celeste
		Sleep, 200
		
		Loop 10
		{
			Sleep, 200
			Click 475, %upgrade_y% ; Gromma's spec choice (Mountain) helps her as tank
		}
		Sleep, 1000
		Click %spec3_choice_left%, %spec3_choice_y%
		Sleep, 1000
		Click %charsheet_cancel_x%, %charsheet_cancel_y%
		Sleep, 200
		
		Loop 16
		{
			Sleep, 200
			Click 590, %upgrade_y% ; Sentry is sixteen upgrades off of Echo's Will, requiring one spec choice
		}	
		Sleep, 1000
		Click %spec3_choice_mid%, %spec2_choice_y%
		Sleep, 1000
		Click %charsheet_cancel_x%, %charsheet_cancel_y%
		Sleep, 200
		
		
		Loop 8
		{
			Sleep, 200
			Click 705, %upgrade_y% ; Briv is seven upgrades off of Sprint, requiring no spec choice.
		}	
		
		Loop 18
		{
			Sleep, 200
			Click 820, %upgrade_y% ; Shandie is eighteen upgrades off of Ranger Training, requiring one spec choice
		}	
		Sleep, 1000
		Click %spec3_choice_left%, %spec2_choice_y%
		Sleep, 1000
		Click %charsheet_cancel_x%, %charsheet_cancel_y%
		Sleep, 200
		
		Loop 5
		{
			Sleep, 200
			Click 930, %upgrade_y% ; Minsc is four upgrades off of Boastful, requiring no spec choice.
		}	
		Sleep, 200
		
		Loop 8
		{
			Click 1050, %upgrade_y% ; Hitch
			Sleep, 200
		}
		Sleep, 1100
		Click %spec2_choice_left%, %spec2_choice_y%
		Sleep, 1100
		Click %charsheet_cancel_x%, %charsheet_cancel_y%
		
		Sleep, 200
		Send e 
		Sleep, 200
		Send {f down}
		Sleep, 200
		Click 1050, %upgrade_y%
		Sleep, 200
		Send {f up}
		Sleep, 1
		
		; Unblock input so the user can use their machine again.
		BlockInput, Off
		Sleep, %duration_in_ms%
	}
}
