---
layout: post
lang: en
post_id: 2022-rasbperry-pi-realtek-wifi-n-rtl8188fu
title: "Raspberry Pi: Install USB Wifi Realtek 0bda:f179 using rtl8188fu module"
keywords: "raspberry, modules, realtek, obda:f179, modules, linux, kernel, rtl8188fu"
description: "How to install a USB wifi Realtek 0bda:f179 in a Raspberry Pi 4 model B using the linux kernel module RTL8188FU"
categories:
  - rasbperrypi
image: '/assets/posts/2015-open-gpx-tracker/open-gpx-tracker.png'
---

![Realtek usb wifi 8bda:f179 rtl8188fu](/assets/posts/2022-rpi-usb-wifi/realtek-usb-wifi-0bda-f179-rtl8188fu.jpg)

I bouthg a US$5.00 wifi usb dongle for a [Raspberry Pi 4 Model B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/specifications/), but when I plugged it, it did not work (below the output of `dmesg` after plugging in the device). 

```
[  294.567130] usb 1-1.2: new full-speed USB device number 4 using xhci_hcd
[  295.479375] usb 1-1.2: device descriptor read/64, error -32
[  295.667394] usb 1-1.2: device descriptor read/64, error -32
[  296.627688] usb 1-1-port2: Cannot enable. Maybe the USB cable is bad?
[  296.628403] usb 1-1-port2: attempt power cycle
[  297.231167] usb 1-1.2: new full-speed USB device number 6 using xhci_hcd
[  297.231404] usb 1-1.2: Device not responding to setup address.
[  297.439403] usb 1-1.2: Device not responding to setup address.
[  297.647217] usb 1-1.2: device not accepting address 6, error -71
[  298.499779] usb 1-1-port2: Cannot enable. Maybe the USB cable is bad?
[  298.500481] usb 1-1-port2: unable to enumerate USB device
```

I did not get much info from thos messages, so I plugged it in a Mac (Apple icon / About this mac / System Report / USB)	
```
Product information 
802.11n:
  Product ID:	0xf179
  Vendor ID:	0x0bda  (Realtek Semiconductor Corp.)
  Manufacturer:	Realtek
```

