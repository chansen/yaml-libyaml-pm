use t::TestYAMLTests tests => 1;

my $yaml = <<"...";
---
bar: \xC3\xB6
baz: \xE2\x98\xBA
foo: \xC3\xB6
...

my $hash = {
    foo => "\xF6",     # LATIN SMALL LETTER O WITH DIAERESIS U+00F6
    bar => "\xC3\xB6", # LATIN SMALL LETTER O WITH DIAERESIS U+00F6 (UTF-8)
    baz => "\x{263A}", # WHITE SMILING FACE
};

is Dump($hash), $yaml, 'Dumping native characters works';

