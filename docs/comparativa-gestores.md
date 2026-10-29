# Comparación de gestores de ventanas (tarea 3.5)

Leído en la documentación, los Releases y los issues de cada proyecto el 2026-10-28, sin instalar nada. Lo decide el usuario en la cuenta `tiling`; esto solo prepara la prueba. Cada dato lleva su fuente; los verificados a mano están marcados con (v).

## Criterios del usuario

Dichos el 2026-10-28:

1. Los layouts de mango que más usa: **fair** (rejilla pareja), **dwindle** (BSP en espiral) y **center_tile** (la principal al centro y las demás a los lados).
2. Todo **por teclado**; el ratón y el trackpad, en segundo plano.
3. **Nunca desactivar SIP**, ni siquiera en parte, por seguridad.

Y los de este repo: mosaico automático (no solo acomodar, como Magnet), macOS 26 en Apple Silicon, configuración en un archivo de texto y alguna versión en 2026.

## Cobertura de los tres layouts

| Gestor | fair | dwindle | center_tile | SIP | Estado |
| --- | --- | --- | --- | --- | --- |
| [komorebi for Mac](https://github.com/LGUG2Z/komorebi-for-mac) | `Grid` (v) | `BSP` (v) | `UltrawideVerticalStack` (v), por confirmar en uso | Solo la promesa del autor de que no hace falta | v0.1.1, 2026-05-03; Tahoe sin prueba; licencia de fuente visible: uso personal sí, en el trabajo no (ver Lectura) |
| [Amethyst](https://github.com/ianyh/Amethyst) | No (`Column` y `Row` reparten en una sola dimensión) | `BSP` (v), sin espiral documentada | `3Column-Middle` (v) | No lo pide (v) | v0.24.3, 2026-04-02; MIT; fallos abiertos en Tahoe (#1812, #1849) |
| [KiwiDesk](https://github.com/KiwiCanopy/KiwiDesk) | `Grid`, según un tercero | `BSP`, según un tercero | No | «Accessibility only, never SIP» (v) | v4.0.0, 2026-10-28; BSL 1.1 (pasa a MIT a los 4 años); macOS 14+; Tahoe sin prueba; Lua opcional, el resto en su app de Ajustes |
| [Rift](https://github.com/acsandmann/rift) | No | `BSP` (v) | Maestro-pila estilo dwm (v); centro no | No lo pide (v) | v0.7.1, 2026-10-27; Apache-2.0; TOML recargable; IPC con ejemplo de SketchyBar; usuarios en Tahoe 26.5 y 26.6 |
| [skyland](https://github.com/waxdred/skyland) | No | Sí | Maestro con `master-orientation = center` | El mosaico no lo pide; los efectos opcionales sí | v0.6.0, 2026-10-25; fork de AeroSpace; probado en 15.6.1 y 27.0.1, no en la 26 |
| [HyprMac](https://github.com/zacharytgray/HyprMac) | No | Sí (por defecto) | No | No lo pide | v0.19.0, 2026-10-27; MIT; JSON fuera de XDG |
| [OmniWM](https://github.com/BarutSRB/OmniWM) | No | Sí | No | No lo pide (v) | v0.7.6, 2026-10-08; GPL-2.0; macOS 26+, notarizado (v) |
| [yabai](https://github.com/koekeishiya/yabai) | No (`--grid` coloca una sola ventana) | `bsp` | No | Con SIP activo pierde crear y mover espacios, scratchpad, sticky y capas (v) | v7.1.25, 2026-05-08; atajos externos con skhd |
| [Tatami](https://github.com/PangMo5/Tatami) | No | BSP con balanceo | No | No lo pide | v1.14.2, 2026-09-17; AGPL-3.0; TOML en `~/.config/tatami/`; Tahoe sin prueba |
| [AeroSpace](https://github.com/nikitabobko/AeroSpace) | No | No | No (propuesta #260, sin fecha) | No lo pide | v0.21.3-Beta, 2026-07-16 (v); MIT; el más documentado |
| [Glide](https://github.com/glide-wm/glide) | No | No | No | Sin verificar | v0.2.17, 2026-10-27; `scroll` experimental; #194: atajos rotos |

## Lectura

- **Solo komorebi for Mac tiene nombre para los tres.** Ese es su atractivo; los riesgos son que va en la v0.1.1, que nadie ha probado Tahoe, y que lo de SIP es una promesa del autor. Licencia (Komorebi License 2.0.0, leída el 2026-10-28): permite «personal use for research, experiment, and testing for the benefit of public knowledge, personal study, [...] hobby projects» sin aplicación comercial prevista, y su README excluye «using komorebi at work». El Mac es de uso personal, estudio e investigación, sin clases: la prueba y el estudio entran; la investigación hecha como parte de un empleo es zona gris. Si se adopta para eso, se confirma con el autor o se paga la licencia comercial (10 USD al mes o 110 al año, solo Mac).
- **Amethyst cubre dwindle y center_tile** con SIP activo, gratis y con años de historia. Le falta fair y arrastra fallos en Tahoe.
- **Nadie más tiene un center_tile real.** Rift y skyland tienen maestro-pila; skyland con orientación al centro, pero sin probarse en la 26.
- **OmniWM pierde peso**: su fuerte es el scroller, que el usuario casi no usa.
- **AeroSpace no tiene ninguno de los tres.** Sigue siendo el más estable, pero no se parece a mango en lo que importa.

## Descartados

| Proyecto | Motivo |
| --- | --- |
| Rectangle, Magnet, Loop, Moom, BetterSnapTool, Divvy, NeoTiler, wrangler, windowkit, mTile, Azimuth, Zonogy | Solo acomodan ventanas |
| [Tileorg](https://tileorg.com) | Rejilla fija de hasta 4 ventanas por panel, sin mosaico dinámico; de pago (29 USD) y código cerrado |
| [MacTiler](https://mactiler.com) | Tres columnas estáticas 25-50-25; de pago (19,99 a 49,99 USD); sin código visible |
| [setpiece](https://github.com/ChiFungHillmanChan/setpiece) | El layout se aplica a demanda; no acomoda las ventanas nuevas |
| [GlazeWM](https://github.com/glzr-io/glazewm) | Solo Windows |
| HyprSpace (derekbunch) | Se renombró a OmniWM |
| Paneru, Defi, tinywm, PaperWM.spoon | Solo desplazamiento (scroller), que el usuario no prioriza |

## Lo que no se pudo verificar

- komorebi for Mac: si `UltrawideVerticalStack` reparte las ventanas a los dos lados de la principal como center_tile, y si funciona en Tahoe.
- KiwiDesk: su lista de layouts (sale de un tercero, chatgate.ai) y la ruta de su configuración Lua.
- La ruta del YAML de Amethyst (por el ejemplo del repo, `~/.amethyst.yml`).
- Proyectos con menos de 40 estrellas del tema de GitHub que no se abrieron: aerospork, scrollwm, parket, KTApple, TrimWM, kolom, roadie, paneless, facet, Airlock, tessera, niri-mac, roller, SlideScroll, rambla, nori, hyprwm-macos, strip, tyler, mielwm, compo.sh.
- No se barrieron Reddit ni Hacker News aparte.

## Qué medir en la cuenta `tiling`

Orden propuesto, de más a menos parecido a mango:

1. **komorebi for Mac**: comprobar que `Grid`, `BSP` y `UltrawideVerticalStack` se ven como fair, dwindle y center_tile, y que no pide SIP. La prueba entra en su licencia.
2. **Amethyst**: `BSP` y `3Column-Middle`, y si los fallos #1812 y #1849 aparecen en el uso diario.
3. **KiwiDesk**: solo si los dos anteriores fallan; primero confirmar sus layouts.

Para cada uno: escribir los tres layouts con atajos de teclado, abrir y cerrar ventanas durante una sesión de trabajo y anotar lo que falle. La decisión cambia la 7.1 (el ajuste de Spaces) y el bloque 4.
