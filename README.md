# Samsung USB Driver for Mobile Phones - Chocolatey Package

[![Chocolatey Version](https://img.shields.io/chocolatey/v/samsung-usb-driver.svg)](https://community.chocolatey.org/packages/samsung-usb-driver)
[![Chocolatey Downloads](https://img.shields.io/chocolatey/dt/samsung-usb-driver.svg)](https://community.chocolatey.org/packages/samsung-usb-driver)

This is the Chocolatey package for the Samsung Android USB Driver for Windows.

## Description

Samsung Android USB Driver for Windows enables connectivity between Samsung Android devices and Windows PCs for development and file transfer purposes. This driver is essential for:

- Android development with ADB (Android Debug Bridge)
- Flashing custom ROMs
- File transfers between PC and Samsung devices
- Using Samsung-specific development tools

## Installation
``````powershell
choco install samsung-usb-driver
``````

## Package Notes

### Manual Download Required

Due to Samsung's dynamic download URLs and authentication requirements, **you must manually download the installer** before installing this package:

1. Visit https://developer.samsung.com/android-usb-driver
2. Download `SAMSUNG_USB_Driver_for_Mobile_Phones_v1.9.0.0.exe`
3. The Chocolatey package will look for the installer in these locations:
   - `$env:ChocolateyInstall\lib\samsung-usb-driver\tools\`
   - `$env:TEMP\`
   - `$env:USERPROFILE\Downloads\`

Alternatively, you can download the installer from this repository's [Releases page](https://github.com/YOUR_USERNAME/samsung-usb-driver-chocolatey/releases) and place it in one of the above locations.

### Package Parameters

This package has no parameters.

## Uninstallation
``````powershell
choco uninstall samsung-usb-driver
``````

## Links

- [Official Samsung USB Driver Page](https://developer.samsung.com/android-usb-driver)
- [Chocolatey Package](https://community.chocolatey.org/packages/samsung-usb-driver)
- [Package Source](https://github.com/YOUR_USERNAME/samsung-usb-driver-chocolatey)

## Maintainers

- [YOUR_NAME](https://github.com/YOUR_USERNAME)

## Version History

### 1.9.0.0
- Updated to Samsung USB Driver v1.9.0.0
- Fixed package installation with embedded installer
- Improved checksum verification
- Added chocolateybeforemodify.ps1 for clean uninstalls

### Previous versions
See [package history](https://community.chocolatey.org/packages/samsung-usb-driver#versionhistory)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

The Samsung USB Driver software is proprietary and owned by Samsung Electronics Co., Ltd.

This Chocolatey package and scripts are licensed under the MIT License - see the LICENSE file for details.
