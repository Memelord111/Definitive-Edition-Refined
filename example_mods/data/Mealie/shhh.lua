function onCreate()
	makeAnimationList();
	makeOffsets();
	
	-- bambi
	makeAnimatedLuaSprite('bambi2', 'characters/Screwed_Bambi', defaultOpponentX - 350, defaultOpponentY + 390);
	addAnimationByPrefix('bambi2', 'idle', 'a_bambi idle0', 24, true);
	addAnimationByPrefix('bambi2', 'singLEFT', 'a_bambi down0', 24, false);
	addAnimationByPrefix('bambi2', 'singRIGHT', 'a_bambi left0', 24, false);
	addAnimationByPrefix('bambi2', 'singUP', 'a_bambi right0', 24, false);
	addAnimationByPrefix('bambi2', 'singDOWN', 'a_bambi up0', 24, false);	

	addLuaSprite('bambi2', true);

	setProperty('bambi2.visible', false)

	playAnimation('bambi2', 0, true);
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
	offsetsbambi2[0] = {x = -5, y = 0}; --idle
	offsetsbambi2[1] = {x = 45, y = -27}; --left
	offsetsbambi2[2] = {x = 70, y = 70}; --down
	offsetsbambi2[3] = {x = 45, y = 0}; --up
	offsetsbambi2[4] = {x = -90, y = 40} --right
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

    if curStep == 1440 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 1449 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 1489 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 1698 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 1728 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 1752 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 1760 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 1792 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 1824 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 1856 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 1888 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 1984 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 2016 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 2082 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 2212 then
        setProperty('bambi2.visible', true)
    end

    if curStep == 2226 then
        setProperty('bambi2.visible', false)
    end

    if curStep == 2243 then
        setProperty('bambi2.visible', true)
    end
end