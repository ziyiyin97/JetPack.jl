using LinearAlgebra, Jets, JetPack, Test

n1,n2 = 5,2

# no correctness test for non zero α -- JopLeakyIntegration should handle that case
@testset "JopNormalize, correctness T=$(T)" for T in (Float32, Float64, Complex{Float32}, Complex{Float64})
    F = JopNormalize(JetSpace(T,n1,n2))
    x1 = ones(domain(F))
    @test F*x1 ≈ ones(domain(F)) ./ n1
end

@test_skip @testset "JopNormalize, linearity test, T=$(T)" for T in (Float32, Float64, Complex{Float32}, Complex{Float64})
    F = JopNormalize(JetSpace(T,n1,n2))
    J = jacobian(F, rand(domain(F)))
    lhs,rhs = linearity_test(J)
    @test lhs ≈ rhs
    lhs,rhs = linearity_test(J')
    @test lhs ≈ rhs
end

@test_skip @testset "JopNormalize, dot product test, T=$(T)" for T in (Float32, Float64, Complex{Float32}, Complex{Float64})
    F = JopNormalize(JetSpace(T,n1,n2))
    J  = jacobian!(F, rand(domain(F)))
    lhs, rhs = dot_product_test(J, -1 .+ 2 .* rand(domain(J)), -1 .+ 2 .* rand(range(J)))
    @test lhs ≈ rhs
end

# note the key here is to increase the size of the nonlinear vector
@test_skip @testset "JopNormalize, linearization test, T=$(T)" for T in (Float32, Float64, Complex{Float32}, Complex{Float64})
    F = JopNormalize(JetSpace(T,n1,n2))
    m0 = rand(domain(F))
    μ  = sqrt.([1/1,1/2,1/4,1/8,1/16,1/32,1/64,1/128,1/256,1/512,1/1024,1/2048,1/4096,1/8192])
    δm = rand(domain(F))
    observed, expected = linearization_test(F, m0, μ = μ, δm = δm)
    δ = minimum(abs, observed - expected)
    @test δ < 0.1
end
