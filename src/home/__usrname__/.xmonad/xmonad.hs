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
import XMonad.Hooks.ManageDocks

import MarengoLilac(theme)
import Theming(toXmobarTheme, ColorTheme(..))

import XMobar.Primary(primaryCfg, primaryIdx, primaryRc)
import XMobar.Secondary(secondaryCfg, secondaryIdx, secondaryRc)
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Spacing(spacingRaw, Border(..))

customWorkspaces = [ "main", "web", "steam" ] ++ [ "4", "5", "6" ]

main = xmonad
     . ewmhFullscreen
     . ewmh
    =<< (statusBar (printf "xmobar %s -x %d" primaryRc primaryIdx) primaryCfg toggleStrutsKey)
    =<< (statusBar (printf "xmobar %s -x %d" secondaryRc secondaryIdx) secondaryCfg toggleStrutsKey) 
    cfg
  where
    toggleStrutsKey XConfig{ modMask = m} = (m, xK_b)

resetXmonad = spawn "xmonad --recompile; killall xmobar; xmonad --restart"

dmenuCmd = printf "dmenu_run -nb \"%s\" -fn \"xft:Iosevka SS08:size=12:style=Bold\" -sb \"%s\" -sf \"%s\"" bgNormal bgSelected bgNormal
    where
        bgNormal = (primaryInverted theme)
        bgSelected = (highlightDim theme)

extraKeys = [
    ("M-p", unGrab *> spawn "gscreenshot -cs"),
    ("M-S-p", spawn "gscreenshot -c"),
    ("M-d", spawn dmenuCmd), 
    ("M-q", resetXmonad)
    ]

layoutCfg = avoidStruts $ lessBorders Screen $ tiled ||| noBorders Full
  where
    tiled = lessBorders Screen $ spacing $ ResizableTall nmaster delta ratio []
    spacing = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True
    nmaster = 1
    ratio = 1/2
    delta = 3/100

cfg = desktopConfig {
    terminal    = "alacritty",
    modMask     = mod4Mask,
    workspaces  = customWorkspaces,
    normalBorderColor = (primaryDim theme),
    focusedBorderColor = (highlightDim theme),
    layoutHook  = smartBorders $ toggleLayouts(noBorders Full) $ layoutCfg,
    manageHook = manageDocks
} `additionalKeysP` extraKeys
