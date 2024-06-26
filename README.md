# MultiScrcpyRunner: Automate `scrcpy` for Multiple Devices

## Introduction
`MultiScrcpyRunner` is a batch script designed to simplify the management of multiple Android devices connected to a computer. It automatically detects connected devices, launches `scrcpy` instances for each one, and offers customizable options such as turning the device's screen off, keeping the `scrcpy` window always on top, and disabling the screensaver on the computer for uninterrupted monitoring.

## Prerequisites
- Windows operating system
- ADB (Android Debug Bridge) installed and configured
- `scrcpy` installed and accessible from the command line
- USB debugging enabled on all Android devices to be connected
- `brew install android-platform-tools scrcpy`

## Installation
1. Clone this repository to your local machine using `git clone https://github.com/Menwitz/RunMultiAndroidMirror.git`
2. Navigate to the cloned directory.
3. Ensure that `adb` and `scrcpy` are in your system's PATH.

## Usage
Windows
1. Open Command Prompt.
2. Navigate to the directory containing RunScrcpyForAllDevices.bat.
3. Execute the script:
   `RunScrcpyForAllDevices.bat`

macOS
1. Open Terminal.
2. Navigate to the directory containing RunScrcpyForAllDevices.sh.
3. Make the script executable:
   `chmod +x RunScrcpyForAllDevices.sh`
4. Execute the script
   `./RunScrcpyForAllDevices.sh`


### Customization
You can customize the script parameters to suit your needs. Open `RunScrcpyForAllDevices.bat` in a text editor and modify the `scrcpy` command line options as desired.

## Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

Please follow these steps to contribute:
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License
Distributed under the MIT License. See `LICENSE` for more information.

## Acknowledgments
- Thanks to the `scrcpy` team for providing such a versatile tool.
- This project was inspired by the need for managing multiple devices efficiently in a development environment.
