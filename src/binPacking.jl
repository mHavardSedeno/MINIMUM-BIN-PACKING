#________________________________________________________________________#
#Fonction de comptage du nombre de bins nécessaire pour placer nos objets
function binCount(s)

    m = 0

    for i=1:length(s)
        if s[i] != 0.0
            m += 1
        end
    end

    return m
end

#_____________________________________________________________#
#Fonction Next Fit (objets placés dans l'ordre de leur indice)
function NextFit(
    n::Int64,           # 2
    obj #[0.8, 0.6]
    )

    packs = zeros(Float64, n) # = [0, 0]
    i = 1

    #Sélection des objets dans l'ordre des indices
    for k=1:n
        if packs[i] + obj[k] > 1
            i += 1
        end
        packs[i] += obj[k]
    end
    m = binCount(packs)

    return m
end


#_____________________________________________________________#
#Fonction First Fit Decreasing (objets placés dans l'ordre de leur indice)
function FirstFitDecreasing(
    n::Int64,
    obj
    )

    #trie des valeurs par ordre decroissat
    objetTrie=sort!(obj,rev=true)
    package = zeros(Float64,n)
    i=1

    for k=1:n
        while package[i]+objetTrie[k]>1
            i+=1
        end
        package[i]+=objetTrie[k]
        i=1
    end
    m=binCount(package)
    return m
end


#_____________________________________________________________#
#Fonction Random Order / Random Bin (objets placés dans l'ordre de leur indice)
function randomOrder(
    n::Int64,
    obj
    )

    #Tableau de comptage des remplissages de chaque sac
    packs = zeros(Float64, n)
    #Liste des indices des objets pas encore placés
    list_obj = [1:n;]
    n_tmp = n
    ite = 0

    #Tant qu'il reste des objets à placer
    while list_obj != []

        #On sélectionne un objet aléatoire dans la liste
        rnd_obj = rand(list_obj)

        #Sélection d'un pack aléatoire, où il est possible d'ajouter l'objet courant
        rnd_pack = rand(1:n)

        while packs[rnd_pack] + obj[rnd_obj] > 1
            rnd_pack = rand(1:n)
        end

        #Ajout de l'objet aléatoire au sac aléatoire
        packs[rnd_pack] += obj[rnd_obj]

        #L'objet placé peut être retiré de la liste
        filter!(e->e≠rnd_obj,list_obj)
        n_tmp -= 1
    end

    m = binCount(packs)

    return m
end


#_______________________________#
# Calcul de la borne inférieure #

function lowerb(n, obj)

    sum = 0
    for i in 1:n
        sum += obj[i]
    end

    lb = ceil(sum)

    return lb
end
