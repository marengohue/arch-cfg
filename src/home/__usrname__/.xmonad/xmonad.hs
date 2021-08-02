import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)

xmobarRc = "~/.xmonad/xmobar.hs"

customWorkspaces = [ "main", "web", "steam" ] ++ [ "4", "5", "6" ]

main = do
  xmproc <- spawnPipe ("xmobar " ++ xmobarRc)
  xmonad $ docks defaults

defaults = desktopConfig {
    terminal    = "alacritty",
    modMask     = mod4Mask,
    workspaces  = customWorkspaces,
    layoutHook  = avoidStruts $ layoutHook desktopConfig
}
