function onCreate()
	makeLuaSprite('sky', 'dave/sky_night', -475, -125)
        setScrollFactor('sky', 0.5, 0.5)
        scaleObject('sky', 0.95, 0.95)
	addLuaSprite('sky', false)

	makeLuaSprite('hills', 'dave/hillsnight', -650, 0)
        setScrollFactor('hills', 0.7, 0.7)
        scaleObject('hills', 0.95, 0.95)
	addLuaSprite('hills', false)

	makeLuaSprite('gates', 'dave/gatesnight', -560, 425)
        scaleObject('gates', 0.95, 0.95)
	addLuaSprite('gates', false)

	makeLuaSprite('floor', 'dave/grassnight', -650, 675)
        scaleObject('floor', 0.95, 0.95)
	addLuaSprite('floor', false)
end