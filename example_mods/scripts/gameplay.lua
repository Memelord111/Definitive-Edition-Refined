function onStartCountdown()
    if songName == 'Blocked' or songName == 'Corn-theft' or songName == 'Maze' or songName == 'Cheating-remix' or songName == 'Unfairness-alt' or songName == 'Mealie' or songName == 'Indignancy' or songName == 'Screwed' or songName == 'Supernovae' or songName == 'Glitch' or songName == 'Master' or songName == 'Cheating' or songName == 'Unfairness' then
        setProperty('introSoundsSuffix', '_bambi')
    end
    if songName == 'Warmup' or songName == 'House' or songName == 'Insanity' or songName == 'Polygonized' or songName == 'Furiosity' or songName == 'Memory' or songName == 'Interdimensional' or songName == 'Rano' or songName == 'Bonus-song' then
        setProperty('introSoundsSuffix', '_dave')
    end
end