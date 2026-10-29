# Tareas

Cada tarea se cierra con lo medido en el Mac (versión, comando y salida), no con «funciona».

## 1. Preparar la sandbox

- [ ] 1.1 Crear la cuenta estándar `tiling` en el Mac.
- [ ] 1.2 `gh auth login` y clonar este repo en `~/Repos/macOS-tiling` de esa cuenta.
- [ ] 1.3 Comprobar las Command Line Tools: `xcode-select -p`.
- [ ] 1.4 Instalar en esa cuenta lo mínimo para trabajar (kitty, una fuente mono) y anotarlo como dependencia de la integración.

## 2. Instalar sin Homebrew

- [ ] 2.1 AeroSpace desde el zip en `~/Applications` y `~/.local/bin`; anotar la versión.
- [ ] 2.2 Compilar SketchyBar con `make`: objetivo, ruta del binario, tiempo.
- [ ] 2.3 Compilar JankyBorders con `make`: objetivo, ruta del binario, tiempo.
- [ ] 2.4 Escribir `scripts/install-aerospace.sh`, `scripts/build-sketchybar.sh` y `scripts/build-borders.sh` con lo medido en 2.1 a 2.3, y `versions.toml` con las versiones (reglas del README).

## 3. AeroSpace

- [ ] 3.1 `config/aerospace/aerospace.toml` mínimo: escritorios 1 a 9 con Option+número, mover ventana con Option+Shift+número, foco con Option+flechas.

  Nota, por verificar antes de escribirla: con teclado en español Option+tecla escribe caracteres (¡, ¿, @, la tilde muerta) y estos atajos se los quitarían. Primero lo nativo (Ajustes del Sistema, Teclado, Teclas modificadoras, o dos modificadores); Karabiner solo si eso no basta (9.1).

- [ ] 3.2 Probar el acomodo de ventanas nuevas (`tiles`, `accordion`, normalización) y decidir si basta frente a fair y dwindle de mango.
- [ ] 3.3 Reglas por aplicación (`on-window-detected`): flotantes y escritorio fijo, como `windowrules.csv` de dotfiles (Zed en el 3).
- [ ] 3.4 Probar con dos pantallas: escritorios por monitor.
- [ ] 3.5 Junto a la 3.2, probar en la cuenta `tiling` OmniWM frente a AeroSpace: trae scroller (estilo niri) y dwindle (estilo Hyprland) por escritorio, como mango; TOML en `~/.config/omniwm/`, zip de Releases, macOS 26+. Glide como segundo candidato (TOML en `~/.config/glide/`, usa los Spaces nativos). Si gana otro, cambian la 7.1, el bloque 4 (OmniWM trae barra) y quizá sobra JankyBorders: decidirlo antes de escribir configuración. Comparación previa, sin instalar, en `docs/comparativa-gestores.md` (2026-10-28), ampliada a once gestores con los criterios del usuario: fair, dwindle y center_tile por teclado, y nunca desactivar SIP. Orden de prueba: komorebi for Mac (el único que nombra los tres), Amethyst y KiwiDesk, con los pasos de `docs/guion-prueba-gestores.md`.

## 4. SketchyBar

- [ ] 4.1 Escritorios de AeroSpace en la barra (idea: `items/spaces.sh` de omerxx).
- [ ] 4.2 Decidir entre ocultar la barra nativa o convivir con ella (en un Mac con muesca).
- [ ] 4.3 iStat Menus: probar los alias de SketchyBar (`--add alias`) frente a plugins propios de CPU, memoria y batería.
- [x] 4.4 Paleta Breeze Dark en `config/sketchybar/colors.sh`, copiada de la fila `breeze_dark` de `config/main/palettes.csv` de dotfiles (2026-10-28; `bash -n` en Linux con bash 5, sin medir con el 3.2 del Mac). Al trasladar, se genera desde esa tabla.

## 5. JankyBorders

- [ ] 5.1 Lanzarlo desde `after-startup-command` de AeroSpace, con el color de la paleta.

## 6. Gestos

- [ ] 6.1 Medir si Swish choca con AeroSpace; si choca, probar BetterTouchTool llamando a `aerospace workspace next|prev`.

## 7. `defaults` que hacen falta (los aplica el usuario; dotfiles los captura)

