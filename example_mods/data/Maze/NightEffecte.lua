function onCreatePost()
	makeLuaSprite('NightEffect', 'Bambi/NightEffect', 0, 0)
	addLuaSprite('NightEffect',true)
	setObjectCamera('NightEffect', 'camgame')
	setProperty('NightEffect.scale.x', 12.5);
    setProperty('NightEffect.scale.y', 12.5);
	setProperty('NightEffect.alpha', 0)

end

function onUpdate(elapsed)
	if curStep == 900 then
		doTweenAlpha('TurningNight', 'NightEffect', 0.5, 55)
		doTweenAlpha('TurningNight2', 'NightBG', 1, 55)
	end
end