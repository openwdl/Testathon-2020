def test_add2(workflow_runner):
    """
    A task that adds two integers
    """
    inputs = {
        "a" : 1,
        "b" : 2
    }
    outputs = {
        "result" : 3
    }
    workflow_runner("main.wdl", inputs, outputs)
