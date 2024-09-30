function onCreate()
	makeAnimationList();
	makeOffsets();
	
	-- bambi
	makeAnimatedLuaSprite('bambi2', 'characters/Splitathon_bambi2', defaultOpponentX - 350, defaultOpponentY + 390);
	addAnimationByPrefix('bambi2', 'idle', 'splitathon idle0', 24, true);
	addAnimationByPrefix('bambi2', 'singLEFT', 'splitathon down0', 24, false);
	addAnimationByPrefix('bambi2', 'singRIGHT', 'splitathon left0', 24, false);
	addAnimationByPrefix('bambi2', 'singUP', 'splitathon right0', 24, false);
	addAnimationByPrefix('bambi2', 'singDOWN', 'splitathon up0', 24, false);	

	addLuaSprite('bambi2', true);

	setProperty('bambi2.visible', false)

	playAnimation('bambi2', 0, true);
	addAnimationByPrefix('bambi2', 'idle', 'splitathon left0', 24, true);
end

animationsList = {}
holdTimers = {bambi2 = -1.0};
noteDatas = {bambi2 = 0};
function makeAnimationList()
	animationsList[0] = 'idle';
	animationsList[1] = 'singLEFT';
	animationsList[2] = 'singDOWN';
	animationsList[3] = 'singUP';
	animationsList[4] = 'singRIGHT'
end

offsetsbambi2 = {};
function makeOffsets()
	offsetsbambi2[0] = {x = 45, y = 0}; --idle
	offsetsbambi2[1] = {x = -45, y = -27}; --left
	offsetsbambi2[2] = {x = -29, y = 40}; --down
	offsetsbambi2[3] = {x = -102, y = 2}; --up
	offsetsbambi2[4] = {x = -29, y = 40} --right
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Special_Sing' then
		if not isSustainNote then
			noteDatas.bambi2 = direction;
		end	
	characterToPlay = 'bambi2'
	animToPlay = noteDatas.bambi2;
	holdTimers.bambi2 = 0;
			
	playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.bambi2 >= 0 then
		holdTimers.bambi2 = holdTimers.bambi2 + elapsed;
		if holdTimers.bambi2 >= holdCap then
			playAnimation('bambi2', 0, false);
			holdTimers.bambi2 = -1;
		end
	end
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.bambi2 < 0 then
			playAnimation('bambi2', 0, false);
		end
	end
end

function playAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'bambi2' then
		objectPlayAnimation('bambi2', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('bambi2.offset.x', offsetsbambi2[animId].x);
		setProperty('bambi2.offset.y', offsetsbambi2[animId].y);
	end
end

function onStepHit()

    if curStep == 6816 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 6880 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 7072 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 7138 then
        setProperty('bambi2.visible', false)
    end
end