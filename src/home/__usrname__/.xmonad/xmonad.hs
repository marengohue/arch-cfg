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

import MarengoLilac(theme)
import Theming(toXmobarTheme, ColorTheme(..))

xmobarTheme = toXmobarTheme theme 
customWorkspaces = [ "main", "web", "steam" ] ++ [ "4", "5", "6" ]

prettyPrintCfg :: PP
prettyPrintCfg = def
    { ppSep                 = "   "
    , ppTitleSanitize       = xmobarStrip
    , ppCurrent             = (highlightDim xmobarTheme) . wrap "<box type=Top>" "</box>"
    , ppVisible             = wrap "<box type=Top>" "</box>"
    , ppHidden              = wrap "" ""
    , ppHiddenNoWindows     = (primaryDim xmobarTheme) . wrap " " ""
    , ppUrgent              = (alarm xmobarTheme) . wrap ((warning xmobarTheme) "!") ((warning xmobarTheme) "!")
    , ppOrder               = \[ws, _, win] -> [ws, win]
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

dmenuCmd = printf "dmenu_run -nb \"%s\" -fn \"xft:Iosevka SS08:size=12:style=Bold\" -sb \"%s\" -sf \"%s\"" bgNormal bgSelected
    where
        bgNormal = (primaryInverted theme)
        bgSelected = (highlightDim theme)

extraKeys = [
    ("M-p", unGrab *> spawn "gscreenshot -cs"),
    ("M-S-p", spawn "gscreenshot -c"),
    ("M-d", spawn dmenuCmd), 
    ("M-q", resetXmonad) ]

cfg = desktopConfig {
    terminal    = "alacritty",
    modMask     = mod4Mask,
    workspaces  = customWorkspaces,
    normalBorderColor = (primaryDim theme),
    focusedBorderColor = (highlightDim theme),
    layoutHook  = avoidStruts $ layoutHook desktopConfig,
    handleEventHook = handleEventHook def <+> fullscreenEventHook
} `additionalKeysP` extraKeys
