
/*	$Id: menusharer.r 355 2005-01-11 22:48:55Z andreradke $    */

data 'WIND' (128, "main window") {
	$"0064 00AA 00BE 01D6 0000 0000 0000 0000"            /* .d.�.�.�........ */
	$"0000 184D 656E 7520 5368 6172 696E 6720"            /* ...Menu Sharing  */
	$"5465 7374 2057 696E 646F 7758"                      /* Test WindowX */
};

data 'MENU' (128, "Apple") {
	$"0080 0000 0000 0000 0000 FFFF FFFB 0114"            /* .�........����.. */
	$"1141 626F 7574 204D 656E 7553 6861 7265"            /* .About MenuShare */
	$"72C9 0000 0000 012D 0000 0000 00"                   /* r�.....-..... */
};

data 'MENU' (129, "File") {
	$"0081 0000 0000 0000 0000 FFFF FFFF 0446"            /* .�........����.F */
	$"696C 6504 5175 6974 0051 0000 00"                   /* ile.Quit.Q... */
};

data 'SIZE' (-1) {
	$"58E0 0006 0000 0006 0000"                           /* X�........ */
};

data 'DITL' (262, "About Command") {
	$"0002 0000 0000 004E 0014 0062 0050 0402"            /* .......N...b.P.. */
	$"4F4B 0000 0000 000A 0020 002A 0040 A002"            /* OK.....�. .*.@�. */
	$"0001 0000 0000 000A 006E 004C 0176 8869"            /* .......�.n.L.v�i */
	$"4D65 6E75 5368 6172 6572 2069 7320 6120"            /* MenuSharer is a  */
	$"7369 6D70 6C65 2074 6573 7462 6564 2066"            /* simple testbed f */
	$"6F72 2020 5573 6572 4C61 6E64 D573 204D"            /* or  UserLand�s M */
	$"656E 7520 5368 6172 696E 6720 7072 6F74"            /* enu Sharing prot */
	$"6F63 6F6C 2E20 0D0D A920 3139 3931 2D39"            /* ocol. ..� 1991-9 */
	$"3420 5573 6572 4C61 6E64 2053 6F66 7477"            /* 4 UserLand Softw */
	$"6172 652C 2049 6E63 2E00"                           /* are, Inc.. */
};

data 'DITL' (261, "Requires System 7") {
	$"0002 0000 0000 004E 0014 0062 0050 0402"            /* .......N...b.P.. */
	$"4F4B 0000 0000 000A 0020 002A 0040 A002"            /* OK.....�. .*.@�. */
	$"0000 0000 0000 000A 006E 004C 0176 8839"            /* .......�.n.L.v�9 */
	$"5468 6973 2061 7070 6C69 6361 7469 6F6E"            /* This application */
	$"2072 6571 7569 7265 7320 4D61 6369 6E74"            /*  requires Macint */
	$"6F73 6820 5379 7374 656D 2037 2E30 206F"            /* osh System 7.0 o */
	$"7220 6869 6768 6572 2E00"                           /* r higher.. */
};

data 'DITL' (263, "Script Error") {
	$"0002 0000 0000 0060 00FC 0074 0138 0402"            /* .......`.�.t.8.. */
	$"4F4B 0000 0000 000C 003C 004E 0136 8802"            /* OK.......<.N.6�. */
	$"5E30 0000 0000 000C 000C 002C 002C A002"            /* ^0.........,.,�. */
	$"0000"                                               /* .. */
};

data 'ALRT' (262, "About Command") {
	$"0058 0082 00D0 0216 0106 5555 8060"                 /* .X.�.�....UU�` */
};

data 'ALRT' (261, "Requires System 7") {
	$"0040 0038 00AC 01A4 0105 5555 0000"                 /* .@.8.�.�..UU.. */
};

data 'ALRT' (263, "Script Error") {
	$"003C 003E 00BC 0182 0107 5555 0000"                 /* .<.>.�.�..UU.. */
};

data 'vers' (2) {
	$"0303 8000 0000 0533 2E30 2E33 2544 656D"            /* ..�....3.0.3%Dem */
	$"6F20 4672 6F6E 7469 6572 D573 204D 656E"            /* o Frontier�s Men */
	$"7520 5368 6172 696E 6720 5072 6F74 6F63"            /* u Sharing Protoc */
	$"6F6C"                                               /* ol */
};

data 'vers' (1) {
	$"0400 6002 0000 0534 2E30 6232 2934 2E30"            /* ..`....4.0b2)4.0 */
	$"6232 2E20 A931 3939 312D 3139 3936 2055"            /* b2. �1991-1996 U */
	$"7365 724C 616E 6420 536F 6674 7761 7265"            /* serLand Software */
	$"2C20 496E 632E"                                     /* , Inc. */
};
