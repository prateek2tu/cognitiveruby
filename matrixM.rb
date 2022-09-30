def prettyPrint( matrix )

    for array in matrix
        array.select{|x| print x.to_s.rjust(4," ")}
        puts
    end
end

def multiply( m1, m2 )

    result = Array.new( m1.length ) { Array.new( m2[0].length ) {0} }

    for i in 0..result.length - 1
        for j in 0..result[0].length - 1
            for k in 0..m1[0].length - 1
                result[i][j] += m1[i][k] * m2[k][j]
            end
        end
    end

    return result
end

matrixA = [
    [1, 2, 3],
    [4, 5, 6]
]

matrixB = [
    [7, 8],
    [9, 10],
    [11, 12]
]

puts "Matrix A: "
prettyPrint( matrixA )

puts 

puts "Matrix B:"
prettyPrint( matrixB )

puts 

puts "Multiplication of Matrix A * Matrix B"
resMatrix = multiply( matrixA, matrixB )
prettyPrint( resMatrix )