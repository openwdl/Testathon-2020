def test_stdout(workflow_runner):
    """
    The stdout() function properly captures standard output
    """

    test_string = "test string"

    input = {"wf_in_str": test_string}
    expected = {"out_str": test_string}
    workflow_runner("test_stdout.wdl", input, expected)
