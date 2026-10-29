# Atajos de mango frente a macOS

Punto de partida del análisis final de atajos. **No se usa para elegir gestor (3.5)**: se deja aparte para no sesgar esa decisión, y se trabaja al final, con el gestor y el modificador (3.1) ya decididos.

Fuente: `config/main/keybinds.csv` de `~/Repos/dotfiles`, citado por ruta y no copiado. Leído el 2026-10-28: 158 filas, todas clasificadas abajo (91 del gestor, 2 de gestos, 7 de lanzar programas, 30 nativas de macOS, 8 por decidir, 5 solo de Linux y 15 sin tecla). La columna «Tecla en mango» es la `decision` del CSV. Al trasladar a dotfiles, esta tabla es la que se cruza con el CSV.

`SUPER` es la tecla Windows del equipo Linux. Qué modificador la sustituye en el Mac lo decide la 3.1: Cmd choca con los atajos de las aplicaciones y Option con los caracteres del teclado español.

## Del gestor de ventanas

«Atajo en macOS» se llena al escribir la configuración del gestor ganador.

| Filas de mango | Tecla en mango | Qué pide al gestor | Atajo en macOS |
| --- | --- | --- | --- |
| `focus_left`, `focus_right`, `focus_up`, `focus_down` | SUPER+flechas / SUPER+HJKL | Foco por dirección | |
| `focus_stack`, `focus_stack_prev` | SUPER+Tab / SUPER+SHIFT+Tab | Recorrer las ventanas del escritorio | |
| `focus_first`, `focus_last` | SUPER+Home / SUPER+End | Columnas (scroller) | |
| `move_left`, `move_right`, `move_up`, `move_down` | SUPER+SHIFT+flechas / SUPER+SHIFT+HJKL | Intercambiar en el mosaico; una flotante se pega al borde | |
| `move_first`, `move_last` | SUPER+CTRL+Home / SUPER+CTRL+End | Columnas (scroller) | |
| `focus_monitor_left`, `focus_monitor_right`, `focus_monitor_up`, `focus_monitor_down` | SUPER+CTRL+ALT+flechas / HJKL | Foco entre monitores | |
| `move_to_monitor_left`, `move_to_monitor_right`, `move_to_monitor_up`, `move_to_monitor_down` | SUPER+ALT+SHIFT+flechas / HJKL | Mover la ventana entre monitores | |
| `workspace_n`, `workspace_10`, `workspace_11`, `workspace_12` | SUPER+1..9, SUPER+0, SUPER+apostrophe, SUPER+exclamdown | Doce escritorios | |
| `move_to_workspace_n`, `move_to_workspace_10`, `move_to_workspace_11`, `move_to_workspace_12` | SUPER+SHIFT+las mismas | Mover la ventana y seguirla | |
| `tag_silent` | SUPER+CTRL+1..9 | Mover la ventana sin seguirla | |
| `workspace_down`, `workspace_up` | SUPER+Page_Down / SUPER+Page_Up | Escritorio siguiente y anterior | |
| `workspace_prev_client`, `workspace_next_client` | SUPER+ALT+grave / SUPER+ALT+plus | Saltar solo entre escritorios con ventanas | |
| `desktop_cycle_next`, `desktop_cycle_prev` | ALT+Tab / ALT+SHIFT+Tab | Anillo: los ocupados y uno libre (en mango es un script) | |
| `move_to_prev_client_workspace`, `move_to_next_client_workspace` | SUPER+SHIFT+grave / SUPER+SHIFT+plus | Mandar la ventana al escritorio ocupado contiguo | |
| `move_to_workspace_down`, `move_to_workspace_up` | SUPER+CTRL+Page_Down / SUPER+CTRL+Page_Up | Mover la columna al escritorio contiguo | |
| `move_workspace_down`, `move_workspace_up` | SUPER+SHIFT+Page_Down / SUPER+SHIFT+Page_Up | Reordenar escritorios | |
| `workspace_down_wheel`, `workspace_up_wheel`, `move_to_workspace_down_wheel`, `move_to_workspace_up_wheel`, `focus_column_right_wheel`, `focus_column_left_wheel`, `move_column_right_wheel`, `move_column_left_wheel` | SUPER(+CTRL)+rueda | Atajos con la rueda del ratón | |
| `layout_fair`, `layout_dwindle`, `layout_center`, `layout_monocle` | SUPER+S, SUPER+D, SUPER+C, SUPER+M | Layouts por escritorio: fair, dwindle, center_tile, monocle | |
| `switch_layout`, `layout_picker` | SUPER+SHIFT+ntilde, SUPER+ntilde | Ciclo y selector de layouts | |
| `zoom_master`, `master_more`, `master_less` | SUPER+SHIFT+Return, SUPER+CTRL+SHIFT+Up / K, SUPER+CTRL+SHIFT+Down / J | Área principal (maestro-pila) | |
| `dwindle_toggle_split`, `dwindle_current_split` | SUPER+CTRL+Return, SUPER+CTRL+D | Dirección de la división en dwindle | |
| `consume_left`, `consume_right`, `expel` | SUPER+CTRL+SHIFT+grave, SUPER+CTRL+SHIFT+plus, SUPER+period | Meter y sacar ventanas de una columna (scroller) | |
| `cycle_width`, `cycle_height`, `reset_height` | SUPER+R, SUPER+CTRL+SHIFT+R, SUPER+CTRL+R | Anchos y altos en ciclo, proporción completa | |
| `resize_width_down`, `resize_width_up`, `resize_height_down`, `resize_height_up` | SUPER+grave / plus, SUPER+CTRL+grave / plus | Tamaño en pasos del 10 % | |
| `resize_left`, `resize_right`, `resize_up`, `resize_down` | SUPER+CTRL+flechas / HJKL | Tamaño fino | |
| `center`, `maximize`, `maximize_click` | SUPER+CTRL+C, SUPER+A, SUPER+clic central | Centrar y maximizar | |
| `fullscreen`, `fake_fullscreen` | SUPER+F, SUPER+CTRL+F | Pantalla completa real y falsa | |
| `floating`, `floating_focus` | SUPER+V, SUPER+CTRL+V | Flotantes y foco entre capas | |
| `global`, `overlay` | SUPER+G, SUPER+SHIFT+O | Visible en todos los escritorios; siempre encima | |
| `scratchpad`, `dropdown_terminal`, `btop` | SUPER+Z, SUPER+masculine, SUPER+SHIFT+Escape | Scratchpads, también con nombre | |
| `gaps`, `reload_config`, `inhibit_shortcuts` | SUPER+CTRL+G, SUPER+SHIFT+U, SUPER+Escape | Separaciones, recarga y pausa de atajos (un modo) | |

