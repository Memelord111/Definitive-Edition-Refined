function onUpdate()
	if stringStartsWith(getProperty'boyfriend.animation.curAnim.name', 'sing') and getProperty 'boyfriend.animation.curAnim.finished' then
		runHaxeCode 'game.boyfriend.dance();'
	end
	if stringStartsWith(getProperty'dad.animation.curAnim.name', 'sing') and getProperty 'dad.animation.curAnim.finished' then
		runHaxeCode 'game.dad.dance();'
	end
end