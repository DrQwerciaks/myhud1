Config = {}

-- Should money be displayed in the hud?
Config.showMoneyInHud = true

-- Should the player health be displayed in the hud?
Config.showHealthInHud = true

-- Should the voice range be displayed in the hud?
-- You have to trigger the Client Event TriggerEvent("myHUD:updateVoiceRange", percent(1-100)) in your voice chat then.

Config.showVoiceRangeInHud = true

-- If you have a voice range which multiplied * x results 100, than you can change the multiplier here, to make the 
-- display more realistic: f.e. you have the voice ranges 3,5,10 and 25. Then you can set 4 here and sent your current voice range with the event
-- to display the progress bar relative to the voice range.
Config.VoiceRangeMultiplier = 3.125

-- For further changes you have to edit different files, but to make it as easy as possible I've listed them here for you:
-- Adjust the strength of the progress bars at style.css line 72         height: 9px;
-- Change the UI Colours in style.css
-- voice range: l.82
-- health: l.85
-- hunger: l.88
-- thirst: l.91
-- drunk:  l.94
-- -------------------------------