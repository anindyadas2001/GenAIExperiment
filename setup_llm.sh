#!/bin/bash

# Prerequisite 1: Update and upgrade system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install Python and pip
echo "Installing Python and pip..."
sudo apt install python3 python3-pip -y

# Install virtual environment package
echo "Installing virtual environment package..."
sudo apt install python3-venv -y

# Create a virtual environment
echo "Creating a virtual environment..."
python3 -m venv llm_env

# Activate the virtual environment
source llm_env/bin/activate

# Install necessary Python packages
echo "Installing dependencies in virtual environment..."
pip install torch torchvision torchaudio transformers jupyter

# Confirm installation of Jupyter and transformers
echo "Installation complete!"
echo "Virtual environment 'llm_env' is ready and activated."
echo "You can now run Jupyter Notebook by using 'jupyter notebook' command within this virtual environment."

# Instructions for running download_llm.py
echo -e "\nTo proceed:"
echo "1. Keep the virtual environment activated by staying in this terminal session or reactivating with 'source llm_env/bin/activate'."
echo "2. Run the 'download_llm.py' script by entering:"
echo "   python3 download_llm.py"
echo "Enjoy using your LLM setup!"
