for filename in (
        "jop_blend.jl",
        "jop_circshift.jl",
        "jop_derivative.jl",
        "jop_diagonal.jl",
        "jop_difference.jl",
        "jop_pad.jl",
        "jop_permute.jl",
        "jop_reshape.jl",
        "jop_restriction.jl",
        "jop_roughness.jl",
        "jop_taper.jl",
        "jop_translation.jl")
    include(filename)
end
