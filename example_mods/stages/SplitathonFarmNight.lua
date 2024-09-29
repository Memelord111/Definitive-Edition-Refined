function onCreate()

	makeLuaSprite('DayBG','bambi/sky', -680,-130)
	addLuaSprite('DayBG',false)
	setLuaSpriteScrollFactor('DayBG', 0.1, 0.1)
	setProperty('DayBG.alpha', 1)

	makeLuaSprite('NightBG','bambi/stars', -550,-190)
	addLuaSprite('NightBG',false)
	setLuaSpriteScrollFactor('NightBG', 0.55, 0.55)
	setProperty('NightBG.alpha', 1)

	makeLuaSprite('flatgrass','bambi/gm_flatgrass', 110, -73)
	addLuaSprite('flatgrass',false)
	setLuaSpriteScrollFactor('flatgrass', 0.6, 0.6)
	setProperty('flatgrass.scale.x', 0.35);
    setProperty('flatgrass.scale.y', 0.35);


	makeLuaSprite('hills','bambi/orangey hills', -70, 80)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.6, 0.6)

	makeLuaSprite('farm','bambi/funfarmhouse', 77, 80)
	addLuaSprite('farm',false)
	setLuaSpriteScrollFactor('farm', 0.6, 0.6)
	setProperty('farm.scale.x', 1);
    setProperty('farm.scale.y', 0.97);

	makeLuaSprite('ground','bambi/grass lands', -480, 480)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeLuaSprite('corn1','bambi/cornFence', -280, 180)
	addLuaSprite('corn1',false)
	setLuaSpriteScrollFactor('corn1', 1, 1)

	makeLuaSprite('corn2','bambi/cornFence2', 1220, 200)
	addLuaSprite('corn2',false)
	setLuaSpriteScrollFactor('corn2', 1, 1)

	makeLuaSprite('sign','bambi/Sign', 120, 330)
	addLuaSprite('sign',false)
	setLuaSpriteScrollFactor('sign', 1, 1)

	makeLuaSprite('picnic','bambi/splitathon/picnic_towel_thing', 1170, 650)
	addLuaSprite('picnic',false)
	setLuaSpriteScrollFactor('picnic', 1, 1)

	makeLuaSprite('cornbag','bambi/cornbag', 1320, 550)
	addLuaSprite('cornbag',false)
	setLuaSpriteScrollFactor('cornbag', 1, 1)
	

	close(true);
end