function onCreate()
	makeAnimationList();
	makeOffsets();
	
	-- bambi
	makeAnimatedLuaSprite('bambi', 'characters/Splitathon_Bambi2', defaultOpponentX - 350, defaultOpponentY + 390);
	addAnimationByPrefix('bambi', 'idle', 'splitathon idle0', 24, true);
	addAnimationByPrefix('bambi', 'singLEFT', 'splitathon down0', 24, false);
	addAnimationByPrefix('bambi', 'singRIGHT', 'splitathon left0', 24, false);
	addAnimationByPrefix('bambi', 'singUP', 'splitathon right0', 24, false);
	addAnimationByPrefix('bambi', 'singDOWN', 'splitathon up0', 24, false);	

	addLuaSprite('bambi', true);

	setProperty('bambi.visible', false)

	playAnimation('bambi', 0, true);
end

animationsList = {}
holdTimers = {bambi = -1.0};
noteDatas = {bambi = 0};
function makeAnimationList()
	animationsList[0] = 'idle';
	animationsList[1] = 'singLEFT';
	animationsList[2] = 'singDOWN';
	animationsList[3] = 'singUP';
	animationsList[4] = 'singRIGHT'
end

offsetsbambi = {};
function makeOffsets()
	offsetsbambi[0] = {x = -5, y = 0}; --idle
	offsetsbambi[1] = {x = -45, y = -27}; --left
	offsetsbambi[2] = {x = -29, y = 40}; --down
	offsetsbambi[3] = {x = -102, y = 2}; --up
	offsetsbambi[4] = {x = -29, y = 40} --right
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Special_Sing' then
		if not isSustainNote then
			noteDatas.bambi = direction;
		end	
	characterToPlay = 'bambi'
	animToPlay = noteDatas.bambi;
	holdTimers.bambi = 0;
			
	playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.bambi >= 0 then
		holdTimers.bambi = holdTimers.bambi + elapsed;
		if holdTimers.bambi >= holdCap then
			playAnimation('bambi', 0, false);
			holdTimers.bambi = -1;
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
		if holdTimers.bambi < 0 then
			playAnimation('bambi', 0, false);
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
	if character == 'bambi' then
		objectPlayAnimation('bambi', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('bambi.offset.x', offsetsbambi[animId].x);
		setProperty('bambi.offset.y', offsetsbambi[animId].y);
	end
end

function onStepHit()

    if curStep == 6753 then
        setProperty('bambi.visible', true)
    end

    if curStep == 6816 then
        setProperty('bambi.visible', false)
    end

    if curStep == 6880 then
        setProperty('bambi.visible', true)
    end

    if curStep == 7072 then
        setProperty('bambi.visible', false)
    end

    if curStep == 7138 then
        setProperty('bambi.visible', true)
    end

    if curStep == 7264 then
        setProperty('bambi.visible', false)
    end
end