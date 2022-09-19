onClipEvent(enterFrame){
   if(_parent.kickerRightMove == true)
   {
      this._x -= 4;
   }
   if(this._x < -300)
   {
      this._x = 1000;
      _parent.kickerRightMove = false;
   }
}
