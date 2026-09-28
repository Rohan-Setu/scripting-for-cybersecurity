#!/bin/bash

CASE_DIR="case/"
REPORT="triage-report-auto.txt"
PYTHON=$(find "$CASE_DIR" -type f -name "*.py" | wc -l)
SHELL=$(find "$CASE_DIR" -type f -name "*.sh" | wc -l)
read -p "Enter your name and case refrence: " ANALYST CASE_REF

echo "File Triage Report by: $ANALYST, Refrence: $CASE_REF, DATE: $(date)" > "$REPORT"
echo "
Total Files: $(find $CASE_DIR -type f | wc -l)
Total Directories $(find $CASE_DIR -type d | wc -l)
Python Files: $PYTHON
Shell Scripts: $SHELL
Log Files: $(find "$CASE_DIR" -type f -name "*.log" | wc -l)
Configuration Files: $(find "$CASE_DIR" -type f -name "*.conf" | wc -l)
Empty Files: $(find "$CASE_DIR" -type f -size 0)
Archives: $(find "$CASE_DIR" -type f -name "*.zip")

Files Containing admin: $(grep -rl admin)

Detected File Types in Evidence: $(file $CASE_DIR/evidence/*)

Scripts (Python + shell): $((PYTHON + SHELL))
" >> $REPORT
