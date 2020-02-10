def test_optional_file_output(workflow_runner):
    """
    runtime.docker controls the container image in which the command runs
    """
    workflow_runner("test_docker.wdl", {}, {})
