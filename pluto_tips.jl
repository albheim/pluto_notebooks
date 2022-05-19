### A Pluto.jl notebook ###
# v0.16.0

using Markdown
using InteractiveUtils

# ╔═╡ 40e20d94-4c13-44c1-afea-25bd42cbcfc6
begin 
	using Pkg
	Pkg.add(["PlutoUI", "ControlSystems"])
	using PlutoUI
	using ControlSystems
end

# ╔═╡ d6a06593-bf62-4344-b2bd-0fa2bae85c08
md"""
# Exploring Control Systems

A notebook that explores the wonders of basic control engineering
"""

# ╔═╡ d4135173-4c54-4991-9d47-777669604481
md"""
## System representation

tf vs sys
"""

# ╔═╡ 9cd6e2a8-090e-4f1c-a35a-0edc685fe153
md"""
### Transfer functions

zpk vs tf

$$\int_0^{\pi}f(x)dx$$
"""

# ╔═╡ 9d2c6a47-2148-4c64-945e-f32aae67ea51
sys_zeros = Float64[]

# ╔═╡ 734af572-038f-47ef-b534-ae5a37df4638
sys_poles = Float64[-1, -0.5]

# ╔═╡ 0657df84-3134-4312-816b-d9f98a7eeda3
sys = zpk(sys_zeros, sys_poles, prod(-sys_poles))

# ╔═╡ 5c8dd096-24a3-4c68-b144-74d37dc80058
bodeplot(sys)

# ╔═╡ 29efa414-7e21-4d91-bfd4-345b504f36be
stepplot(sys)

# ╔═╡ f3fff89c-d3cb-4050-a5ed-68c752a612ab
md"""
## Appendix
"""

# ╔═╡ 5a533ddc-9ac9-11eb-172e-e9cc341e741b
#begin
#	using Pkg
#	Pkg.activate(mktempdir())
#end

# ╔═╡ 315c8b3c-daba-4044-acce-c578cc6e1be7
html"<button onclick=present()>Toggle present</button>"

# ╔═╡ f316a96a-5def-4c1a-9060-4abb35b72598
TableOfContents()

# ╔═╡ Cell order:
# ╟─d6a06593-bf62-4344-b2bd-0fa2bae85c08
# ╠═d4135173-4c54-4991-9d47-777669604481
# ╠═9cd6e2a8-090e-4f1c-a35a-0edc685fe153
# ╠═0657df84-3134-4312-816b-d9f98a7eeda3
# ╠═9d2c6a47-2148-4c64-945e-f32aae67ea51
# ╠═734af572-038f-47ef-b534-ae5a37df4638
# ╠═5c8dd096-24a3-4c68-b144-74d37dc80058
# ╠═29efa414-7e21-4d91-bfd4-345b504f36be
# ╟─f3fff89c-d3cb-4050-a5ed-68c752a612ab
# ╠═5a533ddc-9ac9-11eb-172e-e9cc341e741b
# ╠═40e20d94-4c13-44c1-afea-25bd42cbcfc6
# ╠═315c8b3c-daba-4044-acce-c578cc6e1be7
# ╠═f316a96a-5def-4c1a-9060-4abb35b72598
