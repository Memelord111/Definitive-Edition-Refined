function onEvent(n,v1,v2)
	if n == "videodie" then
			makeLuaSprite('videodead','thisvideo', -550, -235)
			scaleObject('videodead', 2.5, 2.2);
			addLuaSprite('videodead', true);
	end
end
