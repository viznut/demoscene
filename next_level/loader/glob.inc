loader_base=879 ; 800 ; MAAH 879 ; takes 145 bytes
driveside_base=$0500

!zone macros
!macro AXSabs .axst {
   !byte $8f
   !word .axst
}

!macro ASO0 .asot {
   !byte $07,.asot
}

!macro wait .clocks {   ; safe with 14..80
   jsr wait14-(.clocks-14)
}

!macro nocross .length {
  !if ((*&255)>255-.length) {
     !align $ff,0
  }
}

!macro ANCI .imm {
    !byte $0b,.imm
;    and #.imm
}
