#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int x_glob = 12;

int main() {

    pid_t pid = fork();

    if(pid==0) {
        printf("[DIJETE] PID=%d", getpid());
        char *argv[] = {"ls", "-l", "/tmp", NULL};
        char *envp[] = {"LANG=C", NULL};
        execve("/usr/bin/ls", argv, envp);
        perror("execve nije uspio\n");
        exit(1);
    }

    int status;
    waitpid(pid, &status, 0);
    printf("[RODITELJ] ls je zavrsio sa kodom %d\n", WEXITSTATUS(status));
    
    return 0;
}