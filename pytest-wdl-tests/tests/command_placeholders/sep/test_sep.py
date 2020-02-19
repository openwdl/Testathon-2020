def test_sep(workflow_runner):
    """
    Test the sep interpolation options during command interpolation.
    """
    inputs = {
    }
    outputs = {
        "goodbye" : "So long, farewell, auf Wiedersehen, good night!"
    }
    workflow_runner("main.wdl", inputs, outputs, workflow_name = 'main')
