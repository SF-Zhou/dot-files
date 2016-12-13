function table.length( tbl )
  local count = 0
  for _ in pairs(tbl) do count = count + 1 end
  return count
end

saved = {ready=false, last_is_empty=true}
control_handler = function(evt)
    local current = evt:getFlags()

    if saved["ready"] and not next(current) then
        saved["ready"] = false
        saved["last_is_empty"] = true
        hs.eventtap.keyStroke({}, "ESCAPE")
        return false
    else
        saved["ready"] = false
    end

    if current["ctrl"] and saved["last_is_empty"] and table.length(current) == 1 then
        saved["ready"] = true
    end

    if not next(current) then
        saved["last_is_empty"] = true
    else
        saved["last_is_empty"] = false
    end

    return false
end

key_handler = function(evt)
    saved["ready"] = false
    return false
end

hs.eventtap.new({10, 11}, key_handler):start()
hs.eventtap.new({12}, control_handler):start()

-- disalbe animations
hs.window.animationDuration = 0

-- for whole window
hs.hotkey.bind({"cmd", "shift"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  win:setFrame(max)
end)

-- for left half window
hs.hotkey.bind({"cmd", "shift"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- for right half window
hs.hotkey.bind({"cmd", "shift"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- reload config
hs.hotkey.bind({"cmd", "shift"}, "Down", function()
  hs.reload()
end)
hs.alert.show("Hammerspoon Config Reloaded")
