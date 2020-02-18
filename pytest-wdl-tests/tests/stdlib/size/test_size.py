def test_size(workflow_runner):
    """
    The size() function can be invoked in a few different ways
    """
    divisors = [1] + [2**10]*4 + [2**20]*4 + [2**30]*4 + [2**40]*4
    # TODO: should the unit divisors be the following? spec clarification needed
    """
            [
        1,
        10**3, 10**3, 2**10, 2*10,
        10**6, 10**6, 2**20, 2**20,
        10**9, 10**9, 2**30, 2**30,
        10**12, 10**12, 2**40, 2**40,
    ]
    """
    expected = {
        "size_f0": 0.0,
        "size_f1": 10.0,
        "size_all": 30.0,
        "size_u0": [0.0]*17,
        "size_u1": [10.0/d for d in divisors],
        "size_uall": [30.0/d for d in divisors],
    }
    workflow_runner(
        "test_size.wdl",
        {},
        expected,
    )
