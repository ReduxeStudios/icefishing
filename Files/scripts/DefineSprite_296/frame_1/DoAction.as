fishNum.text = "0";
fish.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_fishies",[""]) + " ";
if(com.clubpenguin.util.LocaleText.getLocaleID() == com.clubpenguin.util.LocaleText.LANG_ID_FR)
{
   fish.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_fish",[""]) + " ";
}
stop();
