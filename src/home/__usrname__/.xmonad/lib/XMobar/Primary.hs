module XMobar.Primary
    ( primaryCfg
    , primaryIdx
    , primaryRc
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

primaryCfg:: PP
primaryCfg = def
    { ppTitleSanitize       = xmobarStrip
    , ppOrder               = \[_, _, win] -> [win]
    }

primaryIdx :: Int
primaryIdx = 1

primaryRc :: String
primaryRc = "~/.xmonad/primary-xmobarrc"

