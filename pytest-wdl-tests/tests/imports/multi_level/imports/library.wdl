version 1.0

task write_file {
    input {
        String file_name
    }

    command <<<
        echo "Hello World!" > ~{file_name}.txt
    >>>

    output {
        File result = "~{file_name}.txt"
    }
}
