#!/usr/bin/perl
#use strict;
#use warnings FATAL => 'all';

open F1, "<input.java" or die "Ошибка открытия файла input.java:$!";
open F2, ">output.java" or die "Ошибка открытия файла output.java:$!";

@_ = <F1>;
close F1 or die $!;

$_ = join" ",@_;

print "Исходный файл: ", "\n", $_;

my @masKeywords = ('byte', 'short', 'int', 'long', 'float', 'char', 'boolean', 'double');

$_=~s/\/\*.*?\*\///g;
$_=~s/\/\/.*?\n//g;

$_=~tr/ //s;
$_=~tr/\n\t\r//d;

my $firstString = $_;

my @classNames = m/class\s+\b[a-zA-Z_]\w*\b[\{\n ]/g;

my $classString = join" ",@classNames;
$classString=~s/class//g;
#print $classString;
$_ = $classString;

@classNames = m/\b[a-zA-Z_]\w*\b/g;
$_ = $firstString;

foreach my $i (0..$#classNames)
{
    my $classNamesRename = "CS".$i;
    push @masKeywords, $classNamesRename;
    $_=~s/\b@classNames[$i]\b/$classNamesRename/g;
}

my @myString;
my $secodString = $_;

foreach my $i (0..$#masKeywords)
{
    push @myString, m/$masKeywords[$i]\s.+?;/sg;
}

my $idTypeName = join" ", @myString;
foreach my $i (0..$#masKeywords) {
    $idTypeName=~s/\b$masKeywords[$i]\b//g;
}

$_ = $idTypeName;

my @masID = m/\b[a-zA-Z_]\w*\b/g;

foreach my $i (0..$#masID)
{
    my $masIDRename = "_".$i;
    $secodString=~s/\b@masID[$i]\b/$masIDRename/g;
}

print "Результат: ", "\n", $secodString;
print F2 "$secodString";
close F2 or die $!;
