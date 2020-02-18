version 1.0

workflow test_docker_wf {
    Array[String] versions = ["18.04", "19.10"]

    scatter (version in versions) {
        call test_docker {
            input:
                version = version
        }
    }
}

task test_docker {
    input {
        String version
    }

    command <<<
        # verify command is running within expected ubuntu image
        grep "~{version}" /etc/issue
    >>>

    runtime {
        docker: "ubuntu:~{version}"
    }
}
