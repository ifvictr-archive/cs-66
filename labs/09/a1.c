#include <stdio.h>
#include <time.h>

int fib(int n);

int main() {
    const int COUNT = 45;
    // Start timing
    clock_t startTime = clock();
    for (int i = 0; i < COUNT; i++) {
        printf("%d\n", fib(i));
    }
    clock_t stopTime = clock();
    // See how long fib loop took to finish
    double elapsed = (double)(stopTime - startTime) * 1000.0 / CLOCKS_PER_SEC;
    printf("fib took %f ms to execute\n", elapsed);

    return 0;
}

int fib(int n) {
    if (n <= 1) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}