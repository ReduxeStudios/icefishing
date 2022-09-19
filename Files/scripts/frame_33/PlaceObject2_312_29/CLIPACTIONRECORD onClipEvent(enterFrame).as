onClipEvent(enterFrame){
   if(this._currentframe > 1)
   {
      trace("fishy " + _parent.greyMulletChance);
      if(_parent.greyMulletChance == 100)
      {
         this.obj.body.gotoAndStop(2);
         this.obj.head.gotoAndStop(2);
         this.obj.fin.gotoAndStop(2);
         trace("STAMP: AWARD Grey Mullet");
         com.clubpenguin.util.Stamp.sendStamp(3762);
      }
      if(_parent.hook._currentframe == 5)
      {
         _parent.bigFishHit();
      }
   }
}
