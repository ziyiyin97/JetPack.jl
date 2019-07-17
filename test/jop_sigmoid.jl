using LinearAlgebra, Jets, JetPack, Test

n1,n2 = 50,11

@testset "JopSigmoid, correctness T=$(T)" for T in (Float64,Float32,Complex{Float64},Complex{Float32})
    c = rand(T)
    F = JopSigmoid(JetSpace(T,n1,n2), c)
    x1 = rand(domain(F))
    @test F*x1 ≈ (1 .+ exp.(-x1./c)).^-1
end

@testset "JopSigmoid, linearity test, T=$(T)" for T in (Float64,Float32,Complex{Float64},Complex{Float32})
    c = rand(T)
    F = JopSigmoid(JetSpace(T,n1,n2), c)
    J = jacobian(F, rand(domain(F)))
    lhs,rhs = linearity_test(J)
    @test lhs ≈ rhs
end

@testset "JopSigmoid, dot product test, T=$(T)" for T in (Float64,Float32,Complex{Float64},Complex{Float32})
    c = rand(T)
    F = JopSigmoid(JetSpace(T,n1,n2), c)
    J  = jacobian!(F, rand(domain(F)))
    lhs, rhs = dot_product_test(J, -1 .+ 2 .* rand(domain(J)), -1 .+ 2 .* rand(range(J)))
    @test lhs ≈ rhs
end

# note the key here is to increase the size of the nonlinear vector
@testset "JopSigmoid, linearization test, T=$(T)" for T in (Float64,Float32,Complex{Float64},Complex{Float32})
    c = rand(T)
    F = JopSigmoid(JetSpace(T,n1,n2), c)
    m0 = rand(domain(F))
    μ  = sqrt.([1/1,1/2,1/4,1/8,1/16,1/32,1/64,1/128,1/256,1/512,1/1024,1/2048,1/4096,1/8192])
    δm = rand(domain(F))
    observed, expected = linearization_test(F, m0, μ = μ, δm = δm)
    δ = minimum(abs, observed - expected)
    #write(stdout, @sprintf("\nLinearization test -- type(%s)\n", T))
    #for i = 1:length(observed)
        #write(stdout, @sprintf("mu,observed,expected,diff; %12.6f %12.6f %12.6f %12.6f\n", mu[i], observed[i], expected[i], abs(observed[i] - expected[i])))
    #end
    #write(stdout, @sprintf("minimum difference %12.6e\n", minimum(abs,observed .- expected)))
    @test δ < 0.1
end
