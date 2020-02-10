def test_optional_file_output(workflow_data, workflow_runner):
    expected = workflow_data.get_dict("file1")
    expected["file2"] = None
    workflow_runner(
        "test_optional_file_output.wdl",
        {},
        expected
    )
