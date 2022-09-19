onClipEvent(load){
   if(_parent._parent.grayFishMode)
   {
      this.fishNum.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_yellowfishscore",[_parent._parent.orangeFishTotal,_parent._parent.orangeFishTotal * 4]) + "\n" + com.clubpenguin.util.LocaleText.getTextReplaced("ingame_grayfishscore",[_parent._parent.grayFishTotal,_parent._parent.grayFishTotal * 8]) + "\n" + com.clubpenguin.util.LocaleText.getText("ingame_bigfishscore") + "\n" + com.clubpenguin.util.LocaleText.getTextReplaced("ingame_totalcoins",[_parent._parent.orangeFishTotal * 4 + _parent._parent.grayFishTotal * 8 + 100]);
   }
   else
   {
      this.fishNum.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_yellowfishscore",[_parent._parent.fishCaught,_parent._parent.fishCaught * 4]) + "\n" + com.clubpenguin.util.LocaleText.getText("ingame_bigfishscore") + "\n" + com.clubpenguin.util.LocaleText.getTextReplaced("ingame_totalcoins",[_parent._parent.fishCaught * 4 + 100]);
   }
}
