#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
  if (argc !=3) {
    printf("Please specify ESSID and password\n");
    exit(1);
  }
  FILE *interfaces2;
  FILE *interfaces;
  char *essid;
  char *passwd;
  char interfaceLine[512];
  char netname[84] = "  wpa-ssid    ";
  char netpass[84] = "  wpa-psk     ";
  int lineNum = 1;
  int ch;

  essid = argv[1];
  passwd = argv[2];

// Attempt to open the interfaces2 file
  if ((interfaces2 = fopen("/etc/network/interfaces2", "r"))==NULL) {
    printf("Cannot open interfaces template");
    exit(1);
  }

// Attempt to associate interfaces2 with the new interfaces3 file
  if ((interfaces = fopen("/etc/network/interfaces", "w"))==NULL) {
    printf("Cannot create interfaces file");
    exit(1);
  }

//copy interfaces2
  fseek(interfaces2, 0, SEEK_SET);
  do {
    ch = fgetc(interfaces2);
    if (feof(interfaces2)) {
      break;
    }
    fputc(ch, interfaces);
  } while(1);

// Write new lines
      strcat(netname, "\"");
      strcat(netname, essid);
      strcat(netname, "\"");
      strcat(netname, "\n");
      printf("The new line reads %s\n<br>", netname);
      fputs(netname, interfaces);

      strcat(netpass, "\"");
      strcat(netpass, passwd);
      strcat(netpass, "\"");
      strcat(netpass, "\n");
      printf("The new line reads %s\n<br>", netpass);
      fputs(netpass, interfaces);

  fclose(interfaces2);
  fclose(interfaces);
}
