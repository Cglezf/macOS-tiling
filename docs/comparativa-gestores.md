# Comparación de gestores de ventanas (tarea 3.5)

Leído en su documentación, sus Releases y sus issues el 2026-10-28, sin instalar nada. Decide el usuario en la cuenta `tiling`; esto solo prepara la prueba. Verificados a mano dos datos (requisitos y notarización de OmniWM, última versión de AeroSpace); el resto sale de un barrido con su fuente en cada celda.

## Tabla

| Criterio | AeroSpace | OmniWM | Glide |
| --- | --- | --- | --- |
| Layouts | `tiles` y `accordion`, horizontal o vertical; por escritorio ([guía](https://nikitabobko.github.io/AeroSpace/guide)) | Scroller estilo niri y dwindle estilo Hyprland, elegibles por escritorio ([README](https://github.com/BarutSRB/OmniWM)) | `tree` con grupos en pestañas o apilados; `scroll` experimental ([glide.default.toml](https://raw.githubusercontent.com/glide-wm/glide/main/glide.default.toml)) |
| Maestro-pila | No | No | No |
| Escritorios | Emulados propios; pide **desactivar** «Displays have separate Spaces»; SIP activo ([guía](https://nikitabobko.github.io/AeroSpace/guide)) | Propios sobre un Space nativo por pantalla; pide el ajuste **activado** y sin él se pausa; SIP activo ([README](https://github.com/BarutSRB/OmniWM)) | Spaces nativos, activados uno a uno; pide el ajuste **activado** ([getting-started](https://glidewm.org/guides/getting-started/)); escritorios virtuales pedidos en el #145 |
| Multimonitor | `workspace-to-monitor-force-assignment` fija escritorios a monitores | Asistente por pantalla y «Monitor Roles» | Mover ventanas entre monitores sigue abierto (#82) |
| Configuración | TOML en `${XDG_CONFIG_HOME}/aerospace/aerospace.toml`; recarga automática; modos `[mode.X.binding]` | TOML en `${XDG_CONFIG_HOME:-$HOME/.config}/omniwm/settings.toml`; recarga al guardar; modificador Hyper; submapas sin verificar | TOML en `~/.config/glide/glide.toml`; `glide config update --watch`; modos sin documentar |
| Instalación sin Homebrew | Zip en Releases, **sin notarizar** (`xattr -d com.apple.quarantine`); macOS 13+ | Zip en Releases, **firmado y notarizado**; **macOS 26+ y Apple Silicon** | DMG en Releases; firma y versión mínima sin verificar |
| Integración con una barra | CLI `aerospace` y `exec-on-workspace-change`; ejemplo oficial con SketchyBar | CLI `omniwmctl` con `subscribe` y `watch`; IPC apagado de fábrica y protocolo que cambia entre versiones (17 a 18 en la v0.7.5); trae barra propia | Sin IPC ni hooks documentados; icono en la barra de menús |
| Bordes de foco | No (JankyBorders) | No documentados para el mosaico (JankyBorders) | Sin verificar |
| Gestos de trackpad | No | De 2, 3 y 4 dedos para las columnas; cambio de escritorio opcional | Sin verificar |
| Última versión | v0.21.3-Beta, 2026-07-16; cinco en 2026 ([releases](https://github.com/nikitabobko/AeroSpace/releases)) | v0.7.6, 2026-10-08; unas diez estables desde 2026-09-07 y canarias casi diarias | v0.2.17, 2026-10-27; unas diez en 2026 |
| Licencia | MIT | GPL-2.0 | Apache-2.0 o MIT |
| Fallos abiertos que importan | #1615: ventanas fantasma y lentitud en Tahoe | #1030: desaparecen ventanas en el layout niri (abierto el 2026-10-28); #852 | #194: más de la mitad de los comandos de teclado no funcionan |

## Lectura frente a la tabla de atajos

- **OmniWM** cubre lo que más usa mango: scroller (columnas, consumir y expulsar, anchos en ciclo), dwindle y gestos. Su riesgo es la juventud: el #1030 toca justo el scroller, y el IPC inestable obliga a fijar versión si SketchyBar lo escucha. Con su barra propia quizá sobra el bloque 4.
- **AeroSpace** es el conservador: documentación, CLI estable y ejemplo con SketchyBar. Pierde el scroller, el dwindle y los gestos (6.1 sigue abierta); `accordion` hace de monocle.
- **Glide** queda detrás: scroller experimental, sin escritorios propios y con atajos rotos (#194).
- **Ninguno tiene maestro-pila**: `layout_fair`, `layout_center`, `zoom_master`, `master_more` y `master_less` de la tabla de atajos no tienen equivalente directo en ninguno.

## Lo que no se pudo verificar

- Número de contribuidores de los tres.
- Firma, notarización, versión mínima, gestos y SIP de Glide.
- Si OmniWM tiene modos tipo submapa y qué eventos emite `subscribe`.
- Si el arreglo del #1615 de AeroSpace ya está publicado.

## Qué medir en la cuenta `tiling`

1. OmniWM primero, con «Displays have separate Spaces» activado, que es el valor de fábrica: no pide cerrar sesión.
2. El #1030 en uso real: abrir y cerrar ventanas en el scroller durante una sesión de trabajo.
3. AeroSpace después, desactivando el ajuste (pide cerrar sesión), solo si OmniWM no convence.
