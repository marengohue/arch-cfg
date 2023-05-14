module Theming
(
    ColorTheme(..)
    , toXmobarTheme
) where

import XMonad.Hooks.DynamicLog(xmobarColor)

data ColorTheme a = ColorTheme {
      highlightStrong :: a
    , highlightDim :: a 
    
    , primary :: a
    , primaryDim :: a
    , primaryInverted :: a

    , warning :: a
    , alarm :: a

    , barFg :: a
    , barBg :: a
    , barFgSelected :: a
    , barBgSelected :: a
    }

toXmobarTheme :: (ColorTheme String) -> (ColorTheme (String -> String))
toXmobarTheme a = ColorTheme {
      highlightStrong = xmobarColor (highlightStrong a) ""
    , highlightDim = xmobarColor (highlightStrong a) ""
    , primary = xmobarColor (primary a) ""
    , primaryDim = xmobarColor (primaryDim a) ""
    , primaryInverted = xmobarColor (primaryInverted a) ""
    , warning = xmobarColor (warning a) ""
    , alarm = xmobarColor (alarm a) ""
    , barFg = xmobarColor (barFg a) ""
    , barBg = xmobarColor (barBg a) ""
    , barFgSelected = xmobarColor (barFgSelected a) ""
    , barBgSelected = xmobarColor (barBgSelected a) ""
    }
