# balatro-separators
tools to separate balatro card spritesheets into their own png files

used for printing the irl red deck i made for us and renko in october 2024

they're all love2d apps, grab the [latest version of love2d](https://love2d.org) then start one of these folders and it'll pop up an explorer window when its done

## photosensitivity warning
due to how these tools are coded they will create a giant goddamn window and begin brightly flashing through all the card sprites very quickly. if you're photosensitive look away for about 40 seconds after starting it

## how do i use this?
_all resource file paths are relative to the Balatro data package, if you haven't already, extract the game by unzipping the exe with 7zip (yes, seriously)_
- joker_separator: place `resources/textures/2x/Jokers.png` into the `joker_separator` directory, then start the program within the directory with Love2D (`love .`)
- playing_card_separator: place `resources/textures/2x/Enhancers.png` and `resources/textures/2x/8BitDeck.png` into the `playing_card_separator` directory, then start the program within the directory with Love2D (`love .`)
- enhancer_separator: place `resources/textures/2x/Enhancers.png` into the `enhancer_separator` directory, then start the program within the directory with Love2D (`love .`)

## how do i tweak settings? what settings even are there to tweak?
idk man look at switches.lua

for reference, the red deck was rendered with `SCALE = 10`, `SCISSOR = 4`, `PRINT_BLEED_VALUE_HOR = 60` and `PRINT_BLEED_VALUE_VER = 96` 

## what the fuck is an enhancer?
'enhancers' are what balatro internally calls the parts of the card that aren't what i call the 'identity' (the rank and suit).
this comprises the card back, the backing for the edition type etc etc, all of that.
enhancer_separator will dump all of them, however playing_card_separator needs the enhancers too because the playing cards are actually two image files (the enhancer and the identity). that's why you need both files.

## why does it save in appdata?
love2d limitation. sorry

## licensing and copyright and whatnot
balatro is (c) 2024 by LocalThunk, published by Playstack Limited, no game files are provided within, whatever someone does with this tool isn't my problem

balatro-separators 2024 by sylvie nightshade, do whatever you want honestly, this code is released in the public domain