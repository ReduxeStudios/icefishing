onClipEvent(enterFrame){
   if(_parent.kickerLeftMove == true)
   {
      this._x += 4;
   }
   if(this._x > 1000)
   {
      this._x = -300;
      _parent.kickerLeftMove = false;
   }
}
