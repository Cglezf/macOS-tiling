# macos-tiling

Laboratorio para llevar a macOS una forma de trabajo cercana a la de mango en Linux:
escritorios por teclado, ventanas en mosaico, una barra propia y bordes de foco. Vive
aparte de `~/Repos/dotfiles` mientras se configura. Cuando esté maduro, su
configuración pasa a dotfiles y este repo se archiva.

## Piezas

| Pieza | Para qué | Cómo se instala |
| --- | --- | --- |
| [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Gestor de ventanas en mosaico, con escritorios propios y sin desactivar SIP | Zip de [Releases](https://github.com/nikitabobko/AeroSpace/releases) |
| [SketchyBar](https://github.com/FelixKratz/SketchyBar) | Barra superior programable | Compilado con `make` |
| [JankyBorders](https://github.com/FelixKratz/JankyBorders) | Borde de color en la ventana con el foco | Compilado con `make` |

## Principios

1. **Sin Homebrew.** AeroSpace se instala desde su zip oficial. SketchyBar y

   JankyBorders se compilan desde el código fuente con `make` o `cmake` y las Command
   Line Tools de Xcode (`xcode-select --install`).

2. **Otros dotfiles solo dan ideas.** omarchy-mac y las configuraciones de la tabla de

   referencias se leen, no se instalan ni se copian enteros: instalan paquetes al gusto
   de su autor. Lo que se tome se reescribe aquí y se dice de dónde salió.

3. **Este repo solo guarda configuración y scripts de construcción.** No escribe

   `defaults` de macOS, no toca `~/Repos/dotfiles` y no instala nada fuera de las rutas
   de la sección «Dónde queda cada cosa».

4. **Los `defaults` de macOS son de dotfiles.** Los cambia el usuario a mano en el Mac y

   el respaldo de dotfiles los captura en `config/defaults/keys.toml`. Aquí solo se
   anotan en `TASKS.md` los que hagan falta.

5. **XDG estricto.** AeroSpace lee `~/.config/aerospace/aerospace.toml`; nunca

   `~/.aerospace.toml`, que además provoca un error de ambigüedad si existen los dos.

6. **Shell en zsh** y scripts que corran con el bash 3.2 del sistema, igual que en

   dotfiles.

## Dónde queda cada cosa

| Qué | Ruta |
| --- | --- |
| `AeroSpace.app` | `~/Applications/` (no pide permisos de administrador) |
| Binarios `aerospace`, `sketchybar`, `borders` | `~/.local/bin/` |
| Configuración versionada | `config/aerospace/`, `config/sketchybar/`, `config/borders/` de este repo |
| Configuración que leen las apps | `~/.config/aerospace`, `~/.config/sketchybar`, `~/.config/borders` (enlaces a este repo) |
| Código fuente y compilación | `build/`, ignorado por git |

## Sandbox: una cuenta de macOS de prueba (recomendado)

AeroSpace mueve todas las ventanas de la sesión y pide permiso de Accesibilidad; no hay
forma de probarlo en un contenedor. La sandbox real es **otra cuenta de usuario de
macOS**: tiene su propio `~/.config`, sus propios `defaults` y sus propios permisos, así
que nada de lo que se rompa allí llega a la cuenta de trabajo ni al repo dotfiles.

1. Ajustes del Sistema > Usuarios y grupos > Añadir usuario: cuenta **Estándar**,

   nombre `tiling`.

2. Entrar en esa cuenta y abrir una terminal.
3. Dar acceso a GitHub en esa cuenta (`gh auth login`) y clonar:

   `git clone https://github.com/<usuario>/macos-tiling ~/Repos/macos-tiling`.

4. `xcode-select -p` debe responder una ruta; si no, `xcode-select --install`.
5. Instalar AeroSpace desde el zip (sección siguiente) y enlazar la configuración.
6. Conceder Accesibilidad a AeroSpace y, si se usan alias de la barra nativa, Grabación

   de pantalla a SketchyBar (Ajustes del Sistema > Privacidad y seguridad).

7. Al terminar una sesión de pruebas: commit y push desde la cuenta `tiling`, y

   `git pull` en la cuenta principal cuando haga falta.

En esa cuenta no se instala dotfiles. Lo que haga falta de él (fuente, kitty) se instala
a mano y se anota en `TASKS.md` como dependencia para la integración.

Alternativa más pesada: una máquina virtual de macOS con [UTM](https://mac.getutm.app/)
o [Tart](https://tart.run/). Sirve para probar una instalación desde cero, pero ocupa
decenas de GB y la aceleración gráfica es limitada.

## En la cuenta principal (cuando ya funcione en la de prueba)

En la M2P `~/.config` es el repo dotfiles y su sincronización commitea lo que aparece en
`config/`. Para que los enlaces del laboratorio no suban a dotfiles:

1. Añadir a `~/Repos/dotfiles/.git/info/exclude` (local, no versionado):

   ```text
   /config/aerospace
   /config/sketchybar
   /config/borders
   ```

2. Crear los enlaces:

   ```zsh
   for app in aerospace sketchybar borders; do
       ln -sfn ~/Repos/macos-tiling/config/$app ~/.config/$app
   done
   ```

3. Comprobar en dotfiles que `git status --short` no muestra nada nuevo.

Al integrar en dotfiles se quitan esas tres líneas de `exclude` y los enlaces, y la
configuración entra como archivos normales de `config/`.

## Instalar AeroSpace sin Homebrew

```zsh
mkdir -p ~/Applications ~/.local/bin build
# Descargar el zip de la última versión desde la página de Releases a build/
unzip -q build/AeroSpace-v*.zip -d build/aerospace
mv build/aerospace/AeroSpace-v*/AeroSpace.app ~/Applications/
cp build/aerospace/AeroSpace-v*/bin/aerospace ~/.local/bin/
# Solo si macOS se niega a abrirlo por no poder comprobarlo:
xattr -d com.apple.quarantine ~/Applications/AeroSpace.app
```

Se pierde la actualización automática de Homebrew: actualizar es repetir estos pasos.

## Compilar SketchyBar y JankyBorders

```zsh
git clone https://github.com/FelixKratz/SketchyBar build/SketchyBar
git clone https://github.com/FelixKratz/JankyBorders build/JankyBorders
make -C build/SketchyBar
make -C build/JankyBorders
```

Pendiente de medir en el Mac: el nombre exacto de los objetivos de `make` y la ruta del
binario que dejan (tareas 2.2 y 2.3 de `TASKS.md`). Su instalación oficial es un tap de
Homebrew, así que esta parte no está documentada por los autores.

## Cómo se conectan

- AeroSpace avisa a la barra al cambiar de escritorio con `exec-on-workspace-change` y

  `sketchybar --trigger aerospace_workspace_change`.

- La barra pregunta el escritorio activo con `aerospace list-workspaces --focused`.
- JankyBorders se lanza desde `after-startup-command` de AeroSpace.

## Referencias para tomar ideas

| Fuente | Qué mirar |
| --- | --- |
| [Guía de AeroSpace](https://nikitabobko.github.io/AeroSpace/guide) y [goodies](https://nikitabobko.github.io/AeroSpace/goodies) | Instalación, `defaults` recomendados, ejemplo con SketchyBar |
| [Koen van Gilst](https://koenvangilst.nl/lab/aerospace-sketchybar-macos-setup) | Guía completa en macOS Tahoe |
| [Sparkylc2/minimal-aerospace-sketchybar-config](https://github.com/Sparkylc2/minimal-aerospace-sketchybar-config) | Configuración mínima con indicador de modo |
| [omerxx/dotfiles](https://github.com/omerxx/dotfiles/tree/master/sketchybar) | `items/spaces.sh` (escritorios en la barra) y `items/apple.sh` (menú de Apple) |
| [omarchy-mac](https://gitea.com/icameheretodance/omarchy-mac) | Solo ideas: no se instala |
| [Discusión 598 de SketchyBar](https://github.com/FelixKratz/SketchyBar/discussions/598) | Cómo mostrar los escritorios de AeroSpace |
| [Issue 430 de AeroSpace](https://github.com/nikitabobko/AeroSpace/issues/430) | Por qué mostrar los escritorios vacíos vuelve lento el aviso |

## Integración en dotfiles

Criterio para dar el laboratorio por terminado: una semana de uso en la cuenta principal
sin tocar la configuración. Entonces:

1. La configuración pasa a `~/Repos/dotfiles/config/{aerospace,sketchybar,borders}`.
2. La descarga de AeroSpace y la compilación de las otras dos se vuelven pasos del

   bootstrap de macOS.

3. Los `defaults` anotados ya deben estar en `config/defaults/keys.toml`.
4. Este repo se archiva en GitHub.
