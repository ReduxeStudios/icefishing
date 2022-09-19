onClipEvent(enterFrame){
   if(this._currentframe > 1)
   {
      if(_parent.hook._currentframe == 5)
      {
         _parent.bigFishHit();
      }
   }
}
