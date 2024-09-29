function onCreatePost()
  initLuaShader('WavyShader')
	makeLuaSprite('redsky', 'dave/redsky', -1200, -900)
	scaleObject('redsky', 2, 2)
  	setProperty('redsky.antialiasing', false)
	addLuaSprite('redsky', false)


	
  setSpriteShader('redsky', 'WavyShader')
end
elapsedTime = 0
function onUpdate(elapsed)
  elapsedTime = elapsedTime + elapsed
  setShaderFloat('redsky', 'uTime', elapsedTime)
end