def test_optional_file_output(workflow_data, workflow_runner):
    """
    An optional file output may name a file that does not exist in the container, yielding a None
    output value.
    """
    expected = workflow_data.get_dict("file1")
    expected["file2"] = None
    workflow_runner(
        "test_optional_file_output.wdl",
        {},
        expected
    )
