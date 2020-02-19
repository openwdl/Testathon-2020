def test_default(workflow_runner):
    """
    Test the default interpolation option during command interpolation.
    """
    inputs = {
    }
    outputs = {
        "english_hello" : "hello",
        "french_hello" : "bonjour"
    }
    workflow_runner("main.wdl", inputs, outputs, workflow_name = 'main')
