help
windowsHelp
	| link |

	link := 'https://www.microsoft.com/en-us/download/details.aspx?id=52685' asText allBold.

	^ '
Please, install Microsoft Visual C++ 2015 Redistributable and try again:
' asText, link, String cr