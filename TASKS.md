# Tareas

Cada tarea se cierra con lo medido en el Mac (versión, comando y salida), no con «funciona».

## 1. Preparar la sandbox

- [ ] 1.1 Crear la cuenta estándar `tiling` en la M2P.
- [ ] 1.2 `gh auth login` y clonar este repo en `~/Repos/macos-tiling` de esa cuenta.
- [ ] 1.3 Comprobar las Command Line Tools: `xcode-select -p`.
- [ ] 1.4 Instalar en esa cuenta lo mínimo para trabajar (kitty, una fuente mono) y anotarlo

  como dependencia de la integración.

## 2. Instalar sin Homebrew

- [ ] 2.1 AeroSpace desde el zip en `~/Applications` y `~/.local/bin`; anotar la versión.
- [ ] 2.2 Compilar SketchyBar con `make`: objetivo, ruta del binario, tiempo.
- [ ] 2.3 Compilar JankyBorders con `make`: objetivo, ruta del binario, tiempo.
- [ ] 2.4 Escribir `scripts/install-aerospace.sh`, `scripts/build-sketchybar.sh` y

  `scripts/build-borders.sh` con lo medido en 2.1 a 2.3, y `versions.toml` con las
  versiones (reglas del README).

## 3. AeroSpace

- [ ] 3.1 `config/aerospace/aerospace.toml` mínimo: escritorios 1 a 9 con Option+número,

  mover ventana con Option+Shift+número, foco con Option+flechas.

- [ ] 3.2 Probar el acomodo de ventanas nuevas (`tiles`, `accordion`, normalización) y

  decidir si basta frente a fair y dwindle de mango.

- [ ] 3.3 Reglas por aplicación (`on-window-detected`): flotantes y escritorio fijo, como

  `windowrules.csv` de dotfiles (Zed en el 3).

- [ ] 3.4 Probar con dos pantallas: escritorios por monitor.

## 4. SketchyBar

- [ ] 4.1 Escritorios de AeroSpace en la barra (idea: `items/spaces.sh` de omerxx).
- [ ] 4.2 Decidir entre ocultar la barra nativa o convivir con ella (la M2P tiene muesca).
- [ ] 4.3 iStat Menus: probar los alias de SketchyBar (`--add alias`) frente a plugins

  propios de CPU, memoria y batería.

- [ ] 4.4 Paleta Breeze Dark, la misma de dotfiles.

## 5. JankyBorders

- [ ] 5.1 Lanzarlo desde `after-startup-command` de AeroSpace, con el color de la paleta.

## 6. Gestos

- [ ] 6.1 Medir si Swish choca con AeroSpace; si choca, probar BetterTouchTool llamando a

  `aerospace workspace next|prev`.

## 7. `defaults` que hacen falta (los aplica el usuario; dotfiles los captura)

- [ ] 7.1 `com.apple.spaces spans-displays` en `true` (desactiva «Displays have separate

  Spaces»; pide cerrar sesión).

- [ ] 7.2 `com.apple.dock expose-group-apps` en `true` (ya está en dotfiles).
- [ ] 7.3 Ocultar la barra nativa, si se decide en 4.2.
- [ ] 7.4 Dock abajo y con ocultación automática, como recomienda AeroSpace.

## 8. Cuenta principal e integración

- [ ] 8.1 Excluir los tres directorios en `.git/info/exclude` de dotfiles y enlazar

  (README, «En la cuenta principal»).

- [ ] 8.2 Una semana de uso sin tocar la configuración.
- [ ] 8.3 Pasar a dotfiles y archivar este repo (README, «Cómo se hace el traslado»).

## Atajos

Cada atajo de `aerospace.toml` se anota aquí con su equivalente de mango
(`config/main/keybinds.csv` de dotfiles). Es la tabla que se cruza al trasladar.

| Atajo en macOS | Acción de AeroSpace | Fila de mango |
| --- | --- | --- |
| (vacía hasta la tarea 3.1) | | |
