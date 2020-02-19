version 1.0

struct Person {
    String name
    Int age
}

task exprs {
    String string = "string"
    String parens = (string)
    String parens_ = ("string")
    Pair[String, String] pair = ("left", "right")
    String left = pair.left
    Array[String] array_string = ["string"]
    String array_element = array_string[0]
    Boolean true_ = true
    Boolean false_ = false
    Boolean negated = !true_
    Boolean negated_ = !true
    Int i = 42
    Int j = 43
    Int negated__ = - i
    Int unary = + i
    Int conditional = if true then 1 else 0
    Int conditional_ = if true_ then 1 else 0
    Int mult = i * j
    Int div = i / j
    Int mod = i % j
    Int add = i + j
    Int sub = i - j
    Boolean lt = i < j
    Boolean lte = i <= j
    Boolean gt = i > j
    Boolean gte = i >= j
    Boolean eq = i == j
    Boolean ne = i != j
    Boolean and = true_ && false_
    Boolean or = true_ || false_
    Person p = { "name": "Jamie", "age": 4 }
    Array[Boolean] booleans = [ true, false ]
    Array[Boolean] booleans_ = [ true_, false_ ]

    command {
      echo noop
    }

    runtime {
      docker: "ubuntu:latest"
    }

    output {
        String output_parens = parens
        String output_left = left
        Array[String] output_array_string = array_string
        String output_array_element = array_element
        Boolean output_negated = negated
        Boolean output_negated_ = negated_
        Int output_negated__ = negated__
        Int output_unary = unary
        Int output_conditional = conditional
        Int output_conditional_ = conditional_
        Int output_mult = mult
        Int output_div = div
        Int output_mod = mod
        Int output_add = add
        Int output_sub = sub
        Boolean output_lt = lt
        Boolean output_lte = lte
        Boolean output_gt = gt
        Boolean output_gte = gte
        Boolean output_eq = eq
        Boolean output_ne = ne
        Boolean output_and = and
        Boolean output_or = or
        Person output_p = p
        Array[Boolean] output_booleans = booleans
        Array[Boolean] output_booleans_ = booleans_
    }
}

workflow expressions {
  call exprs
}
