#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int x_glob = 12;

int main() {

    for(int i=0;i<5;i++) {
        pid_t pid = fork();
        if(pid == 0) {
            sleep(5-i);
            printf("Dijete %d (PID %d) radi %d sekundi\n", i, getpid(), 5-i);
            exit(i);
        }
    }

    int status;
    pid_t pid;

    while((pid = wait(&status)) > 0) {
        printf("Zavrsio PID=%d, kod%d\n", pid, WEXITSTATUS(status));
    }
    return 0;
}