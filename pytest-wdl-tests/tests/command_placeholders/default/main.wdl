version 1.0

workflow main {
    call say_hello as hello_en
    call say_hello as hello_fr { input: hello_override = "bonjour" }

    output {
        String english_hello = hello_en.hello
        String french_hello = hello_fr.hello
    }
}

task say_hello {
    input {
        String? hello_override
    }
    command {
        echo '${default="hello" hello_override}'
    }
    output {
        String hello = read_string(stdout())
    }
    runtime {
        docker: "ubuntu:latest"
    }
}
