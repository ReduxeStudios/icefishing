onClipEvent(enterFrame){
   if(_parent.fishCaught < 60)
   {
      if(_parent.levelBlock == false && _parent.gameRunning == true)
      {
         _parent.gameSpeed();
      }
   }
   _parent.endOfLevel(1,5,com.clubpenguin.util.LocaleText.getText("ingame_jellyfish"));
   _parent.endOfLevel(2,19,com.clubpenguin.util.LocaleText.getText("ingame_sharks"));
   _parent.endOfLevel(3,37,com.clubpenguin.util.LocaleText.getText("ingame_crabs"));
   if(_parent.fishCaught == 60)
   {
      if(_parent.bigFish._currentframe == 1)
      {
         _parent.bigFishApproach.play();
      }
   }
}
