version 1.0

workflow test_stderr {
    input {
        String wf_in_str
    }

    call echo_task { input: in_str = wf_in_str }

    output {
        String out_str = read_string(echo_task.out_file)
    }
}

task echo_task {
    runtime {
        docker: "ubuntu:latest"
    }

    input {
        String in_str
    }

    command <<<
        echo ~{in_str} 1>&2
    >>>

    output {
        File out_file = stderr()
    }
}