# PC setup
This repository contains the scripts used to configure my PCs after an ArchLinux fresh install (even in the "post-installation" step).

The only prerequisite is to install wget:
```
pacman -S --noconfirm wget
```

**OPTIONAL**: change the working directory to something like `/tmp/setup` to not clutter `/root`.

To start the setup process, run `main.sh` or run the following snippet:
```
wget -O main.sh https://raw.githubusercontent.com/asperan/PC-minimal-setup/arch/main.sh
chmod u+x ./main.sh
./main.sh
```

## Disclaimer
I do not own any right for the wallpaper. The original submission is [this](https://artfile.me/wallpaper/vektornaya-grafika-priroda--nature-luna--1472481.html).

## License
The code is distributed according to the terms of the [MIT license](https://mit-license.org/).

