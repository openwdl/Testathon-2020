version 1.0

workflow main {
    call say_hello as say_hello_en { input: en_francais = false }
    call say_hello as say_hello_fr { input: en_francais = true }
    output {

        String english_hello = say_hello_en.hello
        String french_hello = say_hello_fr.hello
    }
}

task say_hello {
    input {
        Boolean en_francais
    }
    command {
        echo ${false="hello" true="bonjour" en_francais}
    }
    output {
        String hello = read_string(stdout())
    }
    runtime {
        docker: "ubuntu:latest"
    }
}
