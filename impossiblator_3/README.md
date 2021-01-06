# Impossiblator 3 (2007)

A multipart demo for the unexpanded VIC-20.

The new technique in this one is the "floating bus" used in the stretcher
part and the greetings part.

"Floating bus" (or "forced fetch") in short: When the video chip reads from
a memory address that is not connected to actual memory, it will read a
"floating byte", i.e. the last byte left on the data bus by the CPU. This
effectively makes it possible to force the video chip to fetch arbitrary
bytes at arbitrary screen locations.

The piece of C code under ff/ generates the pieces of machine code that feed
the individual lines of the stretching bitmap to the video chip in
stretch.asm.

https://www.pouet.net/prod.php?which=31537
