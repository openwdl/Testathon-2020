version 1.0

workflow test_optional_file_output_wf {
    call test_optional_file_output as t
    output {
        File? file1 = t.file1
        File? file2 = t.file2
    }
}

task test_optional_file_output {
    command <<<
        echo -n "Hello, world!" > file1.txt
    >>>
    output {
        File? file1 = "file1.txt"
        File? file2 = "file2.txt"
    }
}
