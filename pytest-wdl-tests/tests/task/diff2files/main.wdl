version 1.0

workflow main {
    input {
        String aStr
        String bStr
    }

    call gen2files {
        input:  aStr = aStr, bStr = bStr
    }

    call diff2files {
        input: a= gen2files.a, b= gen2files.b
    }

    output {
        Int result = diff2files.result
    }
}

task gen2files {
    input {
        String aStr
        String bStr
    }
    runtime {
        docker: "ubuntu:16.04"
    }
    command <<<
        echo "~{aStr}" > A.txt
        echo "~{bStr}" > B.txt
    >>>

    output {
        File a = "A.txt"
        File b = "B.txt"
    }
}

task diff2files {
    input {
        File a
        File b
    }

    runtime {
        docker: "ubuntu:16.04"
    }
    command {
        diff ${a} ${b} | wc -l
    }
    output {
        Int result = read_int(stdout())
    }
}
