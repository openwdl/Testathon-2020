def test_expressions_declarations(workflow_runner):
    """
    Expression evaluation in declarations.
    """
    inputs = { }
    expected = {
        "exprs.output_parens": "string",
        "exprs.output_left": "left",
        "exprs.output_array_string": [ "string" ],
        "exprs.output_array_element": "string",
        "exprs.output_negated": False,
        "exprs.output_negated_": False,
        "exprs.output_negated__": -42,
        "exprs.output_unary": 42,
        "exprs.output_conditional": 1,
        "exprs.output_conditional_": 1,
        "exprs.output_mult": 1806,
        "exprs.output_div": 0,
        "exprs.output_mod": 42,
        "exprs.output_add": 85,
        "exprs.output_sub": -1,
        "exprs.output_lt": True,
        "exprs.output_lte": True,
        "exprs.output_gt": False,
        "exprs.output_gte": False,
        "exprs.output_eq": False,
        "exprs.output_ne": True,
        "exprs.output_and": False,
        "exprs.output_or": True,
        "exprs.output_p": {'name': 'Jamie', 'age': 4},
        "exprs.output_booleans": [ True, False ],
        "exprs.output_booleans_": [ True, False]
    }
    workflow_runner(
        "test_expressions_declarations.wdl",
        inputs,
        expected,
        workflow_name = "expressions"
    )
