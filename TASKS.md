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
- [ ] 3.5 Junto a la 3.2, probar en la cuenta `tiling` OmniWM frente a AeroSpace: trae scroller (estilo niri) y dwindle (estilo Hyprland) por escritorio, como mango; TOML en `~/.config/omniwm/`, zip de Releases, macOS 26+. Glide como segundo candidato (TOML en `~/.config/glide/`, usa los Spaces nativos). Si gana otro, cambian la 7.1, el bloque 4 (OmniWM trae barra) y quizá sobra JankyBorders: decidirlo antes de escribir configuración. Comparación previa, sin instalar, en `docs/comparativa-gestores.md` (2026-10-28), ampliada con el barrido de proyectos chicos y de Hacker News, y con los criterios del usuario: fair, dwindle y center_tile por teclado, y nunca desactivar SIP. Orden de prueba: komorebi for Mac (el único que nombra los tres), Amethyst y KiwiDesk, con los pasos de `docs/guion-prueba-gestores.md`.

## 4. SketchyBar

- [ ] 4.1 Escritorios de AeroSpace en la barra (idea: `items/spaces.sh` de omerxx).
- [ ] 4.2 Decidir entre ocultar la barra nativa o convivir con ella (en un Mac con muesca).
- [ ] 4.3 iStat Menus: probar los alias de SketchyBar (`--add alias`) frente a plugins propios de CPU, memoria y batería. Vorssaint como tercera opción, sin su módulo de ventanas (README, referencias).
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

## 10. Atajos (al final)

- [ ] 10.1 Con el gestor (3.5) y el modificador (3.1) decididos, recorrer `docs/atajos.md`, que cruza las 158 filas de `config/main/keybinds.csv` de dotfiles, y llenar su columna «Atajo en macOS». Va al final a propósito, para que no sesgue la elección del gestor.
