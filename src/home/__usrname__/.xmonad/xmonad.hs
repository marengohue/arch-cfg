import Text.Printf
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.ManageDocks
import XMonad.Util.Ungrab
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Util.Loggers

xmobarRc = "~/.xmonad/xmobarrc"

customWorkspaces = [ "main", "web", "steam" ] ++ [ "4", "5", "6" ]

magentaHex = "#ff79c6"
blueHex = "#bd93f9"
whiteHex = "#f8f8f2"
yellowHex = "#f1fa8c"
redHex = "#ff5555"
lowWhiteHex = "#444444"
blackHex = "#000000"

blue, lowWhite, magenta, red, white, yellow :: String -> String
magenta  = xmobarColor magentaHex ""
blue     = xmobarColor blueHex ""
white    = xmobarColor whiteHex ""
yellow   = xmobarColor yellowHex ""
red      = xmobarColor redHex ""
lowWhite = xmobarColor whiteHex ""

prettyPrintCfg :: PP
prettyPrintCfg = def
    { ppSep                 = magenta " • "
    , ppTitleSanitize       = xmobarStrip
    , ppCurrent             = wrap (blue "[") (blue "]")
    , ppHidden              = white . wrap " " ""
    , ppHiddenNoWindows     = lowWhite . wrap " " ""
    , ppUrgent              = red . wrap (yellow "!") (yellow "!")
    , ppOrder               = \[ws, l, win] -> [ws, l, win]
    }
  where
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30
    
main = xmonad
     . ewmh
    =<< (statusBar "xmobar ~/.xmonad/xmobar.hs" prettyPrintCfg toggleStrutsKey) cfg
  where
    toggleStrutsKey XConfig{ modMask = m} = (m, xK_b)

resetXmonad = spawn "xmonad --recompile; killall xmobar; xmonad --restart"

dmenuCmd = printf "dmenu_run -nb \"%s\" -fn \"xft:Iosevka SS08:size=12:style=Bold\" -sb \"%s\" -sf \"%s\"" blackHex blueHex blackHex

extraKeys = [
    ("M-p", unGrab *> spawn "gscreenshot -cs"),
    ("M-S-p", spawn "gscreenshot -c"),
    ("M-d", spawn dmenuCmd), 
    ("M-q", resetXmonad) ]

cfg = desktopConfig {
    terminal    = "alacritty",
    modMask     = mod4Mask,
    workspaces  = customWorkspaces,
    normalBorderColor = lowWhiteHex,
    focusedBorderColor = blueHex,
    layoutHook  = avoidStruts $ layoutHook desktopConfig,
    handleEventHook = handleEventHook def <+> fullscreenEventHook
} `additionalKeysP` extraKeys
