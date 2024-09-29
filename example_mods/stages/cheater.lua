function onCreatePost()
  initLuaShader('GlitchShader')
	makeLuaSprite('cheater', 'cheater', -600, -200)
  setProperty('cheater.antialiasing', false)
	addLuaSprite('cheater', false)
	
  setSpriteShader('cheater', 'GlitchShader')
end
elapsedTime = 0
function onUpdate(elapsed)
  elapsedTime = elapsedTime + elapsed
  setShaderFloat('cheater', 'uTime', elapsedTime)
--Script by MayoOddToSee
end