version 1.0

struct Person {
    String name
    Int age
}

task exprs {
    command {
        echo noop
    }

    runtime {
        docker: "ubuntu:latest"
    }

    output {
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
    }
}

workflow outputs {
    call exprs
}
