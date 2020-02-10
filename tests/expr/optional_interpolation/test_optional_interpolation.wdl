version 1.0

workflow test_optional_interpolation_tf {
    input {
        String? maybe
    }

    call test_optional_interpolation {
        input:
            maybe = maybe
    }

    output {
        String out = test_optional_interpolation.out
    }
}

task test_optional_interpolation {
    input {
        String? maybe
    }

    command <<<
        echo ~{"hello " + maybe}
    >>>

    output {
        String out = read_string(stdout())
    }
}
