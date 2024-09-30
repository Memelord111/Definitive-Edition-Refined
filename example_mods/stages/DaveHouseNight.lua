function onCreate()

	makeLuaSprite('sky', 'dave/stars', -600, -300)
	setScrollFactor('sky', 0.6, 0.6)
	addLuaSprite('sky', false)

	makeLuaSprite('NoonBG','bambi/noon',-608,-500)
	addLuaSprite('NoonBG',false)
	setLuaSpriteScrollFactor('NoonBG', 0.6, 0.6)
	setProperty('NoonBG.alpha', 0)

	makeLuaSprite('NightBG','bambi/stars', -680,-500)
	addLuaSprite('NightBG',false)
	setLuaSpriteScrollFactor('NightBG', 0.6, 0.6)
	setProperty('NightBG.alpha', 0)


	makeLuaSprite('hills2', 'dave/nihgt/hills', -434, -259)
	setScrollFactor('hills2', 0.7, 0.7)
	setProperty('hils2.scale.x', 0.4);
	setProperty('hills2.scale.y', 0.4);
	addLuaSprite('hills2', false)

	makeLuaSprite('hills', 'dave/nihgt/hills', -834, -159)
	setProperty('hils.scale.x', 0.8);
	setProperty('hills.scale.y', 0.8);
	setScrollFactor('hills', 0.7, 0.7)
	addLuaSprite('hills', false)

	makeLuaSprite('grass bg', 'dave/nihgt/grass bg', -1205, 580)
	addLuaSprite('grass bg', false)

	makeLuaSprite('gate', 'dave/nihgt/gate', -755, 250)
	addLuaSprite('gate', false)
	
	makeLuaSprite('grass', 'dave/nihgt/grass', -832, 505)
	addLuaSprite('grass', false)

	makeLuaSprite('NightEffect', 'Bambi/NightEffect', 0, 0)
	addLuaSprite('NightEffect',true)
	setObjectCamera('NightEffect', 'camgame')
	setProperty('NightEffect.scale.x', 12.5);
	setProperty('NightEffect.scale.y', 12.5);
	setProperty('NightEffect.alpha', 0)
end