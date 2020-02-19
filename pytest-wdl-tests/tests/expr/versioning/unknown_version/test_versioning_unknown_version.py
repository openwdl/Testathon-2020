import pytest
import WDL

def test_versioning_unknown_version(workflow_runner):
    """
    First line of the WDL file must be a version statement. Must yield syntax error if version is unknown
    """
    with pytest.raises(WDL.Error.SyntaxError):
        workflow_runner("test_versioning_unknown_version.wdl")