With that information I found that the [RTL8188 was the module I needed](https://askubuntu.com/questions/1062402/cant-find-wifi-drivers-for-0bdaf179-realtek-semiconductor-corp) and the [steps to install it](https://github.com/kelebek333/rtl8188fu/tree/arm#how-to-install-for-arm-devices), though they were not directly working on a Raspberry Pi. I needed to solve a couple of issues. Below the steps.



## Prepare the system

In my case, first, I updated the Raspberry Pi :

```bash
# all the steps are done as root
sudo su  
cd
apt update
apt full-upgrade
```

The Linux kernel I was using:
```bash
uname -a
Linux pi 5.15.32-v8+ #1538 SMP PREEMPT Thu Mar 31 19:40:39 BST 2022 aarch64 GNU/Linux
```

Then, make sure you have the tools to download and build the module.

```bash
apt install build-essential git dkms
```
It is also necessary to install the kernel headers:

```
apt install raspberrypi-kernel-headers
```

## Build the RTL8188FU module

The device 0bda:f179 uses the RTL8188FU module. The version that I used is the one in the ARM branch of [kelebek333/rtl8188fu github repository](https://github.com/kelebek333/rtl8188fu/tree/arm#how-to-install-for-arm-devices).

So first, we download the module source code:

```bash
cd /tmp/

git clone -b arm https://github.com/kelebek333/rtl8188fu rtl8188fu-arm
```
Then, edit `./rtl8188fu-arm/Makefile` and modify the lines:

```Makefile
CONFIG_POWER_SAVING = n  # Remove power saving
CONFIG_WIFI_MONITOR = y # Enable device to use monitor mode 
```

Now we create a symbolic link 
```bash
ln -s /lib/modules/$(uname -r)/build/arch/arm /lib/modules/$(uname -r)/build/arch/armv7l
```

By default the driver comes with all debug messages activated. It is pretty annoying but useful if something goes wrong. To disable them edit `rtl8188fu-arm/include/autoconf.h` by prepending `//` in the CONFIG_DEBUG leaving the debug section as below 

```c
/*
 * Debug Related Configure
 */
//#define CONFIG_DEBUG /* DBG_871X, etc... */ 
#ifdef CONFIG_DEBUG
        #define DBG     1       /* for ODM & BTCOEX debug */
        #define DBG_PHYDM_MORE 0
#else /* !CONFIG_DEBUG */
        #define DBG     0       /* for ODM & BTCOEX debug */
        #define DBG_PHYDM_MORE 0
#endif /* CONFIG_DEBUG */

#if DBG_PHYDM_MORE
        //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_, _func_exit_ */
#endif /* DBG_MORE */

//#define CONFIG_PROC_DEBUG
```

Add the module to the tree for build
```bash
dkms add ./rtl8188fu-arm
```

Change default architecture to ARM64
```bash
export ARCH=arm64 # by default it takes aarch64
```

Build the module
```
dkms build rtl8188fu/1.0
```

Expected output something similar to:
```
Kernel preparation unnecessary for this kernel.  Skipping...

Building module:
cleaning build area...
'make' all KVER=5.15.32-v8+...........................................................
cleaning build area...

DKMS: build completed.
```

Install the module
```bash
dkms install rtl8188fu/1.0
```

Expected output, something similar to:
```
rtl8188fu.ko:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/5.15.32-v8+/updates/dkms/

depmod....
```

As you can see, the module was copied/installed in `/lib/modules/${name -r}/updates/dkms/`

Copy the firmware
```bash
cp ./rtl8188fu-arm/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
```

Launch the modules
```bash
modprobe cfg80211
modprobe rtl8188fu
```

Check the output of `dmesg`
```
[  973.585841] =======================================================
[  973.585848] ==== Launching Wi-Fi driver! (Powered by Rockchip) ====
[  973.585855] =======================================================
[  973.585862] Realtek 8188FU USB WiFi driver (Powered by Rockchip) init.
[  973.585869] RTL871X: module init start
[  973.585876] RTL871X: rtl8188fu v4.3.23.6_20964.20170110
[  973.586076] usbcore: registered new interface driver rtl8188fu
[  973.586088] RTL871X: module init ret=0
```

Now you can plug the USB WIFI device **in a blue USB 3.0 socket** (it did not work for me in a USB 2.0). If the module has been properly loaded:

```bash
lsusb
```

You can expect to see a like similar to:
```
Bus 001 Device 008: ID 0bda:f179 Realtek Semiconductor Corp. RTL8188FTV 802.11b/g/n 1T1R 2.4G WLAN Adapter
```

## Load module on boot

Lastly, to load the module on boot edit `/etc/modules` and add the lines at the bottom

```
cfg80211
rtl8188fu
```

And reboot to check
```bash
reboot
```


## Troubleshooting

As I needed to build the module several times to make it work these are some commands / tips that may be useful:


### dmesg 

Filter the messages for USB stuff.

```bash
dmesg | grep -i USB

[  638.530452] usb 1-1.3: new high-speed USB device number 17 using xhci_hcd
[  638.614839] usb 1-1.3: Device not responding to setup address.
[  638.822668] usb 1-1.3: Device not responding to setup address.
[  639.030376] usb 1-1.3: device not accepting address 17, error -71
[  642.874262] usb 1-1.3: new full-speed USB device number 19 using xhci_hcd
[  643.162469] usb 1-1.3: device descriptor read/64, error -32
```

### Uninstall the module

If you need to rebuild and install the module again

```
sudo dkms remove rtl8188fu/1.0 --all
sudo rm -f /lib/firmware/rtlwifi/rtl8188fufw.bin
sudo rm -f /etc/modprobe.d/rtl8188fu.conf
```

### List the modules that are in your kernel

You can list all loadable modules and check if the module is there.

```bash 
find /lib/modules/$(uname -r) -type f -name '*.ko' 
```



References: 
* [https://github.com/kelebek333/rtl8188fu/tree/arm#how-to-install-for-arm-devices](https://github.com/kelebek333/rtl8188fu/tree/arm#how-to-install-for-arm-devices
)

