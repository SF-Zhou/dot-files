-- disalbe animations
hs.window.animationDuration = 0

hs.hotkey.bind({"cmd", "shift"}, "U", function()
    hs.execute("/usr/local/bin/node /Users/sfzhou/Work/Front.End/Learning.Node.js/1.Tools/2.image.hosting/upload.js")
end)

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
