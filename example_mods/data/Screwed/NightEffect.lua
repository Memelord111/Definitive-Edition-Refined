function onCreatePost()
	makeLuaSprite('NightEffect', 'Bambi/NightEffect', 0, 0)
	addLuaSprite('NightEffect',true)
	setObjectCamera('NightEffect', 'camgame')
	setProperty('NightEffect.scale.x', 12.5);
    setProperty('NightEffect.scale.y', 12.5);
	setProperty('NightEffect.alpha', 0)

end

function onUpdate(elapsed)
	if curStep == 640 then
		doTweenAlpha('TurningNight', 'NightEffect', 0.5, 0.5)
	end

	if curStep == 672 then
		doTweenAlpha('TurningNoon', 'NightEffect', 0, 0.5)
	end

	if curStep == 928 then
		doTweenAlpha('TurningNight', 'NightEffect', 0.5, 0.5)
	end

	if curStep == 960 then
		doTweenAlpha('TurningNoon', 'NightEffect', 0, 0.5)
	end

end