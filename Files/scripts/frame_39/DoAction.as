trace("CHECK FOR STAMPS");
trace("STAMP: AWARD Prize Mullet");
com.clubpenguin.util.Stamp.sendStamp(386);
trace("jellyFishHitCount = " + jellyFishHitCount);
trace("lineCutAmount = " + lineCutAmount);
trace("greyFishCaught = " + greyFishCaught);
trace("hasLostLife = " + hasLostLife);
if(jellyFishHitCount == 3)
{
   trace("STAMP: AWARD Shock King");
   com.clubpenguin.util.Stamp.sendStamp(374);
}
if(lineCutAmount == 3)
{
   trace("STAMP: AWARD Crab Cuts");
   com.clubpenguin.util.Stamp.sendStamp(380);
}
if(greyFishCaught >= 15 && hasLostLife == false)
{
   trace("STAMP: AWARD Ace Angler");
   com.clubpenguin.util.Stamp.sendStamp(390);
}
if(!hasLostLife)
{
   trace("STAMP: AWARD Worm Win");
   com.clubpenguin.util.Stamp.sendStamp(378);
}
if(getTimer() - startTime <= 300000 && fishCaught >= 63)
{
   trace("STAMP: AWARD Fly Fisher");
   com.clubpenguin.util.Stamp.sendStamp(388);
}
stop();
