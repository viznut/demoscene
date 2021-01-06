#!/usr/bin/perl

$data.=$_ while(<>);
@d=split('',$data);

$loadaddr = ord($d[0])+256*ord($d[1]);
$execaddr = $d[7]*1000+
            $d[8]*100+
            $d[9]*10+
            $d[10];

printf (".word \$%04X\n*=\$%04X\noldstart=\$%04X\n\n",
   $loadaddr,$loadaddr,$execaddr);
printf ('.byt $%02X,$%02X,$%02X,$%02X,$%02X',
        ord($d[2]),ord($d[3]),ord($d[4]),ord($d[5]),ord($d[6]));
print <<EOD;

.byt \$30+(mcstart/1000)
.byt \$30+((mcstart-(mcstart/1000)*1000)/100)
.byt \$30+((mcstart-(mcstart/100) *100) /10)
.byt \$30+((mcstart-(mcstart/10)  *10)  /1)
EOD
$j=0;
for($i=11;$i<=$#d;$i++)
{
   if($j==0) { print "\n.byt "; }
   printf '$%02X',ord($d[$i]);
   if(($j<16) && ($i!=$#d)) { print ','; $j+=1; } else { $j=0; }
}
print "\n";
