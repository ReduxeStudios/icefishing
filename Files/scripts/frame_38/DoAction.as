function startTimer()
{
   timer_mc._visible = true;
   timerSeconds = Math.floor(trialTimer / 1000 % 60);
   timerMinutes = Math.floor(Math.floor(trialTimer / 1000) / 60);
   countdownTimer = setInterval(timerCountdown,1000);
}
function timerUpdate(minutes, seconds)
{
   if(isNaN(minutes) || isNaN(seconds))
   {
      return undefined;
   }
   if(minutes < 10)
   {
      minutes = "0" + minutes;
   }
   if(seconds < 10)
   {
      seconds = "0" + seconds;
   }
   trace(minutes + ":" + seconds);
   timer_mc.counter.text = minutes + ":" + seconds;
}
function timerCountdown()
{
   timerSeconds--;
   if(Number(timerMinutes) <= 0 && Number(timerSeconds) <= 0)
   {
      clearInterval(countdownTimer);
      timerUpdate(0,0);
      gameOver();
      gameOver_mc.gameOver.text = "YOU WIN!";
      return undefined;
   }
   if(timerSeconds == 59 || timerSeconds == 0)
   {
      timerMinutes--;
      timerSeconds = 59;
   }
   timerUpdate(timerMinutes,timerSeconds);
}
function endOfLevel(curLevel, numberOfFish, tip)
{
   if(fishCaught == numberOfFish)
   {
      if(level == curLevel)
      {
         puffle.play();
         puffle._visible = true;
         puffle.obj.levelTip.text = tip;
         levelBlock = true;
      }
   }
}
function levelUp()
{
   stopLevel();
   level++;
   speed -= 500;
   levelBlock = false;
   puffle._visible = false;
   startLevel();
}
function gameSpeed()
{
   speedTimer = getTimer();
   if(speedTimer - timer >= speed)
   {
      timer = speedTimer;
      groupChoose();
   }
   groupPlay();
}
function countdown()
{
   millisecondsOfTime = minutesGiven * 60000 - (speedTimer - clockTimer);
   secondsOfTime = Math.floor(millisecondsOfTime / 1000) % 60;
   if(secondsOfTime < 10)
   {
      secondsOfTime = "0" + secondsOfTime;
   }
   minutesOfTime = Math.floor(millisecondsOfTime / 60000);
   timeLeft.text = minutesOfTime + ":" + secondsOfTime;
}
function distance(x1, y1, x2, y2)
{
   var _loc2_ = x2 - x1;
   var _loc1_ = y2 - y1;
   return Math.sqrt(_loc2_ * _loc2_ + _loc1_ * _loc1_);
}
function pengCtrl()
{
   if(penguin._currentframe < 10)
   {
      if(hook.isHit == true)
      {
         penguin.gotoAndStop(3);
      }
      else if(hook.isHit == false)
      {
         if(_ymouse <= icepoint)
         {
            penguin.gotoAndStop(1);
         }
         else
         {
            penguin.gotoAndStop(2);
         }
      }
   }
   if(lives < 1)
   {
      penguin.wormCan.gotoAndStop(2);
   }
   else
   {
      penguin.wormCan.gotoAndStop(1);
   }
}
function hookMove()
{
   if(_ymouse >= line._y + lineExtra && _ymouse < 440)
   {
      hook._y = _ymouse;
   }
   else if(_ymouse >= 440)
   {
      hook._y = 440;
   }
   else
   {
      hook._y = line._y + lineExtra;
   }
   if(hookEmpty == true && hook.isHit == false)
   {
      hookCurrPos = _ymouse;
      if(_ymouse <= icepoint)
      {
         hook.gotoAndStop(2);
      }
      else
      {
         if(hookCurrPos < hookPrevPos)
         {
            hook.gotoAndStop(4);
         }
         else if(hookCurrPos > hookPrevPos)
         {
            hook.gotoAndStop(3);
         }
         else
         {
            hook.gotoAndStop(1);
         }
         hookPrevPos = _ymouse;
      }
   }
}
function lineScale()
{
   if(line._y < _ymouse && _ymouse < 440)
   {
      if(lineisCut == false)
      {
         line._yscale = _ymouse - line._y;
      }
      else if(lineisCut == true)
      {
         if(_ymouse < cutPoint + line._y)
         {
            line._yscale = _ymouse - line._y;
         }
      }
   }
   else if(_ymouse >= 440 && !lineisCut)
   {
      line._yscale = 440 - line._y;
   }
   else if(line._y > _ymouse && !lineisCut)
   {
      line._yscale = 0;
   }
}
function lineCut(collider)
{
   lineCutAmount++;
   if(collider == crab1 || collider == crab2)
   {
      if(hook._currentframe == 5)
      {
         fishFlees();
      }
      if(hook._currentframe == 7)
      {
         grayfishFlees();
      }
   }
   if(collider != shark1 && collider != shark2)
   {
      hookisFalling = true;
   }
   if(hookisFalling == true)
   {
      hookFall._x = hook._x;
      hookFall.mask._y = collider._y - _ymouse;
   }
   lineisCut = true;
   hook.isHit = true;
   hook._visible = false;
   hook.gotoAndStop("empty");
   line._yscale = collider._y - line._y;
   cutPoint = collider._y - line._y;
   trace(cutPoint);
}
function lineMask()
{
   if(lineisCut == false)
   {
      if(hookisFalling == false)
      {
         hookFall._y = _ymouse;
      }
      else
      {
         hookFall.gotoAndStop(1);
         hookFall._x = 900;
         hookisFalling = false;
      }
   }
   if(lineisCut == true)
   {
      if(hookFall._y < 800)
      {
         hookFall.gotoAndStop(2);
         hookFall._y += 20;
      }
      else
      {
         hookFall.gotoAndStop(1);
         hookFall._x = 900;
         hookisFalling = false;
      }
   }
}
function objChoose(stopwatch, item)
{
   if(speedTimer - timer >= stopwatch && speedTimer - timer <= stopwatch + 200)
   {
      if(item >= 0 && item <= 7)
      {
         objArray[item].play();
      }
      else if(item == 8 && lives < 3)
      {
         objArray[item].play();
      }
      else if(item == 9 || item == 10)
      {
         objArray[item].play();
      }
      else if(item == 11 || item == 12)
      {
         if(!sharkActive)
         {
            objArray[item].play();
         }
      }
      else if(item == 13 || item == 14)
      {
         if(!crabActive)
         {
            objArray[item].play();
         }
      }
      else if(item == 15)
      {
         if(!kickerLeftMove)
         {
            kickerLeft.obj.gotoAndStop(Math.round(Math.random() * 1 + 1));
            kickerLeft._y = Math.random() * 200 + 235;
            trace(kickerLeft._y);
            kickerLeftMove = true;
         }
      }
      else if(item == 16)
      {
         if(!kickerRightMove)
         {
            kickerRight.obj.gotoAndStop(Math.round(Math.random() * 1 + 1));
            kickerRight._y = Math.random() * 200 + 235;
            kickerRightMove = true;
         }
      }
      else if(item >= 17 && item <= 20)
      {
         if(fishCaught < 56 && grayFishMode)
         {
            objArray[item].play();
         }
      }
   }
}
function groupChoose()
{
   if(level == 1)
   {
      groups = Math.floor(Math.random() * 10 + 1);
   }
   else if(level == 2)
   {
      groups = Math.floor(Math.random() * 20 + 1);
   }
   else if(level == 3)
   {
      groups = Math.floor(Math.random() * 30 + 1);
   }
   else if(level == 4)
   {
      groups = Math.floor(Math.random() * 30 + 11);
   }
   trace(groups);
}
function groupPlay()
{
   if(groups == 0)
   {
      objChoose(100,18);
      objChoose(800,20);
      objChoose(1200,5);
   }
   else if(groups == 1)
   {
      objChoose(100,0);
      objChoose(400,15);
      objChoose(800,18);
      objChoose(1500,6);
   }
   else if(groups == 2)
   {
      objChoose(300,7);
      objChoose(1400,3);
   }
   else if(groups == 3)
   {
      objChoose(1200,5);
      objChoose(1900,16);
   }
   else if(groups == 4)
   {
      objChoose(100,15);
      objChoose(600,1);
      objChoose(900,5);
      objChoose(1500,18);
   }
   else if(groups == 5)
   {
      objChoose(300,4);
      objChoose(800,3);
      objChoose(900,15);
   }
   else if(groups == 6)
   {
      objChoose(200,7);
      objChoose(300,15);
      objChoose(1900,6);
   }
   else if(groups == 7)
   {
      objChoose(300,4);
      objChoose(800,2);
   }
   else if(groups == 8)
   {
      objChoose(300,7);
      objChoose(400,16);
      objChoose(800,20);
   }
   else if(groups == 9)
   {
      objChoose(500,2);
      objChoose(800,20);
   }
   else if(groups == 10)
   {
      objChoose(100,16);
      objChoose(200,2);
      objChoose(900,3);
   }
   else if(groups == 11)
   {
      objChoose(100,15);
      objChoose(200,16);
      objChoose(800,3);
      objChoose(1200,19);
   }
   else if(groups == 12)
   {
      objChoose(100,6);
      objChoose(2000,3);
      objChoose(2200,9);
   }
   else if(groups == 13)
   {
      objChoose(500,8);
   }
   else if(groups == 14)
   {
      objChoose(800,6);
      objChoose(1200,10);
   }
   else if(groups == 15)
   {
      objChoose(400,3);
      objChoose(1000,6);
      objChoose(1100,10);
   }
   else if(groups == 16)
   {
      objChoose(100,17);
      objChoose(800,20);
      objChoose(1600,1);
   }
   else if(groups == 17)
   {
      objChoose(900,10);
      objChoose(1200,9);
   }
   else if(groups == 18)
   {
      objChoose(900,9);
      objChoose(1200,10);
      objChoose(1300,7);
   }
   else if(groups == 19)
   {
      objChoose(200,9);
      objChoose(400,4);
      objChoose(1300,3);
   }
   else if(groups == 20)
   {
      objChoose(900,10);
      objChoose(1200,17);
      objChoose(2400,9);
   }
   else if(groups == 21)
   {
      objChoose(100,11);
   }
   else if(groups == 22)
   {
      objChoose(100,12);
   }
   else if(groups == 23)
   {
      objChoose(200,11);
      objChoose(400,6);
      objChoose(1300,9);
   }
   else if(groups == 24)
   {
      objChoose(900,12);
      objChoose(1000,15);
      objChoose(1900,2);
   }
   else if(groups == 25)
   {
      objChoose(100,10);
      objChoose(2000,11);
   }
   else if(groups == 26)
   {
      objChoose(100,15);
      objChoose(500,11);
      objChoose(900,7);
   }
   else if(groups == 27)
   {
      objChoose(100,6);
      objChoose(900,12);
   }
   else if(groups == 28)
   {
      objChoose(200,0);
      objChoose(900,12);
      objChoose(1900,9);
   }
   else if(groups == 29)
   {
      objChoose(600,9);
      objChoose(1200,17);
   }
   else if(groups == 30)
   {
      objChoose(500,2);
      objChoose(1200,16);
      objChoose(1700,12);
   }
   else if(groups == 31)
   {
      objChoose(400,13);
   }
   else if(groups == 32)
   {
      objChoose(400,14);
   }
   else if(groups == 33)
   {
      objChoose(100,13);
      objChoose(1900,14);
   }
   else if(groups == 34)
   {
      objChoose(400,13);
      objChoose(800,1);
      objChoose(1600,9);
   }
   else if(groups == 35)
   {
      objChoose(700,14);
      objChoose(800,5);
      objChoose(1600,12);
      objChoose(2400,19);
   }
   else if(groups == 36)
   {
      objChoose(200,9);
      objChoose(1600,10);
      objChoose(1700,3);
   }
   else if(groups == 37)
   {
      objChoose(600,8);
      objChoose(1200,10);
      objChoose(1900,14);
   }
   else if(groups == 38)
   {
      objChoose(100,8);
      objChoose(200,18);
      objChoose(900,4);
      objChoose(2200,14);
   }
   else if(groups == 39)
   {
      objChoose(1000,7);
      objChoose(1200,15);
   }
   else if(groups == 40)
   {
      objChoose(300,17);
      objChoose(1400,13);
      objChoose(2800,1);
   }
}
function yOffset(amt)
{
   return Math.random() * amt;
}
function hazardHit()
{
   if(level > 0)
   {
      fishHit();
      kickerHit();
      grayFishHit();
   }
   if(level > 1)
   {
      jfishHit();
      oneupHit();
   }
   if(level > 2)
   {
      sharkHit();
   }
}
function fishHit()
{
   if(hook._currentframe < 5)
   {
      var _loc3_ = 1;
      while(_loc3_ < 9)
      {
         var _loc2_ = this["fish" + _loc3_];
         if(_loc2_._currentframe > 1)
         {
            if(_loc2_.obj.hotspot.hitTest(hook.hotspot))
            {
               _loc2_.gotoAndStop(1);
               hook.gotoAndStop(5);
               hookEmpty = false;
               addSound("chomp");
            }
         }
         _loc3_ += 1;
      }
   }
}
function addFish(col)
{
   if(currentFish == iceboxArray[iceboxArrayPos])
   {
      currentFish = 1;
      iceboxArrayPos += 1;
      icebox.nextFrame();
   }
   else
   {
      currentFish += 1;
   }
   fishblockNum = "fishblock" + iceboxArrayPos;
   icebox[fishblockNum].nextFrame();
   fishNum = "fish" + currentFish;
   if(col == "gray")
   {
      icebox[fishblockNum][fishNum].gotoAndStop(2);
      trace("Gray!");
      grayFishTotal += 1;
      gft.text = grayFishTotal;
   }
   else
   {
      orangeFishTotal += 1;
      oft.text = orangeFishTotal;
   }
   trace("orange: " + orangeFishTotal);
   if(orangeFishTotal == 10 && _global._mode == 2)
   {
      trace("STAMP: AWARD Fishing Frenzy");
      com.clubpenguin.util.Stamp.sendStamp(3761);
   }
   if(orangeFishTotal == 20 && _global._mode == 2)
   {
      trace("STAMP: AWARD Trial Master");
      com.clubpenguin.util.Stamp.sendStamp(3760);
   }
}
function fishDrop()
{
   if(hook._currentframe == 5)
   {
      if(_ymouse <= icepoint)
      {
         consecutiveFishCaught++;
         if(consecutiveFishCaught == 15)
         {
            trace("STAMP: AWARD Fishtastic");
            com.clubpenguin.util.Stamp.sendStamp(376);
         }
         if(consecutiveFishCaught == 45)
         {
            trace("STAMP: AWARD Afishionado");
            com.clubpenguin.util.Stamp.sendStamp(382);
         }
         trace("Caught a fish!");
         hook.gotoAndStop(2);
         addFish();
         fishCaught++;
         if(getTimer() - startGame <= 300000 && fishCaught >= 63)
         {
            trace("STAMP: AWARD Fly Fisher");
            com.clubpenguin.util.Stamp.sendStamp(388);
         }
         icebox.fishNum.text = fishCaught;
         if(fishCaught == 1)
         {
            icebox.fish.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_fish",[""]) + " ";
         }
         else
         {
            icebox.fish.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_fishies",[""]) + " ";
            if(fishCaught == 0 && com.clubpenguin.util.LocaleText.getLocaleID() == com.clubpenguin.util.LocaleText.LANG_ID_FR)
            {
               fish.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_fish",[""]) + " ";
            }
         }
         addSound("fishicebox");
      }
      else
      {
         trace("Lost a fish!");
         hook.gotoAndStop(1);
         fishFlees();
      }
      hookEmpty = true;
   }
   else if(hook._currentframe == 7)
   {
      if(_ymouse <= icepoint)
      {
         consecutiveFishCaught++;
         greyFishCaught++;
         trace("GREYFISH CAUGHT : " + greyFishCaught);
         if(consecutiveFishCaught == 45)
         {
            trace("STAMP: AWARD Afishionado");
            com.clubpenguin.util.Stamp.sendStamp(382);
         }
         if(greyFishCaught == 15)
         {
            trace("STAMP: AWARD Gray Goodies");
            com.clubpenguin.util.Stamp.sendStamp(384);
         }
         trace("Caught a gray fish!");
         hook.gotoAndStop(2);
         addFish("gray");
         fishCaught++;
         if(getTimer() <= 300000 && fishCaught >= 63)
         {
            trace("STAMP: AWARD Fly Fisher");
            com.clubpenguin.util.Stamp.sendStamp(388);
         }
         icebox.fishNum.text = fishCaught;
         if(fishCaught == 1)
         {
            icebox.fish.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_fish",[""]) + " ";
         }
         else if(fishCaught == 0 && com.clubpenguin.util.LocaleText.getLocaleID() == com.clubpenguin.util.LocaleText.LANG_ID_FR)
         {
            fish.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_fish",[""]) + " ";
         }
         addSound("fishicebox");
      }
      else
      {
         trace("Lost a fish!");
         hook.gotoAndStop(1);
         grayfishFlees();
      }
      hookEmpty = true;
   }
}
function fishFlees()
{
   consecutiveFishCaught = 0;
   addSound("fishfleesound");
   fishflee._x = hook._x;
   fishflee._y = hook._y;
   fishflee.gotoAndPlay(2);
}
function grayfishFlees()
{
   consecutiveFishCaught = 0;
   addSound("fishfleesound");
   grayfishflee._x = hook._x;
   grayfishflee._y = hook._y;
   grayfishflee.gotoAndPlay(2);
}
function jfishHit()
{
   if(hook.isHit == false)
   {
      var _loc3_ = 1;
      while(_loc3_ < 3)
      {
         var _loc2_ = this["jfish" + _loc3_];
         if(_loc2_._currentframe > 1)
         {
            if(_loc2_.obj.hotspot.hitTest(hook.hotspot) || _loc2_.obj.hotspot.hitTest(line))
            {
               hook.isHit = true;
               if(hook._currentframe == 5)
               {
                  fishFlees();
               }
               else if(hook._currentframe == 7)
               {
                  grayfishFlees();
               }
               jellyFishHitCount++;
               trace("Jellyfished!");
               hook.gotoAndStop(6);
               line.gotoAndStop(2);
               penguin.gotoAndStop("electro");
            }
         }
         _loc3_ += 1;
      }
   }
}
function sharkLeftDist()
{
   sharkleftDistance = distance(sharkLeft._x,sharkLeft._y,hook._x,hook._y);
   if(sharkleftDistance < 150)
   {
      if(lineisCut == false)
      {
         sharkLeft.gotoAndStop(2);
      }
      else
      {
         sharkLeft.gotoAndStop(1);
      }
   }
   else
   {
      sharkLeft.gotoAndStop(1);
   }
}
function sharkRightDist()
{
   sharkrightDistance = distance(sharkRight._x,sharkRight._y,hook._x,hook._y);
   if(sharkrightDistance < 150)
   {
      if(lineisCut == false)
      {
         sharkRight.gotoAndStop(2);
      }
      else
      {
         sharkRight.gotoAndStop(1);
      }
   }
   else
   {
      sharkRight.gotoAndStop(1);
   }
}
function sharkHit()
{
   if(hook.isHit == false)
   {
      if(sharkLeft.hotspot.hitTest(hook.hotspot))
      {
         lineCut(sharkLeft);
         addSound("shark");
      }
      if(sharkRight.hotspot.hitTest(hook.hotspot))
      {
         if(!hookEmpty)
         {
            trace("STAMP: AWARD Snack Attack");
            com.clubpenguin.util.Stamp.sendStamp(372);
         }
         lineCut(sharkRight);
         addSound("shark");
      }
   }
}
function crabHit()
{
   if(hook.isHit == false)
   {
      if(crab1.hotspot.hitTest(line))
      {
         lineCut(crab1);
      }
      if(crab2.hotspot.hitTest(line))
      {
         lineCut(crab2);
      }
   }
}
function kickerHit()
{
   if(kickerLeft.obj.hotspot.hitTest(hook.hotspot))
   {
      if(hook._currentframe == 5)
      {
         trace("Fish got kicked");
         hook.gotoAndStop(1);
         fishFlees();
         hookMove();
         hookEmpty = true;
      }
      if(hook._currentframe == 7)
      {
         trace("Gray fish got kicked");
         hook.gotoAndStop(1);
         grayfishFlees();
         hookMove();
         hookEmpty = true;
      }
   }
   if(kickerRight.obj.hotspot.hitTest(hook.hotspot))
   {
      if(hook._currentframe == 5)
      {
         trace("Fish got kicked");
         hook.gotoAndStop(1);
         fishFlees();
         hookMove();
         hookEmpty = true;
      }
      if(hook._currentframe == 7)
      {
         trace("Gray fish got kicked");
         hook.gotoAndStop(1);
         grayfishFlees();
      }
      hookMove();
      hookEmpty = true;
   }
}
function grayFishHit()
{
   if(hook._currentframe < 5)
   {
      var _loc3_ = 1;
      while(_loc3_ < 5)
      {
         var _loc2_ = this["grayfish" + _loc3_];
         if(_loc2_._currentframe > 1)
         {
            if(_loc2_.obj.hotspot.hitTest(hook.hotspot))
            {
               _loc2_.gotoAndStop(1);
               hook.gotoAndStop(7);
               hookEmpty = false;
               addSound("chomp");
            }
         }
         _loc3_ += 1;
      }
   }
}
function bigFishHit()
{
   if(bigFish._currentframe < 165)
   {
      if(bigFish.obj.disthotspot.hitTest(hook.hotspot))
      {
         bigFish.obj.gotoAndStop(2);
      }
      else
      {
         bigFish.obj.gotoAndStop(1);
      }
   }
   if(bigFish.obj.hotspot.hitTest(hook.hotspot))
   {
      nextFrame();
   }
}
function oneupHit()
{
   if(Number(_global._mode) == 2)
   {
      return undefined;
   }
   if(oneup.obj.hotspot.hitTest(hook.hotspot) && oneup._alpha == 100 && hook._currentframe < 50)
   {
      oneup._alpha -= 10;
      lives++;
      lives_mc.lives.text = lives;
      oneupText.mc.label.text = com.clubpenguin.util.LocaleText.getText("ingame_1UP");
      oneupText._x = 367;
      oneupText._y = 330;
      oneupText.play();
      addSound("ding");
   }
   if(oneup._alpha < 100)
   {
      oneup._alpha -= 10;
   }
   if(oneup._alpha < 10)
   {
      oneup.gotoAndStop(1);
      oneup._alpha = 100;
   }
}
function needWorm()
{
   prompt.gotoAndStop(2);
}
function getWorm(yvar)
{
   if(lives > 0)
   {
      if(prompt._currentframe == 2 && _ymouse <= icepoint + yvar)
      {
         trace("Recieved a new worm!");
         hook.gotoAndStop(2);
         prompt.gotoAndStop(1);
         hook._visible = true;
         hook.isHit = false;
         hookEmpty = true;
         loseLife();
         lineisCut = false;
      }
   }
}
function loseLife()
{
   trace("Life lost");
   hook.isHit = false;
   hasLostLife = true;
   lives--;
   lives_mc.lives.text = lives;
   hook._visible = true;
}
function gameOver()
{
   clearInterval(countdownTimer);
   if(!hasLostLife)
   {
      trace("STAMP: AWARD Worm Win");
      com.clubpenguin.util.Stamp.sendStamp(378);
   }
   if(lineCutAmount == 3)
   {
      trace("STAMP: AWARD Crab Cuts");
      com.clubpenguin.util.Stamp.sendStamp(380);
   }
   stopLevel();
   stopGame();
   gameRunning = false;
   hook._visible = false;
   gameOver_mc._visible = true;
   if(grayFishMode)
   {
      gameOver_mc.gotoAndStop(2);
      gameOver_mc.fishNum.text = com.clubpenguin.util.LocaleText.getTextReplaced("ingame_yellowfishscore",["" + orangeFishTotal,"" + orangeFishTotal * 4]) + "\n" + com.clubpenguin.util.LocaleText.getTextReplaced("ingame_grayfishscore",["" + grayFishTotal,"" + grayFishTotal * 8]);
   }
   else
   {
      gameOver_mc.fishNum.text = com.clubpenguin.util.LocaleText.getTextReplaced("ui_fishcaught",["" + fishCaught]);
   }
}
function getCoins(bonus)
{
   var _loc3_ = new Object();
   _loc3_.coins = orangeFishTotal * 4 + grayFishTotal * 8 + bonus;
   _loc3_.score = _loc3_.coins;
   if(_global._mode == 2)
   {
      trace("double coins!");
      _loc3_.score *= 2;
   }
   if(_global._mode == 1 && greyMulletChance == 100)
   {
      trace("double coins!");
      _loc3_.score *= 2;
   }
   _root.showWindow("Game Over",_loc3_);
   trace(_loc3_.coins);
}
function startGame()
{
   trace("start game");
   this.pushOpcode("start",assessmentGameGuidLookup());
}
function stopGame()
{
   this.pushOpcode("stop",assessmentGameGuidLookup());
}
function startLevel()
{
   this.pushOpcode("start",assessmentLevelGuidLookup());
}
function stopLevel()
{
   this.pushOpcode("stop",assessmentLevelGuidLookup());
}
function pushOpcode(opcode, guid)
{
   return undefined;
}
function assessmentLevelGuidLookup()
{
   if(this.level == 1)
   {
      return "4b79829a-95fc-42d7-9c76-5eb04ad0620d";
   }
   if(this.level == 2)
   {
      return "4b79829a-4008-4f57-ab14-5eb04ad0620d";
   }
   if(this.level == 3)
   {
      return "4b79829a-0490-4af7-ae3f-5eb04ad0620d";
   }
   if(this.level == 4)
   {
      return "4b79829a-3cac-47e9-a7f0-5eb04ad0620d";
   }
   return "4b79829a-617c-45fe-bd0a-5eb04ad0620d";
}
function assessmentGameGuidLookup()
{
   return "4b79829a-d978-460d-b48b-5eb04ad0620d";
}
stop();
var consecutiveFishCaught = 0;
var hasLostLife = false;
var totalFishCaught = 0;
gameRunning = true;
icepoint = 122;
hookEmpty = true;
hookPrevPos = this._ymouse;
hookCurrPos = this._ymouse;
hookisFalling = false;
lives = 3;
level = 1;
levelBlock = false;
fishCaught = 0;
puffle._visible = false;
startGame();
startLevel();
var startTime;
startTime = getTimer();
sharkActive = false;
crabActive = false;
kickerLeftMove = false;
kickerRightMove = false;
lineisCut = false;
timer = getTimer();
speedTimer = getTimer();
speed = 4000;
timer_mc._visible = false;
trialTimer = 90000;
_mode = _global._mode;
greyMulletChance = Math.floor(Math.random() * 100) + 1;
_global.greyMulletChance = greyMulletChance;
trace("mode is: " + _mode);
if(Number(_mode) == 2)
{
   level = 4;
   speed -= 1000;
   lives = 0;
   lives_mc.lives.text = lives;
   startTimer();
}
if(grayFishMode == true)
{
   lineExtra = 35;
}
else
{
   lineExtra = 0;
}
var lineCutAmount = 0;
if(Number(_global._mode) == 2)
{
   objArray = new Array(fish1,fish2,fish3,fish4,fish5,fish6,fish7,fish8,jfish1,jfish2,finLeft,finRight,crab1,crab2,kickerLeft,kickerRight,grayfish1,grayfish2,grayfish3,grayfish4);
}
else
{
   objArray = new Array(fish1,fish2,fish3,fish4,fish5,fish6,fish7,fish8,oneup,jfish1,jfish2,finLeft,finRight,crab1,crab2,kickerLeft,kickerRight,grayfish1,grayfish2,grayfish3,grayfish4);
}
orangeFishTotal = 0;
grayFishTotal = 0;
iceboxArray = new Array(6,8,6,16,18);
iceboxArrayPos = 0;
currentFish = 0;
var greyFishCaught = 0;
var jellyFishHitCount = 0;
sharkLeftMove = false;
sharkRightMove = false;
