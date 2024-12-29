{ pkgs, inputs, config, ... }: 

{
  home.packages = with pkgs; [
    grimblast
    slurp
    brightnessctl
    rofi-wayland
    hyprpaper

  ];

  wayland.windowManager.hyprland = {
    enable = true;
    #package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
    systemd.enable = false;
    xwayland.enable = true;
    plugins = with inputs; with pkgs; [
      #hycov.packages.${system}.hycov
      #hyprfocus.packages.${pkgs.system}.hyprfocus
    ];

    extraConfig = ''
       # НАСТРОЙКА МОНИТОРОВ
	monitor = eDP-1, 1366x768, 0x0, 1
	monitor = HDMI-A-1, 2560x1440@144, 0x0, 1

	# АВТОЗАПУСК
	exec-once = hyprpaper
#exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-2
#exec-once = ~/.config/hypr/scripts/xdg-hyprland.sh &
#exec-once = ~/.config/hypr/scripts/gentoo-pipewire-launcher &
exec = nm-applet
exec-once = waybar


#ClipBoard manager
exec = wl-paste --watch cliphist store
exec = wl-clipboard-history -t
exec = wl-paste --type text --watch cliphist store #Stores only text data
exec = wl-paste --type image --watch cliphist store #Stores only image data


#Hyprland env
env = XDG_CURRENT_DESKTOP, Hyprland
env = XDG_SESSION_TYPE=wayland
env = XDG_SESSION_DESKTOP=Hyprland
env = QT_QPA_PLATFORM,wayland;xcb
env = SDL_VIDEODRIVER,wayland

plugin {
    hycov {
    
    }

}

misc {
    disable_hyprland_logo=false
    vfr=true
    vrr=true
    animate_manual_resizes=true
    disable_splash_rendering=false
    mouse_move_enables_dpms=true
    animate_manual_resizes=false
    focus_on_activate=true
}

# НАСТРОЙКА КЛАВИАТУРЫ
input {
    kb_layout = us,ru
    kb_options = grp:caps_toggle

    follow_mouse = 1

    touchpad {
        natural_scroll = false
	disable_while_typing = true
	tap-to-click = true
	drag_lock = true
	tap-and-drag = true
    }
}

# ГАПСЫ, БОРДЕРЫ, ЦВЕТА...

general {
    gaps_in = 2
    gaps_out = 5
    border_size = 2
    col.inactive_border=rgb(D1AFFD)
    col.active_border=rgb(FFA3F0)
    layout = dwindle
}


# БЛЮРЫ, ТЕНИ, СКРУГЛЕНИ
decoration {
    rounding = 15
    blur {
	enabled = yes
	size = 6
	passes = 3
	ignore_opacity=false
	new_optimizations=true
	xray=true
	noise = 0.2
    }
    
    #shadow {
    #  enabled = true
    #  range = 10
    #  render_power = 3
    #  color = rgb(34313E)
    #  color_inactive = rgb(DEB3EB)
    
    #}

   

    #shadow_scale=0.4

    # Затемнение неактивных окон
    dim_inactive = false
    dim_strength = 0.3

}

# АНИМАЦИЯ
animations {
    enabled = yes
    bezier = md3_standard, 0.2, 0.0, 0, 1.0
    bezier = md3_decel, 0.05, 0.7, 0.1, 1
    bezier = md3_accel, 0.3, 0, 0.8, 0.15
    bezier = overshot, 0.05, 0.9, 0.1, 1.05
    bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
    bezier = win10, 0, 0, 0, 1
    bezier = gnome, 0, 0.85, 0.3, 1
    bezier = funky, 0.46, 0.35, -0.2, 1.2

    bezier = myBezier, 0.55, 0, 1,0.45

    animation = windows,1,2,gnome
    animation = border, 1, 9, default
    animation = fade, 1, 5, default
    animation = workspaces, 1, 5, default,slidevert
    animation = borderangle, 1, 7, default
}


# НАСТРОЙКА ПОВЕДЕНИЯ ОКОН
#dwindle {
#   pseudotile=true
#   force_split=2
#   
#}

  cursor:inactive_timeout = 30

# ЖЕСТ
gestures {
  workspace_swipe = false
  workspace_swipe_distance = 100

}


# СЦЕНАРИИ ПРИ СТАРТЕ HYPERLAND
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device { 
    name = synps/2-synaptics-touchpad
    #accel_profile = adaptive
    sensitivity = 0.4

}

device {
    name = tpps/2-elan-trackpoint
    sensitivity = -0.4
}


# ПРАВИЛА ОКОН (hyprctl clients - так можно узнать класс окна)
windowrulev2=opacity 0.8,class:^(Terminal)$
#windowrulev2=opacity 0.9,class:^(Waybar)$
#windowrulev2=tile,class:^(kitty)$
#windowrule=noblur,class:^(librewolf)$
#windowrule=noblur,title:^(Картинка в картинке)$
#windowrulev2=move 853,480,floating:1,^(librewolf)$,title:^(Картинка в картинке)$
#windowrulev2=workspace 2,title:^(Яндекс Музыка — собираем музыку и подкасты для вас — Mozilla Firefox)$
#windowrule=float,title:^(Open File)$
#windowrulev2=center,floating:1,title:^(Open File)$ 
#windowrule = size 422,867,(org.telegram.desktop)$
#windowrule = float,^(org.telegram.desktop)$

$mod = SUPER
bind = $mod, Q, killactive
bind = $mod, M, exit
bind = $mod, T, togglefloating
bind = $mod, RETURN, exec, foot
bind = $mod, F,exec,librewolf
bind = $mod, D,exec,rofi -show drun
bind = $mod, N,exec,nautilus

# Reload config
bind = $mod SHIFT, R, exec, pkill waybar && hyprctl reload

# Screnshot
bind = , Print, exec, grimblast --notify copysave screen $HOME/Media/Screenshots/$(date +%Y%m%d_%Hh%Mm%Ss.png)
bind = SHIFT, Print, exec, grimblast --notify --freeze copysave area $HOME/Media/Screenshots/$(date +%Y%m%d_%Hh%Mm%Ss.png)

# Управление фокусом
bind = $mod, left, movefocus, l
bind = $mod, right, movefocus, r
bind = $mod, up, movefocus, u
bind = $mod, down, movefocus, d 

# Переключение воркспейсов
bind = $mod, 1, workspace, 1
bind = $mod, 2, workspace, 2
bind = $mod, 3, workspace, 3
bind = $mod, 4, workspace, 4
bind = $mod, 5, workspace, 5
bind = $mod, 6, workspace, 6
bind = $mod, 7, workspace, 7
bind = $mod, 8, workspace, 8
bind = $mod, 9, workspace, 9
bind = $mod, 0, workspace, 10

# Перемещение окна на другой воркспейс
bind = $mod SHIFT, 1, movetoworkspace, 1
bind = $mod SHIFT, 2, movetoworkspace, 2
bind = $mod SHIFT, 3, movetoworkspace, 3
bind = $mod SHIFT, 4, movetoworkspace, 4
bind = $mod SHIFT, 5, movetoworkspace, 5
bind = $mod SHIFT, 6, movetoworkspace, 6
bind = $mod SHIFT, 7, movetoworkspace, 7
bind = $mod SHIFT, 8, movetoworkspace, 8
bind = $mod SHIFT, 9, movetoworkspace, 9
#bind = $mainMod SHIFT, 0, movetoworkspace, 10

# перемещение и ресайз окон ЛКМ ПКМ + mineMod

bindm =$mod, mouse:272, movewindow
bindm =$mod, mouse:273, resizewindow

bind=$mod,mouse_down,workspace,e-1
bind=$mod,mouse_up,workspace,e+1


# регулировка звука с клавиатуры 
binde = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+
binde = , XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-
bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bind = , XF86AudioMicMute, exec, fixf4=$(cat /sys/class/leds/platform\:\:micmute/brightness); echo $((1-fixf4)) | doas tee /sys/class/leds/platform\:\:micmute/brightness; wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bind =, XF86MonBrightnessDown, exec, brightnessctl s 10%-
bind =, XF86MonBrightnessUp, exec, brightnessctl s +10%
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioNext, exec, playerctl next
bind = , XF86AudioPrev, exec, playerctl previous

    '';
  };
}
