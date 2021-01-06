# The Next Level (2008)

A trackloader demo for the Commodore VIC-20. Basically an animation streamer
with a singing speech synthesizer derived from the one used in Robotic
Liberation (2003). Nominated for two scene.org awards categories ("Most
original concept", "Best demo on an oldskool platform").

The graphics and animations have been drawn with BS32, a "32-bit" successor
of the Brickshop editor (bs32.c) and converted into an optimized streamed
format with a separate tool (bs32conv.c). (Basically all s_*.asm come from
the converter).

The overall streaming schedule and memory/time-domain linking are handled by
Bob20, a Python-based linker-builder script. Bob20 automatically keeps track
of free memory areas at any given point of time. When working on Robotic
Liberation, I spent too much time for doing this manually, so I decided to
go for automation.

https://www.pouet.net/prod.php?which=51115
