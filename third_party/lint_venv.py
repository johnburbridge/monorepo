#!/usr/bin/env python3
"""Script to create a Python virtual environment and install linting tools.
This script is used by Bazel to create a virtual environment with pylint and black."""

import os
import subprocess
import sys
import venv
from pathlib import Path


def main():
    """Create a virtual environment and install linting tools."""
    # Use a directory in the project root, not in the Bazel sandbox
    repo_root = (
        os.path.abspath(os.path.join(os.getcwd(), os.pardir))
        if "RUNFILES_DIR" in os.environ
        else os.getcwd()
    )
    venv_dir = Path(repo_root) / "lint_venv"

    # Create the virtual environment if it doesn't exist
    if not venv_dir.exists():
        print(f"Creating virtual environment at {venv_dir}...")
        venv.create(venv_dir, with_pip=True)

    # Get the path to the virtual environment's Python executable
    if sys.platform == "win32":
        python_executable = venv_dir / "Scripts" / "python.exe"
        pip_executable = venv_dir / "Scripts" / "pip.exe"
    else:
        python_executable = venv_dir / "bin" / "python"
        pip_executable = venv_dir / "bin" / "pip"

    # Make sure the paths are absolute
    python_executable = python_executable.absolute()
    pip_executable = pip_executable.absolute()

    # Find the requirements.txt file
    requirements_path = None
    possible_paths = [
        Path(repo_root) / "third_party" / "requirements.txt",
        Path(os.environ.get("RUNFILES_DIR", "."))
        / "monorepo"
        / "third_party"
        / "requirements.txt",
        Path("third_party") / "requirements.txt",
        Path("requirements.txt"),
    ]

    for path in possible_paths:
        if path.exists():
            requirements_path = path
            break

    if not requirements_path:
        print("Error: Could not find requirements.txt")
        print(f"Searched in: {[str(p) for p in possible_paths]}")
        sys.exit(1)

    # Install the requirements
    print(f"Installing requirements from {requirements_path}...")
    try:
        subprocess.run(
            [str(pip_executable), "install", "-r", str(requirements_path)],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
        )
        print("Successfully installed required packages")
    except subprocess.CalledProcessError as e:
        print(f"Error installing packages: {e}")
        print(f"Command output: {e.output}")
        sys.exit(1)
    except FileNotFoundError:
        print(f"Error: Could not find pip at {pip_executable}")
        print("The virtual environment may not have been created correctly.")
        sys.exit(1)

    # Print the path to the virtual environment
    print(f"\nVirtual environment created at: {venv_dir.absolute()}")
    print(f"Python executable: {python_executable}")
    print("\nTo use pylint and black, activate the virtual environment with:")
    if sys.platform == "win32":
        print(f"  {venv_dir}\\Scripts\\activate")
    else:
        print(f"  source {venv_dir}/bin/activate")

    print("\nOr run them directly with:")
    if sys.platform == "win32":
        print(f"  {venv_dir}\\Scripts\\pylint.exe [files]")
        print(f"  {venv_dir}\\Scripts\\black.exe [files]")
    else:
        print(f"  {venv_dir}/bin/pylint [files]")
        print(f"  {venv_dir}/bin/black [files]")


if __name__ == "__main__":
    main()
