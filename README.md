# Bazel Monorepo Example

This repository demonstrates a multi-language monorepo setup using Bazel with Bzlmod support. It includes sample code and tests for Java, Kotlin, and Python.

## Project Structure

```
monorepo/
├── MODULE.bazel          # Bzlmod configuration
├── WORKSPACE.bazel       # Bazel workspace configuration
├── third_party/         # Third-party dependencies
│   └── requirements.txt  # Python dependencies
├── java/                # Java project
│   ├── BUILD.bazel
│   └── src/
│       ├── main/java/com/example/
│       │   └── Calculator.java
│       └── test/java/com/example/
│           └── CalculatorTest.java
├── kotlin/              # Kotlin project
│   ├── BUILD.bazel
│   └── src/
│       ├── main/kotlin/com/example/
│       │   └── StringUtils.kt
│       └── test/kotlin/com/example/
│           └── StringUtilsTest.kt
└── python/              # Python project
    ├── BUILD.bazel
    └── src/
        └── example/
            ├── calculator.py
            └── test_calculator.py
```

## Prerequisites

- Bazel 6.0 or later
- JDK 11 or later (for Java/Kotlin)
- Python 3.8 or later

## Project Components

### Java Project
A simple calculator implementation with basic arithmetic operations.
- Main class: `Calculator` with add, subtract, multiply, and divide operations
- Tests using JUnit 4

### Kotlin Project
String utility functions implementation.
- Main class: `StringUtils` with reverse, isPalindrome, and countWords functions
- Tests using Kotlin Test framework

### Python Project
A calculator implementation with basic arithmetic operations.
- Main class: `Calculator` with add, subtract, multiply, and divide operations
- Tests using pytest

## Building and Testing

### Build All Targets
```bash
bazel build //...
```

### Run All Tests
```bash
bazel test //...
```

### Language-Specific Commands

#### Java
```bash
# Build the calculator library
bazel build //java:calculator

# Run Java tests
bazel test //java:calculator_test
```

#### Kotlin
```bash
# Build the string utils library
bazel build //kotlin:string_utils

# Run Kotlin tests
bazel test //kotlin:string_utils_test
```

#### Python
```bash
# Build the calculator library
bazel build //python:calculator

# Run Python tests
bazel test //python:calculator_test
```

## Dependencies

The project uses the following major dependencies:

### Java
- JUnit 4.13.2 for testing

### Kotlin
- Kotlin 1.9.0
- Kotlin Test framework

### Python
- pytest 7.4.3 for testing

## Configuration Files

### MODULE.bazel
Contains Bzlmod configuration and dependencies:
- rules_java 7.3.0
- rules_kotlin 1.9.0
- rules_python 0.26.0
- JUnit 4.13.2
- Kotlin 1.9.0
- pytest 7.4.3

### WORKSPACE.bazel
Configures the build environment for all languages:
- Java toolchain and dependencies
- Kotlin toolchain and repositories
- Python toolchain and pip dependencies

### BUILD.bazel Files
Each language directory contains a BUILD.bazel file that defines:
- Library targets
- Test targets
- Dependencies between targets

## Adding New Code

When adding new code to this monorepo:

1. Create new source files in the appropriate language directory
2. Update the corresponding BUILD.bazel file
3. Add tests in the test directory
4. Run `bazel test //...` to verify everything works

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add or update tests as needed
5. Run `bazel test //...` to verify
6. Submit a pull request

## License

This project is open source and available under the MIT License. 