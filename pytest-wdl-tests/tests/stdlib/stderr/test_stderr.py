def test_stderr(workflow_runner):
    """
    The stderr() function properly captures error output
    """

    test_string = "test string"

    input = {"wf_in_str": test_string}
    expected = {"out_str": test_string}
    workflow_runner("test_stderr.wdl", input, expected)
