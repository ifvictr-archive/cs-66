#include <cmath>
#include <iostream>
#include <map>
#include <vector>

std::vector<std::string> getStatusFlags(std::string eflag);
std::string hexToBin(std::string input);

std::string decToBin(int input);
int hexToDec(std::string input);

int main() {
    std::string eflag = "246";  // EFLAG hex value
    std::vector<std::string> enabledFlags = getStatusFlags(eflag);

    // Print all the enabled flags
    std::cout << "Enabled flags for hex value " << eflag << ": " << std::endl;
    for (std::vector<std::string>::iterator it = enabledFlags.begin();
         it != enabledFlags.end(); it++) {
        std::cout << *it << std::endl;
    }

    return 0;
}

std::vector<std::string> getStatusFlags(std::string eflag) {
    // Convert EFLAG hex value to a binary string
    std::string bits = hexToBin(eflag);

    // Map: <bit position, flag name>
    std::map<int, std::string> flags = {{0, "CF"}, {2, "PF"}, {4, "AF"},
                                        {6, "ZF"}, {7, "SF"}, {11, "OF"}};
    std::vector<std::string> enabledFlags;

    // Look through the bits to see if any flags are on
    for (std::map<int, std::string>::iterator it = flags.begin();
         it != flags.end(); it++) {
        try {
            int bitPos = bits.length() - 1 - it->first;  // From right side
            char bit = bits.at(bitPos);

            // If the flag bit is 1, include it in the list of enabled flags
            if (bit == '1') {
                enabledFlags.push_back(it->second);
            }
        } catch (const std::exception& e) {
            // Do nothing if the bit we're looking for is out of range
        }
    }

    return enabledFlags;
}

std::string hexToBin(std::string input) {
    int decimalValue = hexToDec(input);
    return decToBin(decimalValue);
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