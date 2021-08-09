//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	10,		0},
	{"", "./dwm_pulse.sh",						0,		2},
	{"", "./dwm_keyboard.sh",					0,		1},
	{"", "date +'%b/%d/%Y %H:%M'",					10,		0},
	
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 2;
