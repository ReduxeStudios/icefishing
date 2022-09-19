function init()
{
   var _loc3_ = _global.getCurrentShell();
   if(_loc3_.isItemOnMyPlayer(321))
   {
      trace("GRAY FISH MODE");
      grayFishMode = true;
   }
   else
   {
      grayFishMode = false;
   }
   if(STANDALONE)
   {
      com.clubpenguin.util.Loader.setLocaleVersion(undefined);
      com.clubpenguin.util.Loader.setLocale(undefined);
      com.clubpenguin.util.Loader.loadAllMovies(this,[]);
   }
   var listener = new Object();
   listener.onLoadComplete = function()
   {
      com.clubpenguin.util.Loader.removeEventListener(listener);
      gotoAndStop(2);
      listener.onLoadComplete = undefined;
   };
   com.clubpenguin.util.Loader.addEventListener(listener);
}
function addSound(clip, volume)
{
   if(volume == undefined)
   {
      volume = 100;
   }
   mySound = new Sound(this.soundInstance);
   mySound.setVolume(volume);
   mySound.attachSound(clip);
   mySound.start();
}
var STANDALONE = false;
if(!STANDALONE)
{
}
init();
stop();
this.createEmptyMovieClip("soundInstance",this.getNextHighestDepth());
