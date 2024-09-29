--kade engine combo stuff!

lol = {-1000, -1000, -1000, -1000}
older = {}
oldSicks = 0
oldGoods = 0
oldBads = 0
oldShits = 0
settings = {
  ['offset'] = {0, 20},
  ['color'] = 'FFFFFF'
}
function setRatingSetting(setting, var)
  settings[setting] = var
end
function onCreatePost() --sets base psych engine combo stuff off screen, if the game crashes its not my fault lol! should implement the other way of hiding the combo
  -- luaDebugMode = true
  older = getPropertyFromClass('ClientPrefs', 'comboOffset')
  setPropertyFromClass('ClientPrefs', 'comboOffset', lol)
  addHaxeLibrary('Rating')
end
function onDestroy()
  setPropertyFromClass('ClientPrefs', 'comboOffset', older)
end
function goodNoteHit(id, data, type, sus)
  if not sus and songName:lower() ~= dofile('mods/'..currentModDirectory..'/modName.lua') then
    local daRating = ''
    local wasThreeDee = getPropertyFromGroup('notes', id, 'texture') == 'notes/NOTE_assets_3D'
    if getPropertyFromGroup('notes', id, 'noteType') == 'shape' then
      wasThreeDee = true
    end
    if boyfriendName == 'bf-3d' then
      wasThreeDee = true
    end
    local stupidPrefix = wasThreeDee and 'ui/3D/' or ''
    if getProperty('sicks') > oldSicks then
       oldSicks = getProperty('sicks')
       daRating = 'sick'
    elseif getProperty('goods') > oldGoods then
       oldGoods = getProperty('goods')
       daRating = 'good'
    elseif getProperty('bads') > oldBads then
       oldBads = getProperty('bads')
       daRating = 'bad'
    elseif getProperty('shits') > oldShits then
       oldShits = getProperty('shits')
       daRating = 'shit'
    end
    -- debugPrint(daRating)
    makeLuaText('coolTextREDONE', tostring(getProperty('combo')))
    screenCenter('coolTextREDONE')
    setProperty('coolTextREDONE.x', (screenWidth * 0.55) + settings['offset'][1])
    setProperty('coolTextREDONE.y', getProperty('coolTextREDONE.y') + settings['offset'][2])
    local ratingSprite = 'ratingREDONE'..id

    makeLuaSprite(ratingSprite, stupidPrefix..daRating)
    screenCenter(ratingSprite)
    setProperty(ratingSprite..'.x', getProperty('coolTextREDONE.x') - 40)
    setProperty(ratingSprite..'.y', getProperty(ratingSprite..'.y') - 60 + settings['offset'][2])
    setProperty(ratingSprite..'.acceleration.y', 550)
    setProperty(ratingSprite..'.velocity.y', getProperty(ratingSprite..'.velocity.y') - getRandomInt(140, 175))
    setProperty(ratingSprite..'.velocity.x', getProperty(ratingSprite..'.velocity.x') - getRandomInt(0, 10))
    setProperty(ratingSprite..'.antialiasing', not wasThreeDee)
    setProperty(ratingSprite..'.color', getColorFromHex(settings['color']))

    if getProperty('combo') > 9 then
      local comboSprite = 'comboREDONE'..id
      makeLuaSprite(comboSprite, stupidPrefix..'combo')
      screenCenter(comboSprite)
      setProperty(comboSprite..'.x', getProperty('coolTextREDONE.x'))
      setProperty(comboSprite..'.y', getProperty(comboSprite..'.y') + settings['offset'][2])
      setProperty(comboSprite..'.acceleration.y', 600)
      setProperty(comboSprite..'.velocity.y', -150)
      setProperty(comboSprite..'velocity.x', getRandomInt(1, 10))
      scaleObject(comboSprite, 0.7, 0.7)
      setProperty(comboSprite..'.antialiasing', not wasThreeDee)
      setProperty(comboSprite..'.color', getColorFromHex(settings['color']))
      addLuaSprite(comboSprite, true)

      ezTimer('vbdfgb'..comboSprite, crochet * 0.001, function()
        if stupidFuckingBullshit(comboSprite) then
          doTweenAlpha(comboSprite..'asdf', comboSprite, 0, 0.2)
          ezTimer('sbvssfv'..comboSprite, 0.2, function()
            removeLuaSprite(comboSprite, true)
          end)
        end
      end)
    end


    local seperatedScore = {}

    local comboSplit = {}

    tostring(getProperty('combo')):gsub(".", function(c)
      table.insert(comboSplit, c)
    end)

    if #comboSplit == 2 then
      table.insert(seperatedScore, 0)
    end

    for k,v in pairs(comboSplit) do
      table.insert(seperatedScore, tonumber(v))
    end

    for k,v in pairs(seperatedScore) do
      local numScoreSprite = 'numScoreREDONE'..k..id
      -- debugPrint(v)
      makeLuaSprite(numScoreSprite, stupidPrefix..'num'..tostring(v))
      screenCenter(numScoreSprite)
      setProperty(numScoreSprite..'.x', getProperty('coolTextREDONE.x') + (43 * k) - 90)
      setProperty(numScoreSprite..'.y', getProperty(numScoreSprite..'.y') + 80 + settings['offset'][2])
      setProperty(numScoreSprite..'.acceleration.y', getRandomInt(200, 300))
      setProperty(numScoreSprite..'.velocity.y', getProperty(numScoreSprite..'.velocity.y') - getRandomInt(140, 160))
      setProperty(numScoreSprite..'.velocity.x', getRandomFloat(-5, 5))
      setProperty(numScoreSprite..'.antialiasing', not wasThreeDee)
      setProperty(numScoreSprite..'.color', getColorFromHex(settings['color']))
      scaleObject(numScoreSprite, 0.5, 0.5)

      if getProperty('combo') >= 10 or getProperty('combo') == 0 then
        addLuaSprite(numScoreSprite, true)
      end
      ezTimer('stupid'..numScoreSprite, crochet * 0.002, function()
        if stupidFuckingBullshit(numScoreSprite) then
          doTweenAlpha(numScoreSprite, numScoreSprite, 0, 0.2)
          ezTimer('asdfa'..numScoreSprite, 0.2, function()
            removeLuaSprite(numScoreSprite, true)
          end)
        end
      end)
    end

    scaleObject(ratingSprite, 0.7, 0.7)
    addLuaSprite(ratingSprite, true)

    ezTimer('asggas'..ratingSprite, crochet * 0.001, function()
      if stupidFuckingBullshit(ratingSprite) then
        doTweenAlpha(ratingSprite, ratingSprite, 0, 0.2)
        ezTimer('asfghadfghdf'..ratingSprite, 0.2, function()
          removeLuaSprite(ratingSprite, true)
        end)
      end
    end)
  end
end
function stupidFuckingBullshit(spr)
  return runHaxeCode([[
    return game.modchartSprites.exists(']]..spr..[[');
  ]])
end
timers = {blankTags = 0}
function ezTimer(tag, timer, callback)
  if tag == nil then
    tag = 'blank_tags-'..tostring(timers.blankTags)
    timers.blankTags = timers.blankTags + 1
  end
  timers[tag] = callback
  runTimer(tag, timer)
end
function onTimerCompleted(tag)
  if timers[tag] ~= nil then
    timers[tag]()
    timers[tag] = nil
    if stringStartsWith(tag, 'blank_tags-') then
      timers.blankTags = tonumber(stringSplit(tag, '-')[2])
    end
  end
end
function split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end