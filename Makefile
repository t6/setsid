CFLAGS+=	-DHAVE_ERR_H -DHAVE_NANOSLEEP

setsid: setsid.o

setsid.1: setsid.1.adoc
	asciidoctor -b manpage setsid.1.adoc
