#!/bin/bash

# Script to install HMMER, prepare the HMM file, and run hmmscan

# Step 1: Install HMMER (requires sudo privileges)
echo "Installing HMMER..."
sudo apt update
sudo apt install -y hmmer

# Step 2: Prepare the HMM file for scanning (using hmmpress)
echo "Preparing the HMM file (PF01918.hmm)..."
hmmpress PF01918.hmm

# Step 3: Run hmmscan on the provided FASTA file
echo "Running hmmscan on 160505_wo_outliers_1.fasta using PF01918.hmm..."
hmmscan --tblout hmmscan_results PF01918.hmm 160505_wo_outliers_1.fasta

echo "hmmscan completed. Results saved in 'hmmscan_results'."
