version 1.0

workflow scatter_if {
    scatter (i in range(10)) {
        Boolean even = i%2 == 0
        if (even) {
            Int j = i
        }
    }

    output {
        Array[Int] i_even = select_all(j)
    }
}
