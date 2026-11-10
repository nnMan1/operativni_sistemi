#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int x_glob = 12;

int main() {

    printf("PID pocetn=%d\n", getpid());
    fflush(stdout);
    char *argv[] = {"ps", "au", NULL};
    char *envp[] = {"LANG=C", NULL};
    // execve("/usr/bin/ps", argv, envp);
    execlp("ps", "ps", "au", NULL);
    perror("execve nije uspio\n");
    exit(1);
    

    return 0;
}