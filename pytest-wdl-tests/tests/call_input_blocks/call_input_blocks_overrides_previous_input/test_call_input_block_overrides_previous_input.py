def test_call_input_block_overrides_previous_input(workflow_runner):
    """
    This test asserts that value specified in call input block overrides previously defined input value
    """
    expected_int = 10
    workflow_runner("test_call_input_block_overrides_previous_input.wdl", {"wfl_inp": expected_int}, {"out": expected_int})
