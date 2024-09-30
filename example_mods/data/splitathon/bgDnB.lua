function onCreate()

	makeAnimatedLuaSprite('bgDave','characters/Splitathon_Dave', 139, 215);
	addAnimationByPrefix('bgDave','Idle','happy0', 24, true);
    addAnimationByPrefix('bgDave','IdleAlt','bruh0', 24, true);
	objectPlayAnimation('bgDave','Idle', false);
	setScrollFactor('bgDave', 1, 1);
	addLuaSprite('bgDave', false);
	setProperty('bgDave.visible', false)

    makeAnimatedLuaSprite('bgBambi','characters/Splitathon_Bambi2', 145, 555);
	addAnimationByPrefix('bgBambi','Idle','splitathon idle 20', 24, true);
    addAnimationByPrefix('bgBambi','IdleAlt','splitathon corn0', 24, true);
	objectPlayAnimation('bgBambi','Idle', false)
	setScrollFactor('bgBambi', 1, 1);
	addLuaSprite('bgBambi', true);
	setProperty('bgBambi.visible', false)

    makeAnimatedLuaSprite('bgTristan','bambi/splitathon/TristanOnGroundWhatHeDo', 1260, 480);
	addAnimationByPrefix('bgTristan','Idle','sitting0', 24, true);
    addAnimationByPrefix('bgTristan','IdleAlt','SuprisedMF0', 24, true);
	objectPlayAnimation('bgTristan','Idle', false)
	setScrollFactor('bgTristan', 1, 1);
    setProperty('bgTristan.scale.x', 0.9);
    setProperty('bgTristan.scale.y', 0.9);
	addLuaSprite('bgTristan', false);
	setProperty('bgTristan.visible', true)
    setProperty('bambi/splitathon/TristanOnGroundWhatHeDo', getColorFromHex('878787'))

    makeAnimatedLuaSprite('bgMoldy','characters/moldygh', 999, 180);
	addAnimationByPrefix('bgMoldy','Idle','Idle0', 24, true);
	objectPlayAnimation('bgMoldy','Idle', false);
    setProperty('bgMoldy.flipX', true)
	setScrollFactor('bgMoldy', 1, 1);
	addLuaSprite('bgMoldy', false);
	setProperty('bgMoldy.visible', false)

end

function onStepHit()

    if curStep == 3920 then
        setProperty('bgDave.visible', true)
        objectPlayAnimation('bgDave','IdleAlt', true)
        objectPlayAnimation('bgTristan','IdleAlt', true)
    end

    if curStep == 6113 then
        setProperty('bgDave.visible', false)
        setProperty('bgBambi.visible', true)
        objectPlayAnimation('bgBambi','Idle', true)
        objectPlayAnimation('bgTristan','Idle', true)
    end

    if curStep == 6753 then
        setProperty('bgBambi.visible', false)
        objectPlayAnimation('bgTristan','IdleAlt', true)
    end

    if curStep == 7264 then
        setProperty('bgBambi.visible', true)
        objectPlayAnimation('bgBambi','IdleAlt', true)
        objectPlayAnimation('bgTristan','Idle', true)
    end
end