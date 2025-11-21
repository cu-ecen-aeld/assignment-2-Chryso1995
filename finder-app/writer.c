#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    // Setup syslog - LOG_USER facility
    openlog("writer", LOG_PID, LOG_USER);

    // Check argument count
    if (argc != 3)
    {
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc - 1);
        fprintf(stderr, "Error: Two arguments required.\nUsage: %s <writefile> <writestr>\n", argv[0]);
        closelog();
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Attempt to open file
    FILE *file = fopen(writefile, "w");
    if (file == NULL)
    {
        syslog(LOG_ERR, "Error opening file: %s", writefile);
        fprintf(stderr, "Error: Could not open file '%s'.\n", writefile);
        closelog();
        return 1;
    }

    // Write string to file
    if (fputs(writestr, file) == EOF)
    {
        syslog(LOG_ERR, "Error writing to file: %s", writefile);
        fprintf(stderr, "Error: Could not write to file '%s'.\n", writefile);
        fclose(file);
        closelog();
        return 1;
    }

    // Log success message using DEBUG level
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    fclose(file);
    closelog();
    return 0;
}

