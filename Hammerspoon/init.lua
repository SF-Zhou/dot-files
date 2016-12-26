-- tap control for escape
ctrl_table = {
    sends_escape = true,
    last_mods = {}
}

control_key_timer = hs.timer.delayed.new(0.15, function()
    ctrl_table["send_escape"] = false
end
)

last_mods = {}

control_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["ctrl"] == new_mods["ctrl"] then
      return false
  end
  if not last_mods["ctrl"] then
    last_mods = new_mods
    ctrl_table["send_escape"] = true
    control_key_timer:start()
  else
    if ctrl_table["send_escape"] then
      hs.eventtap.keyStroke({}, "ESCAPE")
    end
    last_mods = new_mods
    control_key_timer:stop()
  end
  return false
end

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
