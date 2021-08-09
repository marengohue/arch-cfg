module MarengoLilac
 (theme)
where

import Theming(ColorTheme(..))

theme :: ColorTheme String
theme = ColorTheme
    { highlightStrong = "#ff79c6"
    , highlightDim = "#bd93f9"
    , primary = "#fafaff"
    , primaryDim = "#444444"
    , primaryInverted = "#050500"
    , warning = "#f1fa8c"
    , alarm = "#ff5555"
    }

