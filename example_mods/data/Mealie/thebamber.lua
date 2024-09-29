function onCreate()
	makeAnimationList();
	makeOffsets();
	
	-- bambi
	makeAnimatedLuaSprite('bambi', 'characters/Screwed_Bambi', defaultOpponentX - 350, defaultOpponentY + 390);
	addAnimationByPrefix('bambi', 'idle', 'a_bambi idle0', 24, true);
	addAnimationByPrefix('bambi', 'singLEFT', 'a_bambi down0', 24, false);
	addAnimationByPrefix('bambi', 'singRIGHT', 'a_bambi left0', 24, false);
	addAnimationByPrefix('bambi', 'singUP', 'a_bambi right0', 24, false);
	addAnimationByPrefix('bambi', 'singDOWN', 'a_bambi up0', 24, false);	

	addLuaSprite('bambi', true);

	setProperty('bambi.visible', false)

	playAnimation('bambi', 0, true);
	addAnimationByPrefix('bambi', 'idle', 'a_bambi left0', 24, true);
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
	offsetsbambi[0] = {x = 95, y = -20}; --idle
	offsetsbambi[1] = {x = 45, y = -27}; --left
	offsetsbambi[2] = {x = 70, y = 70}; --down
	offsetsbambi[3] = {x = 45, y = 0}; --up
	offsetsbambi[4] = {x = -90, y = 40} --right
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

    if curStep == 1449 then
        setProperty('bambi.visible', true)
    end

    if curStep == 1489 then
        setProperty('bambi.visible', false)
    end

    if curStep == 1698 then
        setProperty('bambi.visible', true)
    end

    if curStep == 1728 then
        setProperty('bambi.visible', false)
    end

    if curStep == 1752 then
        setProperty('bambi.visible', true)
    end

    if curStep == 1760 then
        setProperty('bambi.visible', false)
    end

    if curStep == 1792 then
        setProperty('bambi.visible', true)
    end

    if curStep == 1824 then
        setProperty('bambi.visible', false)
    end

    if curStep == 1856 then
        setProperty('bambi.visible', true)
    end

    if curStep == 1888 then
        setProperty('bambi.visible', false)
    end

    if curStep == 1984 then
        setProperty('bambi.visible', true)
    end

    if curStep == 2016 then
        setProperty('bambi.visible', false)
    end

    if curStep == 2082 then
        setProperty('bambi.visible', true)
    end

    if curStep == 2212 then
        setProperty('bambi.visible', false)
    end

    if curStep == 2226 then
        setProperty('bambi.visible', true)
    end

    if curStep == 2243 then
        setProperty('bambi.visible', false)
    end
end