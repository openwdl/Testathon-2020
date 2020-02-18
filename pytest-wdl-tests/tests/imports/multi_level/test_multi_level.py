def test_multi_level(workflow_runner):
    """
    run a workflow in main.wdl, that imports util.wdl, that imports library.wdl that has a task
    """
    inputs = {
        "file_name" : "foo.txt"
    }
    outputs = {}
    workflow_runner("main.wdl", inputs, outputs)
