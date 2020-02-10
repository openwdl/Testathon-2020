def test_optional_interpolation(workflow_runner):
    """
    Special behavior of string concatenation (+) within task command interpolations:
    If either operand is None, then the whole concatenation evaluates to None; and interpolation of
    None yields the empty string. This facilitates formulation of command-line flags.
    """
    inputs = { "maybe": "world" }
    expected = { "out": "hello world" }
    workflow_runner(
        "test_optional_interpolation.wdl",
        inputs,
        expected,
    )

    workflow_runner("test_optional_interpolation.wdl", {}, { "out": "" })
