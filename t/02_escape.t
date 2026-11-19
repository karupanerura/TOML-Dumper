use strict;
use warnings;
use Test::More 0.98;

use TOML::Dumper;

my $dumper = TOML::Dumper->new;

# https://github.com/karupanerura/TOML-Dumper/issues/1
# TOML basic strings must escape backslashes, and must not escape slashes
# (\/ is not a valid escape sequence in TOML).
is $dumper->dump({ foo => '1234/5678\910' }), 'foo = "1234/5678\\\\910"', 'reported case: slash stays, backslash is doubled';
is $dumper->dump({ foo => 'a\b' }), 'foo = "a\\\\b"', 'backslash is doubled';
is $dumper->dump({ foo => 'a/b' }), 'foo = "a/b"', 'slash is not escaped';

done_testing;
