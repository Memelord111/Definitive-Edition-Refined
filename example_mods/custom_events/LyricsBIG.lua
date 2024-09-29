function onEvent(name, value1, value2)
    if name == 'LyricsBIG' then
        setTextString('lyrics', value1)
        setTextColor('lyrics', value2)
        setTextFont('lyric', 'comic-sans-ms.ttf')
    end
end

function onCreate()
    if getPropertyFromClass('ClientPrefs', 'downScroll') then
        makeLuaText('lyrics', '', screenWidth, 0, 595)
        addLuaText('lyrics')
        setTextSize('lyrics', 50)
    elseif getPropertyFromClass('ClientPrefs', 'UpScroll') then
        makeLuaText('lyrics', '', screenWidth, 0, 155)
        addLuaText('lyrics')
        setTextSize('lyrics', 50)
    end
end