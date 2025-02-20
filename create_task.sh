#!/bin/bash

# Function to create task structure for a given task ID
create_task_structure() {
    task_id=$1

    # Check if the task directory already exists
    if [ -d "tasks/$task_id" ]; then
        echo "Task $task_id already exists!"
        return 1
    fi

    echo "Creating structure for task ID: $task_id"

    # Create task directory
    mkdir -p tasks/$task_id/code
    mkdir -p tasks/$task_id/test
    mkdir -p tasks/$task_id/task_id

    # Create base files in src
    touch tasks/$task_id/code/A.java
    touch tasks/$task_id/code/B.java
    touch tasks/$task_id/code/C.java
    touch tasks/$task_id/code/base.java
    touch tasks/$task_id/code/solution.java
    touch tasks/$task_id/code/incorrect.java

    # Create test file
    touch tasks/$task_id/test/SolutionTest.java

    # download the test runner into the new task folder
    cd tasks/$task_id/
    wget https://raw.githubusercontent.com/AndreS1Turing/JavaCodeRunnerColab/refs/heads/main/run_tests.py
    echo "Task structure for $task_id created."
    echo "You may edit the code files, then run the tests."   
}

# Check if a task ID is provided, otherwise print usage instructions
if [ -z "$1" ]; then
    echo "Please provide a task ID to create the structure for (e.g., 303990)."
    exit 1
else
    create_task_structure $1
fi
