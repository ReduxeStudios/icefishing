onClipEvent(enterFrame){
   _parent.hookMove();
   if(this._y > 120)
   {
      _parent.hazardHit();
   }
}
