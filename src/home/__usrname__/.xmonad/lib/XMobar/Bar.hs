module XMobar.Bar
    ( ppWindow )
where

import XMonad.Hooks.DynamicLog(xmobarRaw, shorten)

ppWindow :: String -> String
ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

