version 1.0

workflow test_call_input_block_overrides_previous_input {
  input {
    Int wfl_inp = 10

    # This input `my_task_int_in` is usually based on a task output, unless it's overridden in the input set:
    Int my_task_int_in = some_preliminary_task.int_out
  }

  call some_preliminary_task
  call my_task { input: my_task_int_in = wfl_inp }

  output {
    Int out = my_task.int_out
  }
}

task my_task {
    runtime {
        docker: "ubuntu:latest"
    }

    input {
        Int my_task_int_in
    }

    command <<<
        # NOOP
    >>>

    output {
        Int int_out = my_task_int_in
    }
}

task some_preliminary_task {
    runtime {
        docker: "ubuntu:latest"
    }

    command <<<
        # NOOP
    >>>

    output {
        Int int_out = 1
    }
}

