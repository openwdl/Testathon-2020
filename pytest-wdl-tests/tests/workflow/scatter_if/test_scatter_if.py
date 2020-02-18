def test_scatter_if(workflow_runner):
    """
    if section nested within a scatter section
    """
    workflow_runner("test_scatter_if.wdl", {}, {"i_even": [0, 2, 4, 6, 8]})
