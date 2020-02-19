def test_versioning(workflow_runner):
    """
    First line of the WDL file must be a version statement
    """
    workflow_runner("test_versioning_version_one.wdl")
