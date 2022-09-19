onClipEvent(enterFrame){
   if(_parent.sharkLeftMove == true)
   {
      this._x += 12;
      _parent.sharkLeftDist();
   }
   if(this._x > 1500)
   {
      this._x = -100;
      _parent.sharkLeftMove = false;
      _parent.sharkActive = false;
   }
}
