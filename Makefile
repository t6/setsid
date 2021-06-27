BSD_INSTALL_DATA?=	install -m 0644
BSD_INSTALL_MAN?=	install -m 444
BSD_INSTALL_PROGRAM?=	install -s -m 555

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
MANDIR?=	${PREFIX}/share/man/man1
BASHCOMPDIR?=	${PREFIX}/share/bash-completion/completions

CFLAGS+=	-DHAVE_ERR_H -DHAVE_NANOSLEEP

all: setsid setsid.1

setsid: c.h setsid.o

setsid.1: setsid.1.adoc
	asciidoctor -b manpage setsid.1.adoc

install: setsid setsid.1
	@mkdir -p ${DESTDIR}${BINDIR} ${DESTDIR}${MANDIR} ${DESTDIR}${BASHCOMPDIR}
	${BSD_INSTALL_PROGRAM} setsid ${DESTDIR}${BINDIR}
	ln ${DESTDIR}${BINDIR}/setsid ${DESTDIR}${BINDIR}/ssid
	${BSD_INSTALL_MAN} setsid.1 ${DESTDIR}${MANDIR}
	${BSD_INSTALL_DATA} bash-completion/setsid ${DESTDIR}${BASHCOMPDIR}
