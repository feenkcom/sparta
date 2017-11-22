initialization
defaultHelp
	| email github |

	email := 'YWxleC5zeXJlbEBnbWFpbC5jb20=' base64Decoded asText allBold.
	github := 'https://github.com/syrel/Sparta/issues' asText allBold.

	^ '
Unknown error... Please copy the whole text
 - and send it to ' asText, email,'
 - or open a bug report ', github