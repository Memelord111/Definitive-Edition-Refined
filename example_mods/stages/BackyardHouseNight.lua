function onCreate()

	makeLuaSprite('NightBG','sky_night',-680,-130)
	addLuaSprite('NightBG',false)
	setLuaSpriteScrollFactor('NightBG', 0.1, 0.1)

	makeLuaSprite('Hills','HouseBackyard/hills', -1199, -370)
	addLuaSprite('Hills',false)
	setLuaSpriteScrollFactor('Hills', 0.4, 0.4)

	makeLuaSprite('grassBG','HouseBackyard/supergrass', -590, 337)
	addLuaSprite('grassBG',false)
	setLuaSpriteScrollFactor('grassBG', 1, 1)

	makeLuaSprite('gate','HouseBackyard/gates', 75, 35)
	addLuaSprite('gate',false)
	setLuaSpriteScrollFactor('gate', 0.9, 0.9)

	makeLuaSprite('house','HouseBackyard/house', -830, -150)
	addLuaSprite('house',false)
	setLuaSpriteScrollFactor('house', 1, 1)

	makeLuaSprite('grill','HouseBackyard/grill', -283, 583)
	addLuaSprite('grill',false)
	setLuaSpriteScrollFactor('grill', 1, 1)
	

	close(true);
end