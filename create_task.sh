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
    
