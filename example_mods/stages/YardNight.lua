function onCreate()
	
	makeLuaSprite('NightBG','dave/sky_night',-680,-130)
	addLuaSprite('NightBG',false)
	setLuaSpriteScrollFactor('NightBG', 0.1, 0.1)
	
	makeLuaSprite('Hills','dave/hillsnight', -652, -20)
	addLuaSprite('Hills',false)
	setLuaSpriteScrollFactor('Hills', 0.7, 0.7)
	--setProperty('Hills.scale.x', 0.3);
    --setProperty('Hills.scale.y', 0.3);

	makeLuaSprite('grassBG','dave/grassbgnight', -725, 400)
	addLuaSprite('grassBG',false)
	setLuaSpriteScrollFactor('grassBG', 0.3, 0.3)

	makeLuaSprite('Gate','dave/gatesnight', -542, 440)
	addLuaSprite('Gate',false)
	setLuaSpriteScrollFactor('Gate', 0.9, 0.9)

	makeLuaSprite('grass','dave/grassnight', -725, 580)
	addLuaSprite('grass',false)
	setLuaSpriteScrollFactor('grass', 1, 1)
	setProperty('grass.scale.x', 0.8);
	

	close(true);
end