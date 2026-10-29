# Guion de prueba de gestores (tarea 3.5)

Para la cuenta `tiling` del Mac. Prueba komorebi for Mac, Amethyst, KiwiDesk y ZIL, uno a la vez y en ese orden, sin Homebrew: binario de GitHub Releases o compilación. Preparado el 2026-10-28 desde la documentación de cada uno; lo marcado «sin verificar» se confirma en el Mac. Por qué estos tres y no otros: `docs/comparativa-gestores.md`.

## Antes de empezar

1. Cuenta `tiling` lista (tareas 1.1 a 1.3) y `mkdir -p ~/Applications ~/.local/bin ~/Repos/macOS-tiling/build`.
2. Anotar la versión de macOS: `sw_vers`.
3. Magnet apagado en esa cuenta, si está instalado: dos gestores a la vez se pelean.
4. Atajos de la prueba con **Ctrl+Option**, que no escribe caracteres con el teclado español. Es solo para comparar los tres en igualdad; el modificador definitivo lo decide la 3.1.
5. Abrir cinco ventanas de tres apps (kitty, Safari, Finder) en el escritorio 1.

## Qué se mide en cada uno

Copiar esta tabla por gestor en `TASKS.md`, tarea 3.5, con lo visto:

| Prueba | Resultado |
| --- | --- |
| Versión instalada y cómo (zip, dmg, compilado) | |
| ¿Pidió desactivar SIP o algún permiso raro? | |
| fair: ¿la rejilla reparte cinco ventanas por igual? | |
| dwindle: ¿la sexta ventana divide la última en espiral? | |
| center_tile: ¿la principal queda al centro y el resto a los lados? | |
| Abrir y cerrar ventanas: ¿se reacomodan solas, sin huecos? | |
| Cambiar de escritorio y mover ventanas solo con teclado | |
| ¿Algún atajo choca con macOS o con una app? | |
| CPU en reposo (Monitor de Actividad) | |
| Retraso al cambiar de escritorio y al abrir una ventana, con 15 o más ventanas abiertas (a ojo: inmediato, se nota, molesta) | |
| Fallos o ventanas que se escapan del mosaico | |

## 1. komorebi for Mac

La licencia permite la prueba («research, experiment, and testing»), no el uso en el trabajo: ver la comparación.

Instalar (v0.1.1):

```zsh
cd ~/Repos/macOS-tiling/build
# Descargar komorebi-v0.1.1-aarch64-apple-darwin.zip y checksums.txt de
# https://github.com/LGUG2Z/komorebi-for-mac/releases
shasum -a 256 -c checksums.txt --ignore-missing
unzip -q komorebi-v0.1.1-aarch64-apple-darwin.zip -d komorebi
cp komorebi/komorebi komorebi/komorebic ~/.local/bin/   # nombres dentro del zip: sin verificar
```

Necesita además **skhd** para los atajos, que no trae: compilarlo de `https://github.com/koekeishiya/skhd` con `make` (sin verificar el objetivo).

Restricciones que avisa su guía:

- Maneja un solo Space de macOS, el activo al arrancar: sus escritorios son propios.
- Con más de un monitor pide desactivar «Displays have separate Spaces» y «Group windows by application».
- Permisos: Accesibilidad **y Grabación de pantalla**, para komorebi y para la terminal.

