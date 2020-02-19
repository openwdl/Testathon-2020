def test_true_false(workflow_runner):
    """
    Test the true/false interpolation options during command interpolation.
    """
    inputs = {
    }
    outputs = {
        "french_hello" : "bonjour",
        "english_hello" : "hello",
    }
    workflow_runner("main.wdl", inputs, outputs, workflow_name = 'main')
