#include <cmath>
#include <iostream>

int binToDec(std::string input);
std::string decToBin(int input);
int octToDec(std::string input);
std::string decToOct(int input);
int hexToDec(std::string input);
std::string decToHex(int input);
std::string add(std::string a, std::string b, int base);

int main() {
    // Test binary methods
    std::cout << "binToDec(\"11111111\") => " << binToDec("11111111")
              << " = 255" << std::endl;
    std::cout << "decToBin(255) => " << decToBin(255) << " = 11111111"
              << std::endl;

    // Test octal methods
    std::cout << "octToDec(\"377\") => " << octToDec("377") << " = 255"
              << std::endl;
    std::cout << "decToOct(255) => " << decToOct(255) << " = 377" << std::endl;

    // Test hexadecimal methods
    std::cout << "hexToDec(\"FF\") => " << hexToDec("FF") << " = 255"
              << std::endl;
    std::cout << "decToHex(255) => " << decToHex(255) << " = FF" << std::endl;

    // Test add methods to see if they equal 64 (base 10)
    // Binary
    std::cout << "add(\"100000\", \"100000\", 2) => "
              << add("100000", "100000", 2) << " = 1000000" << std::endl;
    // Octal
    std::cout << "add(\"40\", \"40\", 8) => " << add("40", "40", 8) << " = 100"
              << std::endl;
    // Decimal
    std::cout << "add(\"32\", \"32\", 10) => " << add("32", "32", 10) << " = 64"
              << std::endl;
    // Hexadecimal
    std::cout << "add(\"20\", \"20\", 16) => " << add("20", "20", 16) << " = 40"
              << std::endl;

    return 0;
}

int binToDec(std::string input) {
    int output = 0;
    // Iterate over all bits starting from right side
    for (int i = 0; i < input.length(); i++) {
        int pos = input.length() - 1 - i;
        char currentBit = input.at(pos);

        if (currentBit == '1') {
            output += std::pow(2, i);
        }
    }

    return output;
}

std::string decToBin(int input) {
    std::string output = "";

    int currentValue = input;
    while (currentValue > 0) {
        int remainder = currentValue % 2;

        // Prepend converted value and get quotient
        output = std::to_string(remainder) + output;
        currentValue = currentValue / 2;
    }

    return output;
}

int octToDec(std::string input) {
    int output = 0;
    // Iterate over all bits starting from right side
    for (int i = 0; i < input.length(); i++) {
        int pos = input.length() - 1 - i;
        char currentBit = input.at(pos);
        int decimalValue = currentBit - '0';

        output += std::pow(8, i) * decimalValue;
    }

    return output;
}

std::string decToOct(int input) {
    std::string output = "";

    int currentValue = input;
    while (currentValue > 0) {
        int remainder = currentValue % 8;

        // Prepend converted value and get quotient
        output = std::to_string(remainder) + output;
        currentValue = currentValue / 8;
    }

    return output;
}

int hexToDec(std::string input) {
    int output = 0;
    // Iterate over all hex characters starting from right side
    for (int i = 0; i < input.length(); i++) {
        int pos = input.length() - 1 - i;
        char currentBit = std::toupper(input.at(pos));

        int decimalValue = 0;
        if (currentBit >= '0' && currentBit <= '9') {
            // Is 0–9
            decimalValue = currentBit - '0';
        } else if (currentBit >= 'A' && currentBit <= 'F') {
            // Is A–F
            decimalValue = 10 + (currentBit - 'A');
        }

        output += std::pow(16, i) * decimalValue;
    }

    return output;
}

std::string decToHex(int input) {
    std::string output = "";

    int currentValue = input;
    while (currentValue > 0) {
        int remainder = currentValue % 16;

        // Get hex representation
        char hexValue;
        if (remainder < 10) {
            hexValue = '0' + remainder;
        } else {
            hexValue = 'A' + (remainder - 10);
        }

        // Prepend converted value and get quotient
        output = hexValue + output;
        currentValue = currentValue / 16;
    }

    return output;
}

std::string add(std::string a, std::string b, int base) {
    // If it's base 10, just handle it here
    if (base == 10) {
        int sum = std::stoi(a) + std::stoi(b);
        return std::to_string(sum);
    }

    // Select conversion functions according to base
    std::function<int(std::string)> toDec;
    std::function<std::string(int)> fromDec;
    switch (base) {
        case 2:
            toDec = binToDec;
            fromDec = decToBin;
            break;
        case 8:
            toDec = octToDec;
            fromDec = decToOct;
            break;
        // Not working
        // case 10:
        //     toDec = std::stoi;
        //     fromDec = std::to_string;
        //     break;
        case 16:
            toDec = hexToDec;
            fromDec = decToHex;
            break;
    }

    // Convert to decimal for adding, then return in desired base
    int sum = toDec(a) + toDec(b);
    return fromDec(sum);
}