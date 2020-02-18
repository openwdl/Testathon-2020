version 1.0

workflow test_size {
    input {
        File? f0
    }

    # 10-byte file (counting newline)
    File f1 = write_lines(["123456789"])
    # 20-byte file
    File f2 = write_lines(["1234567890123456789"])

    Array[String] all_units = [
        "B",
        "K", "KB", "Ki", "KiB",
        "M", "MB", "Mi", "MiB",
        "G", "GB", "Gi", "GiB",
        "T", "TB", "Ti", "TiB"
    ]

    scatter (u in all_units) {
        Float sz_u0 = size(f0, u)
        Float sz_u1 = size(f1, u)
        Float sz_ua = size([f0, f1, f2], u)
    }

    output {
        Float size_f0 = size(f0)
        Float size_f1 = size(f1)
        Float size_all = size([f0, f1, f2])
        Array[Float] size_u0 = sz_u0
        Array[Float] size_u1 = sz_u1
        Array[Float] size_uall = sz_ua
    }
}
