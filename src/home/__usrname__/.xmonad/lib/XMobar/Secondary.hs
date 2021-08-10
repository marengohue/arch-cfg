module XMobar.Secondary
    ( secondaryCfg 
    , secondaryIdx
    , secondaryRc
    )
where

import Theming
import XMobar.Bar(ppWindow)
import XMonad.Util.Loggers
import XMonad.Hooks.DynamicLog

import MarengoLilac(theme)
import Theming(toXmobarTheme, ColorTheme(..))

xmobarTheme :: ColorTheme (String -> String)
xmobarTheme = toXmobarTheme theme

secondaryCfg:: PP
secondaryCfg = def
    { ppSep                 = "   "
    , ppTitleSanitize       = xmobarStrip
    , ppCurrent             = (highlightDim xmobarTheme) . wrap "<box type=Top>" "</box>"
    , ppVisible             = wrap "<box type=Top>" "</box>"
    , ppHidden              = wrap "" ""
    , ppHiddenNoWindows     = (primaryDim xmobarTheme) . wrap " " ""
    , ppUrgent              = (alarm xmobarTheme) . wrap ((warning xmobarTheme) "!") ((warning xmobarTheme) "!")
    , ppOrder               = \[ws, _, win] -> [ws, win]
    }

secondaryIdx :: Int
secondaryIdx = 0

secondaryRc :: String
secondaryRc = "~/.xmonad/secondary-xmobarrc"

