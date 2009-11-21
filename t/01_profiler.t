use strict;
use Apache::Test;
use Apache::TestRequest;
use FileHandle;

plan tests => 2, have_lwp;

my $body = GET_BODY "/test.html";
ok($body, qr/test/);

my $log = cat_file("logs/error_log");
ok($log, qr/uri: .* takes .* seconds/);

sub cat_file {
    my $fh = FileHandle->new(shift) or return;
    local $/;
    return <$fh>;
}


