# SENG440_RSA

A Project that does 64-bit RSA encryption. 

This code is for the Software Engineering 440 Course at the University of Victoria. 
This is not a cryptographically secure implementation of RSA to be used by real people. 
This project is meant to demonstrate embedded systems software optimizations, such as
implementing [Montgomery modular multiplication](https://en.wikipedia.org/wiki/Montgomery_modular_multiplication), 
compiling with optimizing flags, and other clever optimizations to run on low-power hardware. 

## To build the project and run the tests: 
1. Make a build directory and cd into it 
```
mkdir build && cd build
```
2. make sure you have cmake installed
```
cmake --version
```
2.1. If you do not have cmake, install it 
```
dnf install -y cmake
```
3. cmake the project configuration and generate build system
```
cmake ../
```
4. cmake build the project
```
cmake --build .
```
5. run the project (this executes the unit tests)
```
./RSA
```