#!/usr/bin/perl

$z=8;

for($i=0;$i<128;$i++)
{
   $log = int(2*(2.0 ** ($i/16)));

   print "\n.byt " if(!($i&15));
   printf("%3d,",$log);

   $logtab[$i] = $log;
}
print "\n\n";

sub loglook
{
   for($x=0;$x<128;$x++)
   {
      if($logtab[$x]>=$_[0])
      {
         my $err = $logtab[$x]-$_[0];

         if(abs($logtab[$x-1]-$_[0]) <
            abs($logtab[$x]  -$_[0]))  { $x--; }

         return ($x,$logtab[$x]-$_[0]);
      }
   }
   return 999;
}

$robot=<<EOD3;
                         7777777777777777777777777777777
                        ffffffffffffffffffffffffffffffff
                       fffffffffffffffffffffffffffffffff
                      ffffffffffffffffffffffffffffffffff
                     ffffffffffffffffffffffffffffffffff
                    fffffffffffffffffffffffffffffffffff
                   fffffffffffffffffffffffffffffffffff 
                  777777777777777777777777777777777777
                 9999999999999999999999999999999999999   
                7777777777777777777777777777777777777      
               ffffffffffffffffffffff
              fffffffffffffffffffffffff
             ffffffffffffffffffffffffffff
            fffffffffffffffffffffffffffffffff
           ffffffffffffffffffffffffffffffffffffffffffffff
          fffffffffffffffffffffffffffffffffffffffffffffff
         ffffffffffffffffffffffffffffffffffffffffffffffff
        7777777777777777777777777777777777777777777777777
       99999999999999999999999999999999999999999999999999
  fffffffffffffffffffffffffffffffffffffffffffffffffffffff
  1111111111111111111111111111111111111111111111111111111
       111111111111111111111111111111111111111111111111
        111111111111111111111111111111111111111111111
        1111111111111111111111111111111111111111111   
        11111111111111111111111111111111111111111
       1111111111111111111111111111111111111111
  1111111111111111111111111111111111111111111
   ffffffffffffffffffffffffffffffffffffffff
    77777777777777777777777777777777777777777
     888888888888888888888888888888888888888888888888888
      77777777777777777777777777777777777777777777777777
       7777777777777777777777777777777777777777777777777
        777777777777777777777777777777777777777777777777
         77777777777777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777
           777777777777777777777777777777777777777777777
            11111111111111111111111111111111111111111111
             fffffffffffffffffffffffffffffffffffffffffff
              777777777777777777777777777777777777777777
                       2222222222222222222222222222222
                       aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                       aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                       aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  
                       aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  
                       aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                       aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  
                       aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  
                       2222222222222222222222222222222  
                       00000000000000000
                      7777777777777777777
                     fffffffffffffffffffff
                    fffffffffffffffffffffff
                     fffffffffffffffffffff
                      fffffffffffffffffff
                    77777777777777777777777
                   fffffffffffffffffffffffff
                  fffffffffffffffffffffffffff 
                 fffffffffffffffffffffffffffff
                  111111111111111111111111111
                   fffffffffffffffffffffffff
EOD3

$ltning=<<EOD2;

 99
 9999
 777777
 99999999
      99999
      9999999
      99999999
 9999999999999999
 77777777777777777
 9999999999999999999
         99999999999999
           88888888888888
             88888888888888
               22222222222222
                 22222222222222
                  200000000000000
                   0000000000000000
                    0000000000000000
                     00000000000000000
                      0000000000000000000
                       00000000000000000000
                        222222222222222222222
                        22222222222222222222222
                         88888888888888888888888 
                         8888888888888888888888          
                         999999999999999999999             
                         77777777777777777777              
                         7777777777777777777                    
                         777777777777777777               
                        999999999999999999                 
                        99999999999999999                
                       88888888888888888              
                      88888888888888888             
                     22222222222222222            
                    00000000000000000             
                   00000000000000000        
                  22222222222222222    
                 88888888888888888   
                88888888888888888  
               99999999999999999 
              99999999999999999
             7777777777777777
            777777777777777
          777777777777777777 
           999999999999999999   
            999999999999999999    
             888888888888888888     
              888888888888888888        
               222222222222222222          
                222222222222222222           
                 000000000000000000           
                  00000000000000000                 
                   0000000000000000              
                    000000000000000              
                     00000000000000            
                      0000000000000          
                       000000000000        
                       000000000000       
                      0000000000000      
                   0000000000000000
                 000000000000000000
               00000000000000000000
             0000000000000000000000
