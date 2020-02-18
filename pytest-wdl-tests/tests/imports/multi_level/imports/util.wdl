version 1.0

import "library.wdl" as lib

workflow util {
    input {
        String file_name
    }

    call lib.write_file as write_file {
        input: file_name = file_name
    }

    output {
        File result = write_file.result
    }
}
