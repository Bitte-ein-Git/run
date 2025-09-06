<p align="center"><img src="img/win.heyfordy.de.png" alt="MAS Logo"></p>

---
<h3 align="center">My collection of scripts and tools for automating boring stuff.</h3>
<!-- Windows/Office activation, system maintenance and other tasks — all open-source. -->

---

**<p>Jump to topic:</p>**

[1 » Windows & Office Activation](#1--windows--office-activation)

[2 » Proxmox-VE Post Installation](#2--proxmox-ve-post-installation)
<!-- [2 » Jellyfin Server Auto-Updater](#2--jellyfin-auto-updater) -->

[3 » Apple USB Drivers](#3--apple-usb-drivers)

<hr>

## 1 » Windows & Office Activation
### How to Activate Windows / Office?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
irm https://win.heyfordy.de | iex
```
Alternatively, you can use the following (this will be deprecated in the future):  
```
irm https://get.activated.win | iex
```

3.   You will see the activation options. Choose the activation options highlighted in green. 

4.   That's all

---

## 2 » Proxmox-VE Post Installation
> This script is intended for managing or enhancing the PVE host system directly.
### How to install ?

1.   **Open Host Shell**  
	To do that, open your PVE Webinterface, select your node and open the shell.

2.   **Copy and paste the code below, then press enter.**  
```
bash -c "$(curl -fsSL https://win.heyfordy.de/pve)"
```
3.   That's it!

---
<!--
## 2 » Jellyfin Auto-Updater
> Automatically checks for the latest releases and installs updates daily via Windows Task Scheduler.
### How to install ?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
irm https://win.heyfordy.de/jellyfin-update | iex
```
3.   That's it!

---
-->
## 3 » Apple USB Drivers
### How to install the Apple USB drivers?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
irm https://win.heyfordy.de/apple | iex
```
3.   That's all

---
