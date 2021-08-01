import XMonad

xmobarRc = "~/.xmonad/xmobar.hs"
	
main = do
	xmproc <- spawnPipe ("xmobar" ++ xmobarRc)
	xmonad $ defaults

defaults = defaultConfig {
	terminal	= "alacritty"
	modMask		= mod4Mask
}
