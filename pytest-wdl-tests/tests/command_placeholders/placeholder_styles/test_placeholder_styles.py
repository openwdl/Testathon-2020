def test_placeholder_styles(workflow_runner):
    """
    Test the interpolation styles in command {} and command <<< >>> sections
    """
    inputs = {
    }
    outputs = {
        "curly_tilde_interpolated" : "hello",
        "curly_dollar_interpolated" : "hello",
        "angles_tilde_interpolated" : "hello",
        "angles_dollar_interpolated" : "bonjour"
    }
    workflow_runner("main.wdl", inputs, outputs, workflow_name = 'main')
