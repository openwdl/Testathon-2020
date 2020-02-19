def test_expressions_outputs(workflow_runner):
    """
    Expression evaluation in outputs.
    """
    inputs = { }
    expected = {
        "exprs.parens": "string",
        "exprs.left": "left",
        "exprs.array_string": [ "string" ],
        "exprs.array_element": "string",
        "exprs.negated": False,
        "exprs.negated_": False,
        "exprs.negated__": -42,
        "exprs.unary": 42,
        "exprs.conditional": 1,
        "exprs.conditional_": 1,
        "exprs.mult": 1806,
        "exprs.div": 0,
        "exprs.mod": 42,
        "exprs.add": 85,
        "exprs.sub": -1,
        "exprs.lt": True,
        "exprs.lte": True,
        "exprs.gt": False,
        "exprs.gte": False,
        "exprs.eq": False,
        "exprs.ne": True,
        "exprs.and": False,
        "exprs.or": True,
        "exprs.p": {'name': 'Jamie', 'age': 4},
        "exprs.booleans": [ True, False ],
        "exprs.booleans_": [ True, False]
    }
    workflow_runner(
        "test_expressions_outputs.wdl",
        inputs,
        expected,
        workflow_name = "outputs"
    )
