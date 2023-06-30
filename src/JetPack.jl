module JetPack

using FFTW
using Jets
using LinearAlgebra
using SpecialFunctions
using Statistics
using Requires

include("jop_atan.jl")
include("jop_blend.jl")
include("jop_circshift.jl")
include("jop_derivative.jl")
include("jop_diagonal.jl")
include("jop_difference.jl")
include("jop_erf.jl")
include("jop_exp.jl")
include("jop_gradient.jl")
include("jop_highpass.jl")
include("jop_imag.jl")
include("jop_interp.jl")
include("jop_laplacian.jl")
include("jop_leaky_integration.jl")
include("jop_log.jl")
include("jop_lmo.jl")
include("jop_mix.jl")
include("jop_nim.jl")
include("jop_normalize.jl")
include("jop_pad.jl")
include("jop_permute.jl")
include("jop_permutedims.jl")
include("jop_pow.jl")
include("jop_projection.jl")
include("jop_real.jl")
include("jop_removedc.jl")
include("jop_reghost.jl")
include("jop_reshape.jl")
include("jop_restriction.jl")
include("jop_roughness.jl")
include("jop_shift.jl")
include("jop_sigmoid.jl")
include("jop_taper.jl")
include("jop_tanh.jl")
include("jop_translation.jl")

### If Flux is loaded, users can wrap an auto-differentiable function as a Jet operator
function __init__()
    @require Flux="587475ba-b771-5e3f-ad9e-33799f191a9c" @eval include("jop_ad.jl")
end

end
