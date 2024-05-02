#!/bin/bash

# Удаляем строки, содержащие указанный subvolid, из файла /etc/fstab
sudo sed -i 's/subvolid=.*,//' /etc/fstab

echo "Указанный subvolid успешно удалён из файла /etc/fstab."

# Проверяем, установлен ли yay
if command -v yay &> /dev/null; then
    echo "Yay обнаружен. Используем его для установки yabsnap из AUR."
    yay -S --noconfirm yabsnap
else
    echo "Yay не обнаружен. Устанавливаем yabsnap без его использования."
    git clone https://aur.archlinux.org/yabsnap.git
    cd yabsnap
    makepkg -si --noconfirm
    cd ..
    rm -rf yabsnap
fi

echo "Yabsnap успешно установлен."
