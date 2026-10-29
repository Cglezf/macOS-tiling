# macOS-tiling

Laboratorio para llevar a macOS una forma de trabajo cercana a la de mango en Linux: escritorios por teclado, ventanas en mosaico, una barra propia y bordes de foco. Vive aparte de `~/Repos/dotfiles` mientras se configura. Cuando esté maduro, su configuración pasa a dotfiles y este repo se archiva.

## Piezas

| Pieza | Para qué | Cómo se instala |
| --- | --- | --- |
| [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Gestor de ventanas en mosaico, con escritorios propios y sin desactivar SIP | Zip de [Releases](https://github.com/nikitabobko/AeroSpace/releases) |
| [SketchyBar](https://github.com/FelixKratz/SketchyBar) | Barra superior programable | Compilado con `make` |
| [JankyBorders](https://github.com/FelixKratz/JankyBorders) | Borde de color en la ventana con el foco | Compilado con `make` |

## Principios

1. **Sin Homebrew.** AeroSpace se instala desde su zip oficial. SketchyBar y JankyBorders se compilan desde el código fuente con `make` o `cmake` y las Command Line Tools de Xcode (`xcode-select --install`).
2. **Otros dotfiles solo dan ideas.** omarchy-mac y las configuraciones de la tabla de referencias se leen, no se instalan ni se copian enteros: instalan paquetes al gusto de su autor. Lo que se tome se reescribe aquí y se dice de dónde salió.
3. **Este repo solo guarda configuración y scripts de construcción.** No escribe `defaults` de macOS, no toca `~/Repos/dotfiles` y no instala nada fuera de las rutas de la sección «Dónde queda cada cosa».
4. **Los `defaults` de macOS son de dotfiles.** Los cambia el usuario a mano en el Mac y el respaldo de dotfiles los captura en `config/defaults/keys.toml`. Aquí solo se anotan en `TASKS.md` los que hagan falta.
5. **XDG estricto.** AeroSpace lee `~/.config/aerospace/aerospace.toml`; nunca `~/.aerospace.toml`, que además provoca un error de ambigüedad si existen los dos.
6. **Shell en zsh** y scripts que corran con el bash 3.2 del sistema, igual que en dotfiles.

## Dónde queda cada cosa

| Qué | Ruta |
| --- | --- |
| `AeroSpace.app` | `~/Applications/` (no pide permisos de administrador) |
| Binarios `aerospace`, `sketchybar`, `borders` | `~/.local/bin/` |
| Configuración versionada | `config/aerospace/`, `config/sketchybar/`, `config/borders/` de este repo |
| Configuración que leen las apps | `~/.config/aerospace`, `~/.config/sketchybar`, `~/.config/borders` (enlaces a este repo) |
| Código fuente y compilación | `build/`, ignorado por git |

## Sandbox: una cuenta de macOS de prueba (recomendado)

AeroSpace mueve todas las ventanas de la sesión y pide permiso de Accesibilidad; no hay forma de probarlo en un contenedor. La sandbox real es **otra cuenta de usuario de macOS**: tiene su propio `~/.config`, sus propios `defaults` y sus propios permisos, así que nada de lo que se rompa allí llega a la cuenta de trabajo ni al repo dotfiles.

1. Ajustes del Sistema > Usuarios y grupos > Añadir usuario: cuenta **Estándar**, nombre `tiling`.
2. Entrar en esa cuenta y abrir una terminal.
3. Dar acceso a GitHub en esa cuenta (`gh auth login`) y clonar: `git clone https://github.com/<usuario>/macOS-tiling ~/Repos/macOS-tiling`.
4. `xcode-select -p` debe responder una ruta; si no, `xcode-select --install`.
5. Instalar AeroSpace desde el zip (sección siguiente) y enlazar la configuración.
6. Conceder Accesibilidad a AeroSpace y, si se usan alias de la barra nativa, Grabación de pantalla a SketchyBar (Ajustes del Sistema > Privacidad y seguridad).
7. Al terminar una sesión de pruebas: commit y push desde la cuenta `tiling`, y `git pull` en la cuenta principal cuando haga falta.

En esa cuenta no se instala dotfiles. Lo que haga falta de él (fuente, kitty) se instala a mano y se anota en `TASKS.md` como dependencia para la integración.

Alternativa más pesada: una máquina virtual de macOS con [UTM](https://mac.getutm.app/) o [Tart](https://tart.run/). Sirve para probar una instalación desde cero, pero ocupa decenas de GB y la aceleración gráfica es limitada.

## En la cuenta principal (cuando ya funcione en la de prueba)

En el Mac de trabajo `~/.config` es el repo dotfiles y su sincronización commitea lo que aparece en `config/`. Para que los enlaces del laboratorio no suban a dotfiles:

1. Añadir a `~/Repos/dotfiles/.git/info/exclude` (local, no versionado):

   ```text
   /config/aerospace
   /config/sketchybar
   /config/borders
   ```

2. Crear los enlaces:

   ```zsh
   for app in aerospace sketchybar borders; do
       ln -sfn ~/Repos/macOS-tiling/config/$app ~/.config/$app
   done
   ```

3. Comprobar en dotfiles que `git status --short` no muestra nada nuevo.

Al integrar en dotfiles se quitan esas tres líneas de `exclude` y los enlaces, y la configuración entra como archivos normales de `config/`.

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

Pendiente de medir en el Mac: el nombre exacto de los objetivos de `make` y la ruta del binario que dejan (tareas 2.2 y 2.3 de `TASKS.md`). Su instalación oficial es un tap de Homebrew, así que esta parte no está documentada por los autores.

## Cómo se conectan

- AeroSpace avisa a la barra al cambiar de escritorio con `exec-on-workspace-change` y `sketchybar --trigger aerospace_workspace_change`.
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
| [Wimi](https://github.com/nick-friedrich/wimi-releases) y su [video](https://www.youtube.com/watch?v=WcS2jn647sI) | Solo ideas: código cerrado, sin archivo de configuración y de pago en la 1.0. Cajón lateral que junta cambiador de ventanas con vista previa, plantillas de acomodo, lanzador e hyper key (Bloq Mayús como Ctrl+Opt+Cmd) |
| [OmniWM](https://github.com/BarutSRB/OmniWM) | Candidato frente a AeroSpace (tarea 3.5): GPL-2.0, scroller estilo niri y dwindle estilo Hyprland por escritorio, barra propia, TOML en `~/.config/omniwm/`, zip de Releases, macOS 26+. Pide «Displays have separate Spaces» activado |
| [Glide](https://github.com/glide-wm/glide) ([web](https://glidewm.org/)) | Segundo candidato (tarea 3.5): Rust, MIT o Apache-2.0, TOML en `~/.config/glide/`, DMG en Releases. Trabaja sobre los Spaces nativos y se activa por escritorio |
| [HyprMac de zacharytgray](https://github.com/zacharytgray/HyprMac) | Solo ideas: dwindle propio en Swift, MIT; enlace con SketchyBar por `state.json` y `hyprmac://`. Configuración JSON fuera de XDG |
| [HyperMac de chrisjaimyantony](https://github.com/chrisjaimyantony/HyperMac) | Solo ideas, en alfa (v0.2, Swift, MIT): animaciones con curva Quartic Ease-Out a 60 FPS; hoy solo maestro-pila, sin archivo de configuración ni binarios |
| [HyprSpace de Li-RC](https://github.com/Li-RC/HyprSpace) | Solo ideas: fork de AeroSpace (v0.1.0, sin notarizar) con dwindle, pestañas, tira de escritorios y bordes |
| [Fork dwindle de LDGerrits](https://github.com/LDGerrits/AeroSpace) | Solo ideas: `new-window-split = 'dwindle'` sobre AeroSpace; sin binarios ni PR al original |
| [aether](https://github.com/viniciusbregoli/aether) y [skyland](https://github.com/waxdred/skyland) | Solo ideas: el modelo de AeroSpace con dwindle, animaciones y borde del foco. aether no declara licencia |
| [Vorssaint](https://github.com/vorssaint/vorssaint-utils) | No sustituye a SketchyBar: son módulos dentro de la barra nativa, configurados solo por la interfaz y sin CLI ni eventos para un gestor. Sirve frente a iStat Menus (tarea 4.3): CPU, GPU, memoria, temperaturas, batería y red. GPL-3.0, DMG notarizado, macOS 14+ en Apple Silicon. Trae acomodo de ventanas propio: hay que desinstalar ese módulo si convive con un gestor en mosaico |
| [Hyperkey](https://hyperkey.app/) | Hyper key en una app pequeña y gratuita, alternativa a Karabiner para la tarea 9.1. Ojo: un reporte de [MacGeneration](https://www.macg.co/macos/2026/02/macos-264-peut-bloquer-les-methodes-traditionnelles-pour-activer-lhyper-key-307029) dice que las betas de macOS 26.4 rompían los métodos tradicionales |

## Reglas para que el traslado a dotfiles sea transparente

Todo lo de este repo se escribe ya con las convenciones de `~/Repos/dotfiles`. Así el traslado es copiar directorios, no reescribirlos. Si una regla no se puede cumplir, se anota en `TASKS.md` con su motivo antes de seguir.

### Estructura

1. **La configuración vive en `config/<app>/`** con el mismo nombre que tendrá en dotfiles: `config/aerospace/aerospace.toml`, `config/sketchybar/sketchybarrc`, `config/borders/bordersrc`. Nada en la raíz del repo ni en `~/.aerospace.toml`.
2. **Los scripts de instalación van en `scripts/`**, uno por pieza (`install-aerospace.sh`, `build-sketchybar.sh`, `build-borders.sh`). En dotfiles pasarán a `install/`.
3. **Lo que la barra ejecuta va dentro de `config/sketchybar/`** (`items/`, `plugins/`), porque al trasladar se copia el directorio entero.

### Datos fuera del código

1. **Versiones y URL en un solo archivo de datos**, `versions.toml` (versión de AeroSpace, etiqueta o commit de SketchyBar y JankyBorders). En dotfiles pasan a sus tablas; los scripts nunca llevan una versión escrita dentro.
2. **Colores en un solo archivo**, `config/sketchybar/colors.sh`, con la paleta Breeze Dark de dotfiles. JankyBorders y AeroSpace no repiten un color: lo toman de ahí o llevan un comentario que diga de qué variable sale.
3. **Atajos en un solo sitio**, el bloque `[mode.main.binding]` de `aerospace.toml`, con un comentario por grupo. Cada atajo se anota en `docs/atajos.md` con su equivalente de mango; esa tabla es la que se cruza con `config/main/keybinds.csv` de dotfiles (tarea 10.1).
4. **Sin rutas de usuario escritas**: `$HOME`, `~` o `${XDG_CONFIG_HOME:-$HOME/.config}`, nunca `/Users/<nombre>`. El pre-commit de dotfiles rechaza esas rutas.

### Scripts

1. **bash 3.2**, el de macOS, con `#!/usr/bin/env bash`: sin `declare -A`, `mapfile`, `${var^^}` ni un `case` dentro de `$( )`.
2. **Banderas BSD**: nada de `stat -c`, `date -d`, `sed -i` sin argumento ni `cp --parents`.
3. **`grep` y no `rg`** dentro de los scripts: en una máquina recién formateada `rg` aún no existe cuando corre el bootstrap.
4. **`--help` y `--dry-run`** en cada script. `--dry-run` no escribe nada y dice lo que haría.
5. **Guarda de sistema después del `--help`**: fuera de macOS dice qué falta y sale con 1, nunca con 0 en silencio.
6. **Idempotentes**: una segunda corrida no descarga, no compila ni copia lo que ya está en su versión. Solo se escribe lo que difiere.
7. **No mentir en la salida**: un mensaje de éxito solo después de comprobar que el archivo o el binario existe.

### Lo que este repo nunca hace

1. **Escribir `defaults`.** Los aplica el usuario a mano y dotfiles los captura en `config/defaults/keys.toml`; aquí solo se anotan en `TASKS.md`, bloque 7.
2. **Usar Homebrew**, ni siquiera para una dependencia de compilación.
3. **Tocar dotfiles**: ni archivos, ni ramas, ni su `.gitignore`. La única excepción es la línea local de `.git/info/exclude` descrita arriba, que no se versiona.
4. **Crear agentes de `launchd` a mano.** AeroSpace arranca la barra y los bordes con `after-startup-command`; si hiciera falta un agente, se anota para que lo cree el bootstrap.

### Redacción y commits

1. **Prosa en español con acentos; código, claves y nombres en inglés y ASCII.**
2. **Markdown limpio para el lint de dotfiles**: encabezados en orden, una línea en blanco alrededor de listas, tablas y bloques de código, bloques con lenguaje, y un párrafo o una viñeta por línea física.
3. **Un commit, una finalidad**, con el formato de dotfiles (`feat(aerospace): …`, `fix(sketchybar): …`, `docs: …`), en español y sin ninguna atribución.
4. **Sin secretos**: ni tokens, ni llaves, ni nombres de red.

### Cómo se hace el traslado

Criterio para darlo por terminado: una semana de uso en la cuenta principal sin tocar la configuración. Entonces:

1. Quitar las tres líneas de `.git/info/exclude` de dotfiles y los enlaces de `~/.config`.
2. Copiar `config/aerospace`, `config/sketchybar` y `config/borders` a `~/Repos/dotfiles/config/`.
3. Pasar `scripts/` a `install/` de dotfiles y `versions.toml` a sus tablas, con las pruebas que pida su suite.
4. Añadir a `config/main/inventory.csv` una fila por pieza, con su celda de macOS.
5. Comprobar que los `defaults` del bloque 7 ya están en `config/defaults/keys.toml`.
6. Archivar este repo en GitHub.
