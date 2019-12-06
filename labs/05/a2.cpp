#include <iostream>

int main() {
    int valR;
    int valX = 10;
    int valY = 2;
    int valZ = 8;
    valR = valX - (-valY + valZ);  // Should be 4
    std::cout << valR << std::endl;

    return 0;
}