.
EOD2

$pic=<<EOD;
                       333333333333333333333
                    33333333333333333333333333
                  ccccccccccccccccccccccccccccccc
                ccccccccccccccccccccccccccccccccccc
              ccccccccccccccccccccccccccccccccccccccc
             33333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333
           cccccccccccccccccccccccccccccccccccccccccccc
          1111111111111111111111111111111111111111111111
         ccccccccccccccccccccccccccccccccccccccccccccccc
        ccccccccccccccccccccccccccccccccccccccccccccccccc
       33333333333333333333333333333333333333333333333333
      333333333333333333333333333333333333333333333333333
      cccccccccccccccccccccccccccccccccccccccccccccccccccc
     11111111111111111111111111111111111111111111111111111
     11111111111111111111111111111111111111111111111111111
    cccccccccccccccccccccccccccccccccccccccccccccccccccccc
    cccccccccccccccccccccccccccccccccccccccccccccccccccccc
   111111111111111111111111111111111111111111111111111111
   ccccccccccccccccccccccccccccccccccccccccccccccccccc
  ccccccccccccccccccccccccccccccccccccccccccccccccc
  ccccccccccccccccccccccccccccccccccccccccccccccc
  cccccccccccccccccccccccccccccccccccccccccccccc
  cccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccc
 cccccccccccccccccccccccccccccccccccccccccccccccc
 cccccccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
 cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
 cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
 ccccccccccccccccccccccccccccccccccccccccccccccccccccccc
  ccccccccccccccccccccccccccccccccccccccccccccccccccccc
  cccccccccccccccccccccccccccccccccccccccccccccccccccc
   ccccccccccccccccccccccccccccccccccccccccccccccccccc
   cccccccccccccccccccccccccccccccccccccccccccccccccc
   ccccccccccccccccccccccccccccccccc
    3333333333333333333333333333333333333333333333333
     cccccccccccccccccccccccccccccccc
      333333333333333333333333333333333                
             3333333333333333333333333
                    333333333333333333333333
                      cccccccccccccccccccccccccccccc
                        cccccccccccccccccccccccccccc
                         cccccccccccccccccccccccccc
                          11111111111111111111111111
                           1111111111111111111111111
                           cccccccccccccccccccccccc
                            ccccccccccccccccccccccc
                            11111111111111111111111
                            cccccccccccccccccccccc
                            ccccccccccccccccccccccc
                            3333333333333333333333
                             3333333333333333333
                               eeeeeeeeeeeeeeee
                                 eeeeeeeeeeeeee
                                   66666666666
                                     eeeeeeeee
                                       666666

                                       
EOD
################################## 34

$logmin=999; $logmax=0;

$xmid = 38;
$logthres = 38;

$j=0;
foreach(split("\n",$pic))
{
   $i=0; $min=999; $max=0;
   foreach(split('',$_))
   {
      if($_ ne ' ')
      {
         $min=$i if($i<$min);
         $max=$i; $col = $_;
         $col =~ tr/r*/a1/;
      }
      $i++;
   }
   print "Line $j: ";
   if($min>$max) { $w = $s = 0; $col = 0; }
   else { $s = $xmid-$min; $w=$max-$min; }
#   print "S=$s W=$w | LOG: ";

   ($sl,$serr) = &loglook($s);
   $sl -= $logthres;

   ($wl,$werr) = &loglook($w+$serr);
   $wl -= $logthres;

   print "S=$s (SL=$sl err $serr) W=$w (WL=$wl err $werr)\n";

#   print "$sl/$wl";

   if($sl>0) {
   if($sl<$logmin) { $logmin=$sl; }
   if($sl>$logmax) { $logmax=$sl; }
   } else { $sl=0; }

   if($wl>0) {
   if($wl<$logmin) { $logmin=$wl; }
   if($wl>$logmax) { $logmax=$wl; }
   } else { $wl=0; }

#   print " col $col\n";

   if($j<64) {

   $pic_c = '$'.$col."0, $pic_c";
   $pic_w = "$wl, $pic_w";
   $pic_s = "$sl, $pic_s"; }

   $j++;
}
print "$j lines generated\n\n";

print "\n\npic_c $pic_c\n\npic_w $pic_w\n\npic_s $pic_s\n\n";

print "Logarithms between $logmin .. $logmax\n\n";
