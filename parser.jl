#Charger une instance depuis un fichier texte
function loadMBP(fname)
    f=open(fname)
    # lecture du nbre d'objets (n) et donc du nombre de sacs
    n = readuntil(f, ' ')
    # lecture des n coefficients de la fonction economique et cree le vecteur d'entiers c
    obj = parse.(Float64, split(readline(f)) )
    close(f)

    return(n, obj)
end

#Charger une instance depuis une saisie utilisateur
function inputMBP()
    n = 0
    print("Entrez le nombre d'objets et de sacs (n): ")
    n = parse(Int, readline())

    obj = []
    for k=1:n
        print("Saisissez le poids de l'objet ", k, ": ")
        w = parse(Float64, readline())
        while (w<0) || (w>1)
            print("Le poids doit être compris entre 0 et 1. Veuillez saisir une autre valeur :")
            w = parse(Float64, readline())
        end
        push!(obj, w)
    end

    println("L'instance est composée de ", n, " objets, d'un poids de ", obj, ".")

end


#Générer p instance(s) aléatoire(s)
function generateMBP(n, p)
    for instance=1:p
        path = string("C:/Users/Félix/Documents/GitHub/MINIMUM-BIN-PACKING/instance_rnd", instance, ".txt")
        file = open(path, "w")
        n_w = string(n, " ")
        print(file, n_w)
        for objet=1:n
            obj = round(rand(),digits=1)
            obj_w = string(obj, " ")
            print(file, obj_w)
        end
    close(file)
    end
end
