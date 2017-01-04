--------------------------------------------------------------------------------
-- _require
--------------------------------------------------------------------------------
require("hs.ipc") -- hammerpoon cli


--------------------------------------------------------------------------------
-- _constants
--------------------------------------------------------------------------------
local caps = {"alt", "ctrl"}
local cmd_alt = {"cmd", "alt"}
local cmd_alt_ctrl = {"cmd", "alt", "ctrl"}
local cmd_alt_shift = {"cmd", "alt", "shift"}
local cmd_alt_ctrl_shift = {"cmd", "alt", "ctrl", "shift"}

local main_monitor = "Color LCD"
local second_monitor = "DELL U2515H"

local mouseCircle = nil
local mouseCircleTimer = nil


--------------------------------------------------------------------------------
-- _variables
--------------------------------------------------------------------------------
-- _colours
white = hs.drawing.color.white
black = hs.drawing.color.black
blue = hs.drawing.color.blue
osx_red = hs.drawing.color.osx_red
osx_green = hs.drawing.color.osx_green
osx_yellow = hs.drawing.color.osx_yellow
tomato = hs.drawing.color.x11.tomato
dodgerblue = hs.drawing.color.x11.dodgerblue
firebrick = hs.drawing.color.x11.firebrick
lawngreen = hs.drawing.color.x11.lawngreen
lightseagreen = hs.drawing.color.x11.lightseagreen
purple = hs.drawing.color.x11.purple
royalblue = hs.drawing.color.x11.royalblue
sandybrown = hs.drawing.color.x11.sandybrown
black50 = {red=0,blue=0,green=0,alpha=0.5}
darkblue = {red=24/255,blue=195/255,green=145/255,alpha=1}

-- _paths

--------------------------------------------------------------------------------
-- _utils
--------------------------------------------------------------------------------
-- show my todo task in a neat window briefly
function showTodoTask () 
hs.alert.show( ( hs.execute("~/Documents/d.\\ app/bitbar/todo") ) )
end
hs.urlevent.bind("showTodoTask", showTodoTask)


-- _display clipboard contents
function showClipBoardContent ()
	clipboard = hs.pasteboard.getContents()
	hs.alert.show(clipboard)
end
hs.urlevent.bind("showClipBoardContent", showClipBoardContent)


-- _wifi watcher
wifiwatcher = hs.wifi.watcher.new(function ()
    net = hs.wifi.currentNetwork()
    if net==nil then
        hs.notify.show("wifi disconnected","","","")
    else
        hs.notify.show("wifi connected","",net,"")
    end
end)
wifiwatcher:start()


-- _visually circle my mouse pointer
function mouseHighlight()
    -- delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- prepare a circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=100,["blue"]=0,["green"]=40,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- set a timer to delete the circle after 2 seconds
    mouseCircleTimer = hs.timer.doAfter(2, function() mouseCircle:delete() end)
end
hs.urlevent.bind("visuallyCircleMouse", mouseHighlight) 

function showTime()
    if not time_draw then
        local mainScreen = hs.screen.mainScreen()
        local mainRes = mainScreen:fullFrame()
        local time_str = hs.styledtext.new(os.date("%H:%M"),{font={name="Impact",size=120},color=darkblue,paragraphStyle={alignment="center"}})
        local timeframe = hs.geometry.rect((mainRes.w-300)/2,(mainRes.h-200)/2,300,150)
        time_draw = hs.drawing.text(timeframe,time_str)
        time_draw:setLevel(hs.drawing.windowLevels.overlay)
        time_draw:show()
        ttimer = hs.timer.doAfter(4, function() time_draw:delete() time_draw=nil end)
    else
        time_draw:delete()
        time_draw=nil
    end
end
hs.urlevent.bind("showTime", showTime) 

--------------------------------------------------------------------------------
-- _window management
--------------------------------------------------------------------------------
hs.window.animationDuration = 0 
hs.hotkey.alertDuration=0


--------------------------------------------------------------------------------
-- _testing
--------------------------------------------------------------------------------
hs.urlevent.bind("someAlert", function(eventName, params)
    hs.alert.show("hey there alert")
end)

local anycomplete = require "anycomplete/anycomplete"
anycomplete.registerDefaultBindings(cmd_alt_ctrl, "W")

function resize_win(direction)
    local win = hs.window.focusedWindow()
    if win then
        local f = win:frame()
        local screen = win:screen()
        local max = screen:fullFrame()
        local stepw = max.w/30
        local steph = max.h/30
        if direction == "right" then f.w = f.w+stepw end
        if direction == "left" then f.w = f.w-stepw end
        if direction == "up" then f.h = f.h-steph end
        if direction == "down" then f.h = f.h+steph end
        if direction == "halfright" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h end
        if direction == "halfleft" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h end
        if direction == "halfup" then f.x = 0 f.y = 0 f.w = max.w f.h = max.h/2 end
        if direction == "halfdown" then f.x = 0 f.y = max.h/2 f.w = max.w f.h = max.h/2 end
        if direction == "cornerNE" then f.x = max.w/2 f.y = 0 f.w = max.w/2 f.h = max.h/2 end
        if direction == "cornerSE" then f.x = max.w/2 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2 end
        if direction == "cornerNW" then f.x = 0 f.y = 0 f.w = max.w/2 f.h = max.h/2 end
        if direction == "cornerSW" then f.x = 0 f.y = max.h/2 f.w = max.w/2 f.h = max.h/2 end
        if direction == "center" then f.x = (max.w-f.w)/2 f.y = (max.h-f.h)/2 end
        if direction == "fcenter" then f.x = stepw*5 f.y = steph*5 f.w = stepw*20 f.h = steph*20 end
        if direction == "fullscreen" then f = max end
        if direction == "shrink" then f.x = f.x+stepw f.y = f.y+steph f.w = f.w-(stepw*2) f.h = f.h-(steph*2) end
        if direction == "expand" then f.x = f.x-stepw f.y = f.y-steph f.w = f.w+(stepw*2) f.h = f.h+(steph*2) end
        if direction == "mright" then f.x = f.x+stepw end
        if direction == "mleft" then f.x = f.x-stepw end
        if direction == "mup" then f.y = f.y-steph end
        if direction == "mdown" then f.y = f.y+steph end
        win:setFrame(f)
    else
        hs.alert.show("no focused window!")
    end
end

function test () 
    resize_win('left')
end
hs.urlevent.bind("tester", test)

--------------------------------------------------------------------------------
-- _meta 
--------------------------------------------------------------------------------
hs.hotkey.bind("alt", "M", hs.toggleConsole)

hs.urlevent.bind("reloadConfig", hs.reload)

-- _notify that config is reloaded
hs.alert.show("config loaded")


