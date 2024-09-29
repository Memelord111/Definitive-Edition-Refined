--this works for me, so... don't edit it! works perfectly like is!
function onStartCountdown()
 --shouldn't use onCreate or onCreatePost for this, onStartCountdown is fully recomendable
 a = getRunningScripts();
 for i = 1, #a do
  if stringStartsWith(a[i], 'mods/scripts/ratings') then
   removeLuaScript(a[i]);
  end 
 end 
 return Function_Continue;
end