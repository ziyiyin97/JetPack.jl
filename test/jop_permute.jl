using JetPack, Jets, Test

@testset "jop_permute" begin
    A = JopPermute(JetSpace(Float64,4,2), (1,), ([3;1;2;4],))
    m = [11. 12. ; 21. 22. ; 31. 32. ; 41. 42.]
    d = A*m
    @test d ≈ [31. 32. ; 11. 12. ; 21. 22. ; 41. 42.]

    A = JopPermute(JetSpace(Float64,3,2), (1,2), ([3;2;1],[2;1]))
    m = [11. 12. ; 21. 22. ; 31. 32.]
    d = A*m
    @test d ≈ [32. 31. ; 22. 21. ; 12. 11.]

    m = rand(domain(A))
    d = rand(range(A))
    lhs, rhs = dot_product_test(A,m,d)
    @test lhs ≈ rhs

    A = JopPermute(JetSpace(Float64,4), (1,), ([3;2;1;4],))
    m = [1. ; 2. ; 3. ; 4.]
    d = A*m
    @test d ≈ [3. ; 2. ; 1. ; 4.]

    m = rand(domain(A))
    d = rand(range(A))
    lhs, rhs = dot_product_test(A,m,d)
    @test lhs ≈ rhs
end
