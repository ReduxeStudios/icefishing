onClipEvent(enterFrame){
   if(_parent.sharkRightMove == true)
   {
      this._x -= 12;
      _parent.sharkRightDist();
   }
   if(this._x < -700)
   {
      this._x = 1000;
      _parent.sharkRightMove = false;
      _parent.sharkActive = false;
   }
}
