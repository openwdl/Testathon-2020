import pytest
import pytest_wdl

def test_call_input_overriden_by_workflow_input(workflow_runner):
    with pytest.raises(pytest_wdl.ExecutionFailedError):
        """
        This test asserts that workflow submission fails in case if call input defined both in call input block
        and as a workflow input.
        Not checking actual exception message here since it can be engine-specific
        """
        inputs = {
            "test_call_input_overriden_by_workflow_input.test_call_input_overriden_by_workflow_input_task.str": "string from workflow input"
        }
        workflow_runner("test_call_input_overriden_by_workflow_input.wdl", inputs)
