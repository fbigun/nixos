  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

## 以上配置即可启用 gnome 桌面
## 以下配置按需选择定制：

  # 貌似是给托盘图标提供服务
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # 精简不想要的服务
  services.packagekit.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    # 精简不想安装的包
    gnome-photos
    gnome-tour
    gnome.yelp
    gnome.geary
    gnome.totem
    gnome.gnome-music
    gnome.gnome-software
  ];

  environment.systemPackages = with pkgs; [
    gthumb
    notejot
    lollypop

    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome.gnome-power-manager
    gnome.gnome-sound-recorder
  ] ++ (with gnomeExtensions; [
    appindicator
    dash-to-dock
    night-theme-switcher
    proxy-switcher
    clipboard-history
    espresso
    ddterm
    blur-my-shell
  ]);

  # 可以和 kde-connect 协议连接的 gnome 软件
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
