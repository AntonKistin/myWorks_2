#!/usr/bin/perl
#use strict;
#use warnings FATAL => 'all';

open F1, ">output.txt" or die "Ошибка открытия файла output.txt:$!";
opendir F2, "C:/file" or die $!;

my @masString;

print "В каталоге содержатся следующие файлы:", "\n";
while(my $fileName = readdir F2) {
    print $fileName, "\n";
    push @masString, $fileName;
}
closedir F2;

my $count;
my @countMas;

for(my $i=0; $i<$#masString+1; $i++){
    if(@masString[$i]=~m/\b.+\.txt\b/){
        open F3, "C:/file/$masString[$i]" or die "Ошибка открытия файла $masString[$i]:$!";
        @_ = <F3>;
        close F3 or die $!;

        $_ = join" ",@_;
        $_ = m/Computer/i;
        if($_>0){
            $countMas[$count] = $masString[$i];
            $count++;
        }
    }
}

print "\n", "Чтобы просмотреть список файлов, содержащих заданное слово, откройте файл output.txt";
print F1 "Файлы, в которых содержится заданное слово: ", "\n";
print F1 "@countMas", "\n";
print F1 "Колличество найденных слов:", "\n";
print F1 $count;
close F1 or die $!;
















