-- The first event mabe by me(Scarlet Eye) --
function onEvent(name, value1, value2)
	if name == 'WhiteVG' then
		if value1 then -- begining
		makeLuaSprite('White', 'heaven', 1, 1)
	    setObjectCamera('White', 'other')
	    setObjectOrder('White', 5)
	    addLuaSprite('White', true)
	    doTweenAlpha('White', 'White', 1, value1, 'quadInOut');
	end
	    if value2 then -- end
	    makeLuaSprite('White', 'heaven', 0, 0)
	    setObjectCamera('White', 'other')
	    setObjectOrder('White', 5)
	    addLuaSprite('White', true)
		doTweenAlpha('White', 'White', 0, value2, 'quadInOut');
	    end
	end
end