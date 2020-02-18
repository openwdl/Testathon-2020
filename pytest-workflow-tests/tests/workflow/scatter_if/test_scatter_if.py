import json
from pathlib import Path

import pytest


@pytest.mark.workflow("scatter_if_miniwdl")
def test_scatter_if_miniwdl_output(workflow_dir):
    output = Path(workflow_dir, "log.out")
    output_dict = json.loads(output.read_text())
    assert output_dict["outputs"]["scatter_if.i_even"] == [0, 2, 4, 6, 8]