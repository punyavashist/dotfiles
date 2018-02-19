-- I do too much with developmental versions of HS -- I don't need
-- extraneous info in the Console application for every require; very
-- few of my crashes  make it into Crashlytics anyways...
--
-- I don't recommend this unless you like doing your own troubleshooting
-- since it defeats some of the data captured for crash reports.
--
_asm = {}
_asm.hs_default_require = require
require = rawrequire

-- Link Spoons dir
- TODO: doesnt work
-- package.path = hs.configdir .. "/Spoons/?.spoon/init.lua;"

-- Override print so that it can render styled text objects directly in the console
-- this needs to happen before hs.ipc is loaded since it also overrides print for mirroring
local console     = require("hs.console")
_asm.hs_default_print = print
print = console.printStyledtext

print("-- " .. os.date()) -- Know when it gets sourced

-- local requirePlus = require("utils.require")
local crash       = require("hs.crash")
local window      = require("hs.window")
local application = require("hs.application")
local logger      = require("hs.logger")
local timer       = require("hs.timer")
local ipc         = require("hs.ipc")
local alert       = require("hs.alert")
local logger      = require("hs.logger")

-- Something steals focus from an application which was focused before HS starts; capture that
-- window and then we'll switch back to it at the end
local fmW = window.frontmostWindow()

crash.crashLogToNSLog = true
crash.crashLog("Disabled require logging to make log file sane")

logger.historySize(1000)
logger.truncateID = "head"
logger.truncateIDWithEllipsis = true

window.animationDuration = 0
ipc.cliInstall("/opt/amagill")

hs.hints.showTitleThresh = 9
hs.allowAppleScript(true)

-- _Constants
local caps = {"alt", "ctrl"}
local cmd_alt = {"cmd", "alt"}
local cmd_alt_ctrl = {"cmd", "alt", "ctrl"}
local cmd_alt_shift = {"cmd", "alt", "shift"}
local cmd_alt_ctrl_shift = {"cmd", "alt", "ctrl", "shift"}

local main_monitor = "Color LCD"
local second_monitor = "DELL U2515H"

local mouseCircle = nil
local mouseCircleTimer = nil

-- _Variables
-- Colors
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
black50 = {red = 0, blue = 0, green = 0, alpha = 0.5}
darkblue = {red = 24 / 255, blue = 195 / 255, green = 145 / 255, alpha = 1}
red = {red = 229 / 255, blue = 66 / 255, green = 77 / 255, alpha = 1}

-- Show TODO task briefly in middle of screen
function showTodoTask()
    if not todo_draw then
        local mainScreen = hs.screen.mainScreen()
        local mainRes = mainScreen:fullFrame()
        local todo_str = hs.execute("~/app/hammerspoon/todo"):match("^(.*)[\r\n]?$")
        local todo =
            hs.styledtext.new(
            todo_str,
            {font = {name = "Impact", size = 100}, color = red, paragraphStyle = {alignment = "center"}}
        )
        local timeframe = hs.geometry.rect(mainRes.x, mainRes.y + (mainRes.h - 200) / 2, mainRes.w, 150)
        -- TODO: add black background
        todo_draw = hs.drawing.text(timeframe, todo)
        todo_draw:setLevel(hs.drawing.windowLevels.overlay)
        todo_draw:show()
        timer =
            hs.timer.doAfter(
            4,
            function()
                todo_draw:delete()
                todo_draw = nil
            end
        )
    else
        todo_draw:delete()
        todo_draw = nil
    end
end

hs.urlevent.bind("showTodoTask", showTodoTask)

-- _Display clipboard contents
function showClipBoardContent()
    clipboard = hs.pasteboard.getContents()
    hs.alert.show(clipboard)
end
hs.urlevent.bind("showClipBoardContent", showClipBoardContent)

-- _Wifi watcher
wifiwatcher =
    hs.wifi.watcher.new(
    function()
        net = hs.wifi.currentNetwork()
        if net == nil then
            hs.notify.show("WiFi disconnected", "", "", "")
        else
            hs.notify.show("WiFi connected", "", net, "")
        end
    end
)
wifiwatcher:start()

-- _Visually circle my mouse pointer
function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - 40, mousepoint.y - 40, 80, 80))
    mouseCircle:setStrokeColor({["red"] = 100, ["blue"] = 0, ["green"] = 40, ["alpha"] = 1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 2 seconds
    mouseCircleTimer =
        hs.timer.doAfter(
        2,
        function()
            mouseCircle:delete()
        end
    )
end
hs.urlevent.bind("visuallyCircleMouse", mouseHighlight)

function showTime()
    if not time_draw then
        local mainScreen = hs.screen.mainScreen()
        local mainRes = mainScreen:fullFrame()
        local time_str =
            hs.styledtext.new(
            os.date("%H:%M"),
            {font = {name = "Impact", size = 120}, color = red, paragraphStyle = {alignment = "center"}}
        )
        local timeframe = hs.geometry.rect((mainRes.w - 300) / 2, (mainRes.h - 200) / 2, 300, 150)
        time_draw = hs.drawing.text(timeframe, time_str)
        time_draw:setLevel(hs.drawing.windowLevels.overlay)
        time_draw:show()
        timer =
            hs.timer.doAfter(
            4,
            function()
                time_draw:delete()
                time_draw = nil
            end
        )
    else
        time_draw:delete()
        time_draw = nil
    end
end
hs.urlevent.bind("showTime", showTime)

-- _Window management
hs.window.animationDuration = 0
hs.hotkey.alertDuration = 0

resize_current_winnum = 1
resize_win_list = hs.window.visibleWindows()

function cycle_wins_next()
    resize_win_list[resize_current_winnum]:focus()
    resize_current_winnum = resize_current_winnum + 1
    if resize_current_winnum > #resize_win_list then
        resize_current_winnum = 1
    end
end
hs.urlevent.bind("cycleWindowsNext", cycle_wins_next)

function cycle_wins_pre()
    resize_win_list[resize_current_winnum]:focus()
    resize_current_winnum = resize_current_winnum - 1
    if resize_current_winnum < 1 then
        resize_current_winnum = #resize_win_list
    end
end
hs.urlevent.bind("cycleWindowsPrevious", cycle_wins_pre)

-- Doesn't work
function showWindowHints()
    hs.hints.windowHints()
end
hs.urlevent.bind("showActiveWindows", showWindowHints)

-- _Testing
-- Google search
local anycomplete = require "anycomplete/anycomplete"
anycomplete.registerDefaultBindings(cmd_alt_ctrl, "R")

-- TODO: Finish it
function focus()
end
hs.urlevent.bind("tester", focus)

-- _Meta
function openConsole()
    hs.toggleConsole()
end

hs.urlevent.bind("openConsole", openConsole)

hs.urlevent.bind("reloadConfig", hs.reload)

-- Notify that config is reloaded
hs.alert.show("config loaded")
