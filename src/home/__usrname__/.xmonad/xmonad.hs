import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.ManageDocks
import XMonad.Util.Ungrab
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog

xmobarRc = "~/.xmonad/xmobarrc"

customWorkspaces = [ "main", "web", "steam" ] ++ [ "4", "5", "6" ]
 
main = xmonad . ewmh =<< xmobar cfg

extraKeys = [
    ("M-p", unGrab *> spawn "gscreenshot -cs"),
    ("M-S-p", spawn "gscreenshot -c"),
    ("M-d", spawn "dmenu_run"), 
    ("M-q", spawn "xmonad --recompile; killall xmobar; xmonad --restart") ]

cfg = desktopConfig {
    terminal    = "alacritty",
    modMask     = mod4Mask,
    workspaces  = customWorkspaces,
    layoutHook  = avoidStruts $ layoutHook desktopConfig,
    handleEventHook = handleEventHook def <+> fullscreenEventHook
} `additionalKeysP` extraKeys
