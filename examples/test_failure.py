import pytest
import pytest_wdl

# See https://docs.pytest.org/en/latest/assert.html#assertions-about-expected-exceptions
def test_failure(workflow_data, workflow_runner):
    with pytest.raises(pytest_wdl.ExecutionFailedError) as err:
        # We expect this workflow to fail, and pytest-wdl to raise a ExecutionFailedError
        workflow_runner("myworkflow.wdl")
    
    # Assuming the error was raised, we can now make assertions about it
    assert "does not compute" in err.failed_task_stderr
