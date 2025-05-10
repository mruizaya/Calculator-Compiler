# Calculator-Compiler
Created a compiler that evaluates expressions written in decimal, binary, or Roman numerals.

## 🛠️ How to Build and Run

Make sure you have **Flex**, **Bison**, and **GCC** installed on your Linux system:

```bash
sudo apt-get update
sudo apt-get install flex bison build-essential
```
🔢 Decimal Calculator
```bash
bison -d decimal_calc.y
flex decimal_calc.l
gcc -o decimal_calc lex.yy.c decimal_calc.tab.c -lfl
./decimal_calc
```
🔁 Binary Calculator
```bash
bison -d binary_calc.y
flex binary_calc.l
gcc -o binary_calc lex.yy.c binary_calc.tab.c -lfl
./binary_calc  
```
🏛 Roman Numeral Calculator
```bash
bison -d roman_calc.y
flex roman_calc.l
gcc -o roman_calc lex.yy.c roman_calc.tab.c -lfl
./roman_calc
```