- [ ] 7.1 `com.apple.spaces spans-displays` en `true` (desactiva «Displays have separate Spaces»; pide cerrar sesión). Depende de la 3.5: OmniWM y Glide piden lo contrario («Displays have separate Spaces» activado).
- [ ] 7.2 `com.apple.dock expose-group-apps` en `true` (ya está en dotfiles).
- [ ] 7.3 Ocultar la barra nativa, si se decide en 4.2.
- [ ] 7.4 Dock abajo y con ocultación automática, como recomienda AeroSpace.

## 8. Cuenta principal e integración

- [ ] 8.1 Excluir los tres directorios en `.git/info/exclude` de dotfiles y enlazar (README, «En la cuenta principal»).
- [ ] 8.2 Una semana de uso sin tocar la configuración.
- [ ] 8.3 Pasar a dotfiles y archivar este repo (README, «Cómo se hace el traslado»).

## 9. Complementos

Regla: primero la función nativa de macOS; un programa solo entra si lo nativo no basta, y se dice qué le faltó.

- [ ] 9.1 Karabiner con la hyper key, antes de la tarea 3.1, solo si la nota de 3.1 lo pide.
- [ ] 9.2 Ice, junto a la tarea 4.2, si se decide convivir con la barra nativa.
- [ ] 9.3 Probar el Spotlight de Tahoe (acciones, portapapeles, atajos) antes de pensar en Raycast.
- [ ] 9.4 AltTab, para evaluarlo durante la semana de uso (8.2).
- [ ] 9.5 Leader Key, solo si en 8.2 Spotlight se queda corto para lanzar apps, URL y carpetas sin el ratón; antes que Raycast. Lo de AeroSpace va en sus modos de atajos.

## Atajos

Cruce con `config/main/keybinds.csv` de dotfiles, leído el 2026-10-28: 158 filas, todas clasificadas abajo (91 del gestor, 2 de gestos, 7 de lanzar programas, 30 nativas de macOS, 8 por decidir, 5 solo de Linux y 15 sin tecla). La columna «Tecla en mango» es la `decision` del CSV. Es la tabla que se cruza al trasladar.

`SUPER` es la tecla Windows del equipo Linux. Qué modificador la sustituye en el Mac lo decide la 3.1: Cmd choca con los atajos de las aplicaciones y Option con los caracteres del teclado español.

### Del gestor de ventanas

La columna «Qué pide al gestor» es la que se mira en la 3.5. «Atajo en macOS» se llena al escribir la configuración, después de la 3.1 y la 3.5.

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

### Fuera del gestor

| Grupo | Filas de mango | Quién lo cubre en macOS |
| --- | --- | --- |
| Gestos (2) | `gesture_desktop_cycle`, `gesture_focus_stack` | Tarea 6.1 |
| Lanzar programas (7) | `terminal`, `file_manager`, `browser`, `editor`, `yazi`, `notepad`, `text_editor` | El gestor (ejecutar un comando) o Leader Key (9.5); se decide con la 3.1 |
| Nativas de macOS (30) | `launcher`, `clipboard_history`, `close_window`, `minimize`, `overview`, `copy`, `cut`, `paste`, `terminal_copy_paste`, `process_list`, `lock`, `power_menu`, `screenshot`, `screenshot_screen`, `screen_record`, `notifications`, `control_center`, `network`, `settings`, `wallpaper`, `volume_up`, `volume_down`, `volume_mute`, `mic_mute`, `brightness_up`, `brightness_down`, `media_play`, `media_stop`, `media_prev`, `media_next` | Spotlight (9.3), Cmd+W y Cmd+M, Mission Control, Cmd+C/X/V, kitty, Cmd+Opt+Esc, Ctrl+Cmd+Q, Cmd+Shift+3/4/5, Centro de control y teclas de función |
| Por decidir (8) | `hotkey_overlay`, `ocr_region`, `restore_minimized`, `clipboard_wipe`, `inhibit_suspend`, `reload_shell`, `wallpaper_random`, `theme_picker` | Sin atajo nativo directo; se decide en la semana de uso (8.2) |
| Solo Linux (5) | `window_state`, `console`, `wake_monitor`, `radios_toggle`, `hibernate` | No se trasladan |
| Sin tecla en mango (15) | `quit`, `window_cycle`, `window_cycle_prev`, `tabbed`, `expand_width`, `move_floating`, `screenshot_copy`, `screenshot_edit`, `monitors_off`, `toggle_jump`, `workspace_prev`, `workspace_next`, `consume_up`, `consume_down`, `consume_into_column` | Nada que trasladar |
