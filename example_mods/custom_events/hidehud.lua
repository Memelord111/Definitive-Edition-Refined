function onEvent(name,value1,value2)
	if name == 'Goodbye Hud' then
		doTweenAlpha('healthBarBG','healthBar','scoreTxt','iconP1','iconP2','timeBar','timeBarBG','timeTxt', tonumber(value1), tonumber(value2), 'linear');
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end