<div  align="center">
<p><img src="img/run.heyfordy.de.png" alt="Logo" style="max-width: 25%;"></p>

---
<h3>My collection of scripts and tools for automating boring stuff.</h3>
<!-- Windows/Office activation, system maintenance and other tasks — all open-source. -->

---
</div>

<details>
  <summary>
      <h3 style="color: orange; border-bottom: 0; display: inline-block;">
      <b><u>📋 Jump to topic:</u></b>
      </h3></summary>

[1 » Windows & Office Activation](#1--windows--office-activation)

[2. » Proxmox-VE:](#2--proxmox)
<details open>

- [» **1** — Post Install Script](#21--proxmox-ve-post-installation)
- [» **2** — Docker Installation](#22--proxmox-ve-docker)
- [» **3** — Home Assistant CT Installation](#23--proxmox-ve-home-assistant)
</details>
<!-- [2 » Jellyfin Server Auto-Updater](#2--jellyfin-auto-updater) -->

[3 » SpotX - Spotify Adfree](#3--spotx---spotify-adfree)

[4 » Apple USB Drivers](#4--apple-usb-drivers)

[5 » VS Code Installer](#5--vs-code-installer)
</details>

<hr>

## 1 » Windows & Office Activation
### How to Activate Windows / Office?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
irm https://run.heyfordy.de | iex
```
Alternatively, you can use the following (this will be deprecated in the future):  
```
irm https://win.heyfordy.de/activate | iex
```

3.   You will see the activation options. Choose the activation options highlighted in green. 

4.   That's all

---
# 2 » Proxmox
## 2.1 » Proxmox-VE Post Installation
> This script is intended for managing or enhancing the PVE host system directly.
### How to install ?

1.   **Open Host Shell**  
	To do that, open your PVE Webinterface, select your node and open the shell.

2.   **Copy and paste the code below, then press enter.**  
```
bash -c "$(curl -fsSL https://run.heyfordy.de/pve)"
```
3.   That's it!

---

## 2.2 » Proxmox-VE Docker
> This script installs docker to proxmox.
### How to install ?

1.   **Open Host Shell**  
	To do that, open your PVE Webinterface, select your node and open the shell.

2.   **Copy and paste the code below, then press enter.**  
```
bash -c "$(curl -fsSL https://run.heyfordy.de/pved)"
```
3.   That's it!

---

## 2.3 » Proxmox-VE Home Assistant
> This script installs Home Assistant & Portainer to proxmox.
### How to install ?

1.   **Open Host Shell**  
	To do that, open your PVE Webinterface, select your node and open the shell.

2.   **Copy and paste the code below, then press enter.**  
```
bash -c "$(curl -fsSL https://run.heyfordy.de/pveha)"
```
3.   That's it!

>	›› Config File will be available at:
```
/var/lib/docker/volumes/hass_config/_data
```
---
<!--
## 2 » Jellyfin Auto-Updater
> Automatically checks for the latest releases and installs updates daily via Windows Task Scheduler.
### How to install ?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
irm https://run.heyfordy.de/jellyfin-update | iex
```
3.   That's it!

---
-->
## 3 » SpotX - Spotify Adfree
### How to install SpotX?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
iex "& { $(iwr -useb 'https://run.heyfordy.de/spotx') } -new_theme -block_update_on"
```
3.   That's all

---

## 4 » Apple USB Drivers
### How to install the Apple USB drivers?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
irm https://run.heyfordy.de/apple | iex
```
3.   That's all

---

---

## 5 » VS Code Installer
### How to install Visual Studio Code?

1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press enter.**  
```
irm https://run.heyfordy.de/vs-code | iex
```
3.   That's all

---