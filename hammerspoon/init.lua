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

-- bind Finder
hs.hotkey.bind({"cmd"}, "Space", function()
  hs.application.launchOrFocus("Finder")
end)

-- reload config
hs.hotkey.bind({"cmd", "shift"}, "Down", function()
  hs.reload()
end)

-- simulate mouse
function mouse_down()
  pos = hs.mouse.getAbsolutePosition()
  pos.y = pos.y + 20
  hs.mouse.setAbsolutePosition(pos)
end
function mouse_up()
  pos = hs.mouse.getAbsolutePosition()
  pos.y = pos.y - 20
  hs.mouse.setAbsolutePosition(pos)
end
function mouse_left()
  pos = hs.mouse.getAbsolutePosition()
  pos.x = pos.x - 20
  hs.mouse.setAbsolutePosition(pos)
end
function mouse_right()
  pos = hs.mouse.getAbsolutePosition()
  pos.x = pos.x + 20
  hs.mouse.setAbsolutePosition(pos)
end

hs.hotkey.bind({"option"}, "J", mouse_down, nil, mouse_down)
hs.hotkey.bind({"option"}, "K", mouse_up, nil, mouse_up)
hs.hotkey.bind({"option"}, "H", mouse_left, nil, mouse_left)
hs.hotkey.bind({"option"}, "L", mouse_right, nil, mouse_right)
hs.hotkey.bind({"option"}, "return", function()
  pos = hs.mouse.getAbsolutePosition()
  hs.eventtap.leftClick(pos)
end)

hs.alert.show("Config loaded")
