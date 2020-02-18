version 1.0

import "util.wdl" as util

workflow main {
    input {
        String file_name
    }

    call util.util as util {
        input: file_name = file_name
    }

    output {
	File result = util.result
    }
}
