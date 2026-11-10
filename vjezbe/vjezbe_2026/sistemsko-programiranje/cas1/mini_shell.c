#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>

int x_glob = 12;

int main() {

    char linija[256];

    while(1) {
        printf("mini-shell> ");
        fflush(stdout);

        if(fgets(linija, 256, stdin) == NULL) break;

        char *argv[50];
        int argc = 0;
        
        char *rijec = strtok(linija, " \t\r\n");
        while(rijec != NULL && argc < 49) {
            argv[argc++] = rijec;
            rijec = strtok(NULL, " \t\r\n");
        }
        argv[argc] = NULL;
        if(strcmp(argv[0], "exit") == 0)  break;

        pid_t pid = fork();

        if(pid == 0) {
            execvp(argv[0], argv);
            perror("Greska u pokretanju");
            exit(127);
        }

        int status;
        waitpid(pid, &status, 0);
        printf("PID:%d kod%d\n", pid, WEXITSTATUS(status));
    }
    

    return 0;
}