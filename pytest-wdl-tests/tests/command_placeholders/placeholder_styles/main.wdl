version 1.0

workflow main {
    call curly_style_command
    call angles_style_command
    output {
        String curly_tilde_interpolated = curly_style_command.tilde_interpolation
        String curly_dollar_interpolated = curly_style_command.dollar_interpolation

        String angles_tilde_interpolated = angles_style_command.tilde_interpolation
        String angles_dollar_interpolated = angles_style_command.dollar_interpolation
    }
}

task curly_style_command {
    input {
        String HELLO = "hello"
    }
    command {
        export HELLO=bonjour
        echo ~{HELLO} > tilde
        echo ${HELLO} > dollar
    }
    output {
        String tilde_interpolation = read_string("tilde")
        String dollar_interpolation = read_string("dollar")
    }
    runtime {
        docker: "ubuntu:latest"
    }
}

task angles_style_command {
    input {
        String HELLO = "hello"
    }
    command <<<
        export HELLO=bonjour
        echo ~{HELLO} > tilde
        echo ${HELLO} > dollar
    >>>
    output {
        String tilde_interpolation = read_string("tilde")
        String dollar_interpolation = read_string("dollar")
    }
    runtime {
        docker: "ubuntu:latest"
    }
}
