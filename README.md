# Bazel Monorepo Example

This repository demonstrates a multi-language monorepo setup using Bazel with Bzlmod support. It includes sample code and tests for Java, Kotlin, and Python.

## Project Structure

```
monorepo/
├── MODULE.bazel          # Bzlmod configuration
├── WORKSPACE             # Bazel workspace configuration (hybrid approach)
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
- Tests using JUnit Jupiter 5.10.1

### Kotlin Project
String utility functions implementation.
- Main class: `StringUtils` with reverse, isPalindrome, and countWords functions
- Tests using Kotlin Test framework with JUnit 5

### Python Project
A calculator implementation with basic arithmetic operations.
- Main class: `Calculator` with add, subtract, multiply, and divide operations
- Tests using Python's built-in unittest framework

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
- JUnit Jupiter 5.10.1 for testing

### Kotlin
- Kotlin 1.9.0
- Kotlin Test framework with JUnit 5 integration

### Python
- Python's built-in unittest framework

## Configuration Files

### MODULE.bazel
Contains Bzlmod configuration for:
- Python rules (version 0.23.1)
- C++ rules (version 0.0.9)
- Java rules (version 7.1.0)
- JVM External rules (version 5.3)

### WORKSPACE
Currently using a hybrid approach during migration to Bzlmod:
- Maintains Kotlin rules (version 1.8.1, not yet fully supported in Bzlmod)
- Python rules (version 0.7.0 in WORKSPACE, but 0.23.1 in MODULE.bazel)
- Manages Maven dependencies for all languages (JUnit Jupiter, Kotlin Test)
- Will eventually be fully migrated to MODULE.bazel

## Bzlmod Migration Status

This project is in the process of migrating from WORKSPACE to Bzlmod (MODULE.bazel). We're using a hybrid approach where:

1. **MODULE.bazel** manages:
   - Python rules
   - C++ rules
   - Java rules
   - JVM External rules

2. **WORKSPACE** still manages:
   - Kotlin rules (not yet fully supported in Bzlmod)
   - Maven dependencies (to avoid conflicts during migration)

This hybrid approach allows us to incrementally migrate to Bzlmod while maintaining compatibility with all language components, especially Kotlin.

### Migration Benefits
- More modular dependency management
- Better version control
- Improved reproducibility
- Future-proof configuration

### Future Plans
- Complete migration to Bzlmod once Kotlin rules are better supported
- Move Maven dependencies to MODULE.bazel
- Eventually remove the WORKSPACE file entirely

## Adding New Code

When adding new code to this monorepo:

1. Create new source files in the appropriate language directory
2. Update the corresponding BUILD.bazel file
3. Add tests in the test directory
4. Run `bazel test //...` to verify everything works

## Code Formatting

This repository uses [buildifier](https://github.com/bazelbuild/buildtools/blob/master/buildifier/README.md) to format Bazel files (BUILD.bazel, WORKSPACE, and .bzl files) according to a standard style.

### Installing Buildifier

You can install buildifier in several ways:

#### Using Go
```bash
go install github.com/bazelbuild/buildtools/buildifier@latest
```

#### Using Homebrew (macOS)
```bash
brew install buildifier
```

### Using the Bazel Target

This repository includes a convenient Bazel target to format all Bazel files:

```bash
# Format all Bazel files in the repository
bazel run //:buildifier

# Check formatting without making changes (useful for CI)
bazel run //:buildifier.check
```

The buildifier target is integrated into the CI workflow to ensure consistent formatting across the codebase.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add or update tests as needed
5. Run `bazel test //...` to verify
6. Submit a pull request

## License

This project is open source and available under the MIT License. 