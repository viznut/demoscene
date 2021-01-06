
!macro sAddrHOU .a {
  !byte (>.a)+$d0
  !byte <.a
}


!macro sAddr .a {
  !if .a<=$3ff {
    !byte (>.a)+$d0
  } else {
    !if .a<=$1fff {
      !byte (>.a)-$10+$c0
    } else {
      !byte (>.a)-$90+$d4
    }
  }
  !byte <.a
}

!macro s8bpc {
  !byte $e2,$00
}

!macro s4bpc {
  !byte $e2,$01
}

!macro s1bpc {
  !byte $e2,$ff
}

!macro sGoto .a {
  !byte $e0,<.a,>.a
}

!macro sClrscr .col,.ch {
  !byte $e4,.col,.ch
}
