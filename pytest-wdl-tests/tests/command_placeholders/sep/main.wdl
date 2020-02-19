version 1.0

workflow main {
    call say_goodbye { input: goodbyes = ["So long","farewell","auf Wiedersehen","good night"] }
    output {
        String goodbye = say_goodbye.goodbye
    }
}

task say_goodbye {
    input {
        Array[String] goodbyes
    }
    command {
        echo '${sep=", " goodbyes}!'
    }
    output {
        String goodbye = read_string(stdout())
    }
    runtime {
        docker: "ubuntu:latest"
    }
}
