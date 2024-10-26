{ pkgs, inputs, ... }: 

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
    systemd.enable = false;
    xwayland.enable = true;
    plugins = with inputs; with pkgs; [
      #hycov.packages.${system}.hycov
      #hyprfocus.packages.${pkgs.system}.hyprfocus
    ];

  /*
    extraConfig = ''
       # НАСТРОЙКА МОНИТОРОВ
	monitor=1366x768, 1366x768, 0x0, 1

	# АВТОЗАПУСК
	exec-once = swaybg -i ~/.config/hypr/wallpapers/anime_wall_5.jpg
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec-once = ~/.config/hypr/scripts/xdg-hyprland.sh &
exec-once = ~/.config/hypr/scripts/gentoo-pipewire-launcher &
exec-once = nm-applet
exec-once = waybar
#exec-once = flatpak run io.gitlab.librewolf-community 
#exec-once = librewolf


#ClipBoard manager
exec-once = wl-paste --watch cliphist store
exec-once = wl-clipboard-history -t
exec-once = wl-paste --type text --watch cliphist store #Stores only text data
exec-once = wl-paste --type image --watch cliphist store #Stores only image data


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
        natural_scroll = no
    }

}


# ГАПСЫ, БОРДЕРЫ, ЦВЕТА...

general {
    gaps_in = 2
    gaps_out = 5
    border_size = 2
    col.inactive_border=rgb(D1AFFD)
    col.active_border=rgb(FFA3F0)
    no_border_on_floating=false
    cursor_inactive_timeout=0
    layout = dwindle
    sensitivity=0.6
}


# БЛЮРЫ, ТЕНИ, СКРУГЛЕНИЯ
decoration {
    rounding = 15

    blur {
	enabled = yes
	size = 6
	passes = 3
	ignore_opacity=false
	new_optimizations=true
	xray=true
    }

    drop_shadow=true
    shadow_range=10
    shadow_render_power=3
    col.shadow = rgb(34313E)
    col.shadow_inactive = rgb(DEB3EB)

    shadow_scale=0.4

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
dwindle {
   pseudotile=true
   force_split=2
   
}


# ЖЕСТ
gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}


# СЦЕНАРИИ ПРИ СТАРТЕ HYPERLAND
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic mouse V1 {
    sensitivity = -0.5
}
e

# ПРАВИЛА ОКОН (hyprctl clients - так можно узнать класс окна)
windowrulev2=opacity 0.9,class:^(kitty)$
windowrulev2=opacity 0.9,class:^(Waybar)$
windowrulev2=tile,class:^(kitty)$
windowrule=noblur,class:^(librewolf)$
windowrule=noblur,title:^(Картинка в картинке)$
windowrulev2=move 853,480,floating:1,^(librewolf)$,title:^(Картинка в картинке)$
windowrulev2=workspace 2,title:^(Яндекс Музыка — собираем музыку и подкасты для вас — Mozilla Firefox)$
windowrule=float,title:^(Open File)$
windowrulev2=center,floating:1,title:^(Open File)$ 
windowrule = size 422,867,(org.telegram.desktop)$
windowrule = float,^(org.telegram.desktop)$

$mainMod = SUPER
bind = $mainMod, Q, killactive
bind = $mainMod, M, exit
bind = $mainMod, T,togglefloating
bind = $mainMod, A, exec,foot
bind = $mainMod, F,exec,librewolf
bind = $mainMod, D,exec,rofi -show drun
bind = $mainMod, N,exec,nautilus
bind = $mainMod, S,exec,grim -t png -g "$(slurp)" Screenshots/$(date +'%s_screnshot.png'),

# Управление фокусом
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d 

# Переключение воркспейсов
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Перемещение окна на другой воркспейс
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# перемещение и ресайз окон ЛКМ ПКМ + mineMod

bindm =$mainMod, mouse:272, movewindow
bindm =$mainMod, mouse:273, resizewindow

bind=SUPER,mouse_down,workspace,e-1
bind=SUPER,mouse_up,workspace,e+1


# регулировка звука с клавиатуры 
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec volumectl toggle-mute
bindsym XF86AudioMicMute exec volumectl -m toggle-mute
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioNext, exec, playerctl next
	bind = , XF86AudioPrev, exec, playerctl previous

    '';
*/
  };
}
