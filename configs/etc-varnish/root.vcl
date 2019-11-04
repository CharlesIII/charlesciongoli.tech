vcl 4.0;

# fake, never-used backend
# to silence the compiler
backend fake {
	.host = "0:0";
}
sub vcl_recv {
	if (req.http.host == "charlesciongoli.tech") {
		return (vcl(label-wordpress));
	} else if (req.http.host == "magento.charlesciongoli.tech") {
		return (vcl(label-magento));
	} else {
		return (synth(404));
	}
}
