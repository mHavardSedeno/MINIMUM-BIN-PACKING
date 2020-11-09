#________________________________________________________________________#
#Fonction de comptage du nombre de bins nécessaire pour placer nos objets
function binCount(
    s::Array{Float64}
    )

    i = 1
    while s[i] > 0
        print(i)
        i += 1
    end

    return i-1
end

#_____________________________________________________________#
#Fonction Next Fit (objets placés dans l'ordre de leur indice)
function NextFit(
    n::Int64,
    obj::Array{Float64}
    )

    s = zeros(Float64, n)
    i = 1

    #Sélection des objets dans l'ordre des indices
    for k=1:n
        if s[i] + obj[k] > 1
            i += 1
        end
        s[i] += obj[k]
    end
    m = binCount(s)

    return s,m
end


#_____________________________________________________________#
#Fonction First Fit Decreasing (objets placés dans l'ordre de leur indice)
function NextFit(
    n::Int64,
    obj::Array{Float64}
    )


end