## Fuera del gestor

| Grupo | Filas de mango | Quién lo cubre en macOS |
| --- | --- | --- |
| Gestos (2) | `gesture_desktop_cycle`, `gesture_focus_stack` | Tarea 6.1 |
| Lanzar programas (7) | `terminal`, `file_manager`, `browser`, `editor`, `yazi`, `notepad`, `text_editor` | El gestor (ejecutar un comando) o Leader Key (9.5); se decide con la 3.1 |
| Nativas de macOS (30) | `launcher`, `clipboard_history`, `close_window`, `minimize`, `overview`, `copy`, `cut`, `paste`, `terminal_copy_paste`, `process_list`, `lock`, `power_menu`, `screenshot`, `screenshot_screen`, `screen_record`, `notifications`, `control_center`, `network`, `settings`, `wallpaper`, `volume_up`, `volume_down`, `volume_mute`, `mic_mute`, `brightness_up`, `brightness_down`, `media_play`, `media_stop`, `media_prev`, `media_next` | Spotlight (9.3), Cmd+W y Cmd+M, Mission Control, Cmd+C/X/V, kitty, Cmd+Opt+Esc, Ctrl+Cmd+Q, Cmd+Shift+3/4/5, Centro de control y teclas de función |
| Por decidir (8) | `hotkey_overlay`, `ocr_region`, `restore_minimized`, `clipboard_wipe`, `inhibit_suspend`, `reload_shell`, `wallpaper_random`, `theme_picker` | Sin atajo nativo directo; se decide en la semana de uso (8.2) |
| Solo Linux (5) | `window_state`, `console`, `wake_monitor`, `radios_toggle`, `hibernate` | No se trasladan |
| Sin tecla en mango (15) | `quit`, `window_cycle`, `window_cycle_prev`, `tabbed`, `expand_width`, `move_floating`, `screenshot_copy`, `screenshot_edit`, `monitors_off`, `toggle_jump`, `workspace_prev`, `workspace_next`, `consume_up`, `consume_down`, `consume_into_column` | Nada que trasladar |
