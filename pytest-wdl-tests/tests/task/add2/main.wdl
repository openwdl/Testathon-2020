version 1.0

workflow main {
    input {
        Int a
        Int b
    }

    call add {
        input: a=a, b=b
    }

    output {
        Int result = add.result
    }
}

task add {
    input {
        Int a
        Int b
    }

    runtime {
        docker: "ubuntu:16.04"
    }

    command {
        echo $((${a} + ${b}))
    }

    output {
        Int result = read_int(stdout())
    }
}
