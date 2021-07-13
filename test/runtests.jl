# set random seed to promote repeatability in CI unit tests
using Random
Random.seed!(101)

for filename in (
        "jop_atan.jl",
        "jop_blend.jl",
        "jop_circshift.jl",
        "jop_derivative.jl",
        "jop_diagonal.jl",
        "jop_difference.jl",
        "jop_erf.jl",
        "jop_exp.jl",
        "jop_gradient.jl",
        "jop_highpass.jl",
        "jop_imag.jl",
        "jop_interp.jl",
        "jop_laplacian.jl",
        "jop_leaky_integration.jl",
        "jop_log.jl",
        "jop_lmo.jl",
        "jop_mix.jl",
        "jop_nim.jl",
        "jop_normalize.jl",
        "jop_pad.jl",
        "jop_permute.jl",
        "jop_permutedims.jl",
        "jop_pow.jl",
        "jop_projection.jl",
        "jop_real.jl",
        "jop_reghost.jl",
        "jop_removedc.jl",
        "jop_reshape.jl",
        "jop_restriction.jl",
        "jop_roughness.jl",
        "jop_shift.jl",
        "jop_sigmoid.jl",
        "jop_taper.jl",
        "jop_tanh.jl",
        "jop_translation.jl")
    include(filename)
end
