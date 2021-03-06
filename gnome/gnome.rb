package 'gnome' do
  type :meta
  depends_on ['desktop-file-utils','shared-mime-info','gtk+','GConf']
  post_install do
    <<-EOS
      #gconftool-2 /etc/gconf/schemas/*.schemas
      update-desktop-database
      update-mime-database -V /usr/share/mime

      for i in /usr/share/icons/*/ ; do
        gtk-update-icon-cache -ft $i
      done
    EOS
  end
end

DEPEND="desktop-file-utils shared-mime-info gtk+ hal ORBit2 intltool GConf gnome-mime-data hicolor-icon-theme gnome-vfs gnome-vfs-monikers libgnome libgnomecanvas gnome-keyring gnome-icon-theme libgnomeui gtk-engines gnome-themes gnome-desktop gnome-backgrounds gnome-menus gnome-panel vte gnome-terminal libgnomekbd nautilus gnome-control-center gnome-applets gnome-session gdm gnome-utils gnome-media eog file-roller evince totem gnome-system-monitor gnome-volume-manager gedit gedit-plugins-extra brasero epiphany gnome-kita-themes"

