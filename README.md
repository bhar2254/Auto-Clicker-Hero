# AutoClicker AHKv2 Script

An AutoHotkey v2 script for automated clicking with flexible modes, including screen-relative and window-relative click positions. It also features a debug overlay and customizable active window targeting.

---

## Features

- **Screen Static Click Mode**: Click at a fixed screen position.
- **Window-relative Click Mode**: Click relative to a chosen window.
- **Active Window Selection**: Set a specific window to target clicks.
- **Debug Overlay**: Real-time display of click mode, cursor position, and saved coordinates.
- **Secondary Timed Click**: Optional extra click at a predefined position.
- **Hotkey Control**: Start, stop, and configure script behavior using simple hotkeys.

---

## Requirements

- [AutoHotkey v2](https://www.autohotkey.com/)  

---

## Hotkeys

| Hotkey        | Function |
|---------------|---------|
| **Shift + F1** | Start screen/window static click mode |
| **Shift + F2** | Stop all clicking |
| **Shift + F7** | Set the active window for window-relative clicking |
| **Shift + F8** | Save window-relative mouse position |
| **Shift + F9** | Toggle debug overlay |

---

## Usage

1. Run the script using AutoHotkey v2.
2. Use `Shift + F7` to select the window you want to interact with (optional if using screen-relative mode).
3. Move your mouse to the desired click position and press `Shift + F8` to save it.
4. Press `Shift + F1` to start the clicking automation.
5. Press `Shift + F2` to stop all clicking.
6. Press `Shift + F9` to enable/disable the debug overlay for monitoring click positions.

---

## Script Behavior

- **Screen Mode**: Clicks at the saved static screen coordinates.
- **Window Mode**: Clicks relative to the selected window. If no position is saved, defaults to `860, 375`.
- **Secondary Click**: When enabled, performs an extra click at `915, 75` with a small delay to prevent overlap.
- **Debug Overlay**: Shows status, mode, screen and window coordinates, and saved position.

---

## Customization

You can modify default click positions, timing, and hotkeys directly in the script:

```ahk
defaultWinX := 860
defaultWinY := 375
````

Adjust these values as needed.

---

## License

This script is licensed under the **GNU General Public License v3.0 or later (GPL-3.0+)**.

You are free to:

* Use, copy, and modify the script.
* Distribute modified versions under the same license.

**Disclaimer:** Use this script responsibly. The author is not liable for any misuse or damage caused by the script.

```text
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
```

---

## Contributing

Feel free to fork this repository and improve the script. Suggestions and pull requests are welcome!
