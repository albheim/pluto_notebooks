### A Pluto.jl notebook ###
# v0.16.0

using Markdown
using InteractiveUtils

# ╔═╡ b74ca1f6-ddd4-11eb-0dcd-97b0c802f9cd
begin
	struct DNum{T} <: Number
		num::T
		eps::T
	end
	DNum(x) = DNum(x, zero(x))
end

# ╔═╡ 8468a510-aa57-4e63-8b33-18337ca964ca
a = DNum(3.0)

# ╔═╡ ea70d21f-dfe4-4e50-bfd9-0134facec587
b = DNum(5)

# ╔═╡ 81787b6a-c8e1-4319-946f-66bdb208d95e
Base.:*(a::DNum, b::DNum) = DNum(a.num * b.num, a.eps * b.num + b.eps * a.num)

# ╔═╡ 0a6cd0a8-54b0-4fae-88c5-0582a1f54d8c
Base.:+(a::DNum, b::DNum) = DNum(a.num + b.num, a.eps + b.eps)

# ╔═╡ 00d530cd-749d-4fc4-92bb-9c0940f9320b
Base.:-(a::DNum, b::DNum) = a + (-b)

# ╔═╡ 21f231f2-5778-40b3-a583-8c6d1b40c7a3
Base.:-(a::DNum) = DNum(-a.num, -a.eps)

# ╔═╡ 806acb35-41f9-4465-b05b-06684a342ef0
Base.:/(a::DNum, b::DNum) = DNum(a.num / b.num, (b.num * a.eps - a.num * b.eps) / b.num^2)

# ╔═╡ fb3cbe3d-d285-4350-809f-12df55d05501
Base.sin(a::DNum) = DNum(sin(a.num), cos(a.eps))

# ╔═╡ c90513b8-3aa3-47f9-be78-2510f2944ff7
function diff(f, x)
	z = DNum(x, one(x))
	y = f(z)
	y.eps
end

# ╔═╡ cf82745d-88cc-4ea6-8626-6a0c9087112e
diff(x -> sin(x), 3.0)

# ╔═╡ d6f86a0c-11f7-4c32-9c18-b43856eac1fc
promote(a, b)

# ╔═╡ 5ed0b046-992f-426f-957a-eea2d8d19904
function Base.promote_rule(::Type{DNum{T1}}, ::Type{DNum{T2}}) where {T1, T2} 
	@show T1 T2
	T3 = promote_type(T1, T2)
	DNum{T3}
end

# ╔═╡ 3c6e879a-b9a2-449b-bb7e-faba396203d5
Base.promote_rule(::Type{DNum{T1}}, ::Type{T2}) where {T1, T2} = DNum{promote_type(T1, T2)}

# ╔═╡ 12b5940a-26ef-4214-b3dc-8d61c6772ba3
Base.convert(::Type{DNum{T}}, a::Number) where T<:Number = DNum(T(a))

# ╔═╡ 9622a887-a3d4-4312-8a35-05cbcaffbce7
Base.convert(::Type{DNum{T}}, a::DNum) where T<:Number = DNum(T(a.num), T(a.eps))

# ╔═╡ 20d9f92c-660a-40d8-8058-484b1fdf9e40
Base.show(io::IO, a::DNum) = println(io, "$(a.num) + $(a.eps)ϵ")

# ╔═╡ Cell order:
# ╠═b74ca1f6-ddd4-11eb-0dcd-97b0c802f9cd
# ╠═8468a510-aa57-4e63-8b33-18337ca964ca
# ╠═ea70d21f-dfe4-4e50-bfd9-0134facec587
# ╠═81787b6a-c8e1-4319-946f-66bdb208d95e
# ╠═0a6cd0a8-54b0-4fae-88c5-0582a1f54d8c
# ╠═00d530cd-749d-4fc4-92bb-9c0940f9320b
# ╠═21f231f2-5778-40b3-a583-8c6d1b40c7a3
# ╠═806acb35-41f9-4465-b05b-06684a342ef0
# ╠═fb3cbe3d-d285-4350-809f-12df55d05501
# ╠═c90513b8-3aa3-47f9-be78-2510f2944ff7
# ╠═cf82745d-88cc-4ea6-8626-6a0c9087112e
# ╠═d6f86a0c-11f7-4c32-9c18-b43856eac1fc
# ╠═5ed0b046-992f-426f-957a-eea2d8d19904
# ╠═3c6e879a-b9a2-449b-bb7e-faba396203d5
# ╠═12b5940a-26ef-4214-b3dc-8d61c6772ba3
# ╠═9622a887-a3d4-4312-8a35-05cbcaffbce7
# ╠═20d9f92c-660a-40d8-8058-484b1fdf9e40
