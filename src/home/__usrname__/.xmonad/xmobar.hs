Config { 
       font = "xft:Iosevka SS08:style=Bold:size=11"
       , additionalFonts = [ "xft:Font Awesome 5 Free-12", "xft:Font Awesome 5 Free Solid-12", "xft:Font Awesome 5 Brands-12" ]
       , borderColor = "black"
       , border = TopB
       , bgColor = "black"
       , fgColor = "grey"
       , alpha = 255
       , position = TopW L 95 
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [
              Run Cpu ["-L","3","-H","50",
                       "--normal","green","--high","red",
                       "-t", "<fn=2>\xf2db</fn>: <total>%"] 10
            , Run Memory ["-t","<fn=2>\xf538</fn>: <usedratio>%"] 10
		   -- , Run Wireless ["-t", "<fn=2>\xf079</fn>: <usedratio>%"] 10 
            , Run Date "%a %Y-%m-%d <fc=#bd93f9><fn=2>\xf017</fn> %H:%M</fc>" "date" 10 
            , Run Com "whoami" [] "" 36000
            , Run Com "cat" [ "/etc/hostname" ] "hostname" 3600
            , Run StdinReader
         ]  
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%whoami%@%hostname%> %StdinReader% }{| %cpu%  %memory% | %date% |"
       }

