#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int x_glob = 12;

int main() {

    pid_t pid = getpid();
    pid_t ppid = getppid();

    printf("Pocetni PID: %d\n", pid);
    printf("Pocetni PPID: %d\n", ppid);

    pid_t n_pid = fork();

    int x_stack = 5;
    int *x_heap = malloc(sizeof(int));
    *x_heap = 14;


    if(n_pid < 0) {
        perror("Doslo je do greske prilikom kreiranja djeteta\n");
        exit(1);
    } else if(n_pid == 0) {
        printf("[DIJETE] PID: %d, PPID: %d N_PID: %d\n", getpid(), getppid(), n_pid);
        x_stack = 9;
        *x_heap = 13;
        x_glob = 1;
    } else  {
        printf("[RODITELJ] PID: %d, PPID: %d N_PID: %d\n", getpid(), getppid(), n_pid);
        wait(NULL);
    }

    printf("[%s]x_stack = %p %d\n", (n_pid ? "RODITELJ": "DIJETE"), &x_stack,  x_stack);
    printf("[%s]x_heap = %p %d\n", (n_pid ? "RODITELJ": "DIJETE"),  x_heap, *x_heap);
    printf("[%s]x_glob = %p %d\n", (n_pid ? "RODITELJ": "DIJETE"),  &x_glob, x_glob);
    printf("Kraj programa PID: %d\n", n_pid);

    return 0;
}