Configuración mínima, `~/.config/komorebi/komorebi.json` (esbozo; contrastar con la [referencia](https://komorebi.lgug2z.com/reference/komorebi-macos/) antes de usarlo):

```json
{
  "monitors": [
    {
      "workspaces": [
        { "name": "1", "layout": "Grid" },
        { "name": "2", "layout": "BSP" },
        { "name": "3", "layout": "UltrawideVerticalStack" }
      ]
    }
  ]
}
```

Atajos de prueba, `~/.config/komorebi/skhdrc`:

```text
ctrl + alt - g : komorebic change-layout grid
ctrl + alt - d : komorebic change-layout bsp
ctrl + alt - c : komorebic change-layout ultrawide-vertical-stack
ctrl + alt - left : komorebic focus left
ctrl + alt - right : komorebic focus right
ctrl + alt - 1 : komorebic focus-workspace 0
ctrl + alt - 2 : komorebic focus-workspace 1
ctrl + alt - 3 : komorebic focus-workspace 2
```

Arrancar: `KOMOREBI_CONFIG_HOME=~/.config/komorebi komorebi &` y `skhd --config ~/.config/komorebi/skhdrc &` (forma exacta del arranque: sin verificar). Para la barra: `komorebic query focused-workspace-layout`.

Desinstalar: `komorebic stop` (devuelve las ventanas ocultas), `komorebic disable-autostart`, matar skhd, borrar los binarios de `~/.local/bin` y `~/.config/komorebi`. Quitar los permisos en Privacidad y seguridad.

## 2. Amethyst

Instalar (v0.24.3):

```zsh
cd ~/Repos/macOS-tiling/build
# Descargar Amethyst.zip de https://github.com/ianyh/Amethyst/releases
unzip -q Amethyst.zip -d amethyst
mv amethyst/Amethyst.app ~/Applications/
# Solo si macOS se niega a abrirlo (notarización sin verificar):
xattr -d com.apple.quarantine ~/Applications/Amethyst.app
```

Permiso: Accesibilidad. Su README pide apagar «Reorganizar automáticamente los Spaces» (`com.apple.dock workspaces-auto-swoosh` en `false`): aplicarlo a mano en la cuenta `tiling` y, si Amethyst gana, anotarlo en el bloque 7.

Configuración mínima, `~/.config/amethyst/amethyst.yml` (la otra ruta que lee es `~/.amethyst.yml`, y gana si existe):

```yaml
layouts:
  - bsp
  - middle-wide
  - column
  - row
```

`middle-wide` es el nombre que se supone para 3Column-Middle: sin verificar. Amethyst no fija un layout por escritorio en el archivo; se cambia con atajos.

Atajos de fábrica: Option+Shift (mod1) y Ctrl+Option+Shift (mod2). mod1+Espacio cicla el layout, mod1+J y mod1+K mueven el foco, mod2+1..9 manda la ventana a un escritorio. Cambiar de escritorio es de macOS (Ctrl+número, si está activo en Teclado > Atajos > Mission Control).

Para la barra no expone nada: ni CLI ni eventos. Si gana, SketchyBar solo puede mostrar los Spaces nativos.

Desinstalar: salir de Amethyst, borrar `~/Applications/Amethyst.app` y `~/.config/amethyst`. El dominio de preferencias (probablemente `com.amethyst.Amethyst`): sin verificar.

## 3. KiwiDesk

Instalar (v4.0.0, publicada el 2026-10-28):

```zsh
# Descargar KiwiDesk-4.0.0.dmg de https://github.com/KiwiCanopy/KiwiDesk/releases
# Montarlo y arrastrar KiwiDesk.app a ~/Applications (firmado y notarizado según su web)
ln -sf ~/Applications/KiwiDesk.app/Contents/MacOS/KiwiDesk ~/.local/bin/kiwidesk
```

La CLI se enlaza, no se copia: la copia rompe la firma. Su guía la enlaza en `/usr/local/bin` con `sudo`; aquí va a `~/.local/bin`, sin permisos de administrador.

Permiso: solo Accesibilidad, y luego «Start Tiling». Trabaja sobre los Spaces nativos.

Configuración mínima, `~/.config/KiwiDesk/init.lua` (se crea con una plantilla al primer arranque; añadir al final):

```lua
KiwiDesk.set_mode(1, "grid")
KiwiDesk.set_mode(2, "bsp")
KiwiDesk.set_mode(3, "stack")
```

No tiene un layout de principal al centro: en el escritorio 3 se mira si `stack` sirve de sustituto. Recargar con `kiwidesk reload_config`.

Atajos de fábrica, ya con Ctrl+Option: ⌃⌥C cicla el layout, ⌃⌥ y una flecha mueve el foco, ⌃⌥1..0 cambia de escritorio, ⌃⌥⇧ y un dígito mueve la ventana, ⌃⌥K muestra los atajos.

Para la barra: `kiwidesk get_state` (JSON) y `kiwidesk subscribe space_change layout_change`; tiene una receta oficial para SketchyBar.

Desinstalar (no hay guía oficial): `kiwidesk service stop`, quitar el ítem de inicio de sesión, borrar la app, el enlace de `~/.local/bin`, `~/.config/KiwiDesk/` y `~/Library/Application Support/KiwiDesk/`.

## 4. ZIL

Añadido el 2026-10-28 tras el barrido de Hacker News y la web. Gratuito («given away free and is not sold»), notarizado, «runs with SIP on»; licencia y código fuente sin publicar. Pensado para monitores anchos.

Instalar (v0.1.86, el único artefacto es un zip):

```zsh
cd ~/Repos/macOS-tiling/build
# Descargar Zil-0.1.86.zip de https://zil.daystra.com
ditto -x -k Zil-0.1.86.zip zil
mv zil/*.app ~/Applications/   # nombre exacto de la app: sin verificar
```

Su web lo abre desde `/Applications/`; si en `~/Applications/` falla, anotarlo y moverlo. Permiso: Accesibilidad. Trae nueve escritorios propios por pantalla; su relación con los Spaces nativos no la documenta.

Configuración: el primer arranque escribe `~/.config/zil/zil.toml` y lo recarga al guardar. Layouts: **Dwindle** y **Master-centre**, que persisten por escritorio; abre en Master-centre los escritorios más anchos que 2.2:1. No tiene fair.

Atajos de fábrica, con Ctrl+Option+Cmd: T cambia de layout, R reacomoda, J y K mueven el foco (con Shift intercambian), 1..9 cambia de escritorio (con Shift mueve la ventana), X alterna flotante. Usan tres modificadores, no los Ctrl+Option del resto de la prueba: anotarlo, no cambiarlo, para medirlo como viene.

Para la barra: CLI `zil` con socket (`zil show`, `zil doctor`); no menciona SketchyBar.

Desinstalar (no hay guía): salir de ZIL, borrar la app y `~/.config/zil/`, y quitar el permiso de Accesibilidad.

## Al terminar

- Llenar la tabla de cada gestor en la 3.5 y decidir.
- Commit y push desde la cuenta `tiling` (README, «Sandbox»).
- Lo que el ganador pida a macOS (Spaces, Dock) pasa al bloque 7.
