def test_A(workflow_runner):
    """
    import one file, and call the task in it.
    """
    inputs = {
        "x" : 1,
        "y" : 2
    }
    outputs = {
        "result" : 4
    }
    workflow_runner("main.wdl", inputs, outputs)
