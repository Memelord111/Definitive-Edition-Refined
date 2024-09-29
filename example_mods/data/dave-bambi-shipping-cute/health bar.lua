function onCreatePost()
	makeLuaSprite('Health', 'Gapple/healthBarOverlay')
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	scaleObject('Health', 0.93, 0.9)
	setObjectOrder('Health', getObjectOrder('healthBar') + 1)
	setProperty('healthBarBG.visible', true)
end

function onUpdatePost(elapsed)
	setProperty('Health.x', getProperty('healthBar.x') - 5)
	setProperty('Health.y', getProperty('healthBar.y') - 4)
end