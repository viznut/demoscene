#!/usr/bin/perl

$tempbin = 'TEMP%d.prg';
$tempsrc = 'TEMP.a65';

$assembler = '/opt/bin/acme';
$converter = '../utils/prg2vizldr';

$index=0;

$cmd1 = "$converter ";

sub compile
{
   my $code = shift;
   my $bin  = '';

   return if(length($code)<1);

   open(G,">$tempsrc");
   print G $code;
   close G;

   my $cmd0  = "$assembler $tempsrc";
#   my $errors = `$cmd0`;  || die "ERROR when running $cmd0";
   system($cmd0) && die "ERROR when running $cmd0";

#   my $cmd1  = "$converter $tempbin >> $target";

#   if($errs)
#   {
#      print "While compiling from $srcfname, '$cmd0' said:\n$errs\n";
#      exit 1;
#   }
}

sub readsource
{
      $srcfname = shift;
   my $f = '';
   my $linenum = 0;

   print "Compiling $srcfname\n";

   open(F,$srcfname);

   while(<F>)
   {
      if(substr($_,0,4) eq '#BLK')
      {
         my @op = split(' ',$_);
         my $l = 0;

         my $binname = sprintf($tempbin,$index++);

         &compile($f);
         if($op[0] eq '#BLKV') { $cmd1 .= " +$binname"; }
      elsif($op[0] eq '#BLKF') { $cmd1 .= " :$binname"; }
                         else  { $cmd1 .=  " $binname"; }

         $f = "\n" x $linenum;  # ... jotta saadaan errorit oikeille riveille

         $f ="!to \"$binname\",cbm\n"; $l++;
         if($#op>=1) { $f.='*='.$op[1]."\n"; $l++; }

         $f .= ($linenum-$l) x "\n" if($linenum>$l);
      }
      else
      {
         $f.=$_;
      }

      $linenum++;
   }

   &compile($f);

   close F;
}

# args: first TARGETFILE, then SOURCEFILES

$target = shift @ARGV or die 'Target filename missing';
foreach(@ARGV)
{
   &readsource($_);
}

$cmd1 = "$cmd1 >> $target";
print "Running: $cmd1\n";
`$cmd1`;

# `rm -f TEMP*.*`;


# tarvitaan vielä: #V 0x9000 0xa000
#                  prg2vizldr -1e00:1fff
#                  asettaa alueen määrittelemättömäksi
#		   voidaan myös asettaa fillatuksi: -1e00:1fff:00

