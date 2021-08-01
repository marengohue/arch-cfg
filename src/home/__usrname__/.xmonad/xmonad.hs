import XMonad

-- This is the most basic possible setup
main = xmonad def
	{ terminal	= "alacritty"
	, modMask	= mod4Mask
	}

