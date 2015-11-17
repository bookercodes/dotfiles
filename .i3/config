# mod
set $mod Mod4

# font
font pango: System San Francisco Display 10

# thin borders
hide_edge_borders both

# drag windows
floating_modifier $mod

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# lock
bindsym $mod+Shift+x exec i3lock --color 475263

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# split in horizontal orientation
bindsym $mod+b split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen

# change container layout
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

set $workspace1 "1 "
set $workspace2 "2 "
set $workspace3 "3 "
set $workspace4 "4 "
set $workspace5 "5 "
set $workspace6 "6 "
set $workspace7 "7 "
set $workspace8 "8 "
set $workspace9 "9 "
set $workspace10 "10 "

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $workspace1
bindsym $mod+Shift+2 move container to workspace $workspace2
bindsym $mod+Shift+3 move container to workspace $workspace3
bindsym $mod+Shift+4 move container to workspace $workspace4
bindsym $mod+Shift+5 move container to workspace $workspace5
bindsym $mod+Shift+6 move container to workspace $workspace6
bindsym $mod+Shift+7 move container to workspace $workspace7
bindsym $mod+Shift+8 move container to workspace $workspace8
bindsym $mod+Shift+9 move container to workspace $workspace9
bindsym $mod+Shift+0 move container to workspace $workspace10

# switch to workspace
bindsym $mod+1 workspace $workspace1
bindsym $mod+2 workspace $workspace2
bindsym $mod+3 workspace $workspace3
bindsym $mod+4 workspace $workspace4
bindsym $mod+5 workspace $workspace5
bindsym $mod+6 workspace $workspace6
bindsym $mod+7 workspace $workspace7
bindsym $mod+8 workspace $workspace8
bindsym $mod+9 workspace $workspace9
bindsym $mod+0 workspace $workspace10

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace
bindsym $mod+Shift+r restart

# exit i3
bindsym $mod+Shift+e exec /home/booker/.i3/scripts/exit_menu


# resize window (you can also use the mouse for that)
mode "resize" {
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt

    bindsym Lefj resize shrink width 10 px or 10 ppt
    bindsym Down resize grow height 10 px or 10 ppt
    bindsym Up resize shrink height 10 px or 10 ppt
    bindsym Right resize grow width 10 px or 10 ppt

    bindsym Return mode "default"
    bindsym Escape mode "default"
}

# resize mode
bindsym $mod+r mode "resize"

set $bg-color 	         #2f343f
set $inactive-bg-color   #2f343f
set $text-color          #f3f4f5
set $inactive-text-color #676E7D
set $urgent-bg-color     #E53935

# window colors
#                       border              background         text                 indicator
client.focused          $bg-color           $bg-color          $text-color          #00ff00
client.unfocused        $inactive-bg-color $inactive-bg-color $inactive-text-color #00ff00
client.focused_inactive $inactive-bg-color $inactive-bg-color $inactive-text-color #00ff00
client.urgent           $urgent-bg-color    $urgent-bg-color   $text-color          #00ff00

# bar
bar {
  	status_command i3blocks -c /home/booker/.i3/i3blocks.conf
	colors {
		background $bg-color
	    	separator #757575
		#                  border             background         text
		focused_workspace  $bg-color          $bg-color          $text-color
		inactive_workspace $inactive-bg-color $inactive-bg-color $inactive-text-color
		urgent_workspace   $urgent-bg-color   $urgent-bg-color   $text-color
	}
}


# sticky window
bindsym $mod+Shift+s sticky toggle

# floating
for_window [class="qTox"] floating enable
for_window [class="Pavucontrol"] floating enable
for_window [class="Skype"] floating enable

# default workspaces
assign [class="Spotify"] $workspace10
assign [class="Skype"] $workspace9
assign [class="qTox"] $workspace9

# workspace default monitors
workspace $workspace1 output DVI-I-2
workspace $workspace2 output DVI-I-2
workspace $workspace3 output DVI-I-2
workspace $workspace4 output DVI-I-2
workspace $workspace5 output DVI-I-2
workspace $workspace6 output DVI-I-2
workspace $workspace9 output DVI-I-2
workspace $workspace10 output DVI-I-2

# key-bindings
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 2 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 2 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 2 toggle # mute sound
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioPause exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
bindsym $mod+Shift+f exec firefox
bindsym $mod+Return exec xfce4-terminal
bindsym $mod+Shift+q kill
bindsym Print exec screenshot
bindsym $mod+d exec rofi -show run -lines 3 -eh 2 -width 100 -padding 800 -opacity "85" -bw 0 -bc "$bg-color" -bg "$bg-color" -fg "$text-color" -hlbg "$bg-color" -hlfg "#9575cd" -font "System San Francisco Display 18"

# startup
exec_always --no-startup-id feh --bg-scale /home/booker/.wallpaper.jpg
exec_always --no-startup-id xrandr --output HDMI-0 --off --output DVI-I-1 --off --output DVI-I-0 --off --output DVI-I-3 --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-I-2 --mode 1920x1080 --pos 1920x0 --rotate normal
exec --no-startup-id spotify
exec --no-startup-id skype

# Keys
exec_always xmodmap -e "clear lock" #disable caps lock switch
exec_always xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape

exec --no-startup-id compton -f
