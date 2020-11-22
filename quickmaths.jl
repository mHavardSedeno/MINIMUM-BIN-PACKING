P = [2, 11, 7, 8, 5, 9, 4]
N = sum(P)
T = []

for i=1:length(P)
    push!(T, (2*P[i]/N))
end

println(T)
println("Sum : ", sum(T))


#[0.08695652173913043, 0.4782608695652174, 0.30434782608695654, 0.34782608695652173, 0.21739130434782608, 0.391304347826087, 0.17391304347826086]
S = [0,0]
println("oui :", length(P))

# for k=1:length(P)
#     if S[1] + T[k] <= 1
#         S[1] += T[k]
#     elseif S[2] + T[k] <= 1
#         S[2] += T[k]
#     else
#         println("Oups")
#     end
# end

println(T[2] + T[4] + T[7])
