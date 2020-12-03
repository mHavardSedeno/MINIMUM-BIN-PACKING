#Minimum Bin-Packing
#Projet de complexité - M. FERTIN
#Augustin HERVE & Mathilde HAVARD-SEDENO
#M1 Informatique

include("src/parser.jl")
include("src/binPacking.jl")

#Choix de l'instance
println("__ CHOIX DE L'INSTANCE __")
println("\n 1- Depuis un fichier; \n 2- Au clavier; \n 3- Génération aléatoire. \n")
println("Entrez le code du type d'instance souhaitée : ")
type = readline()

while (type ∉ ["1","2","3"])
    println("Entrez un code valide (1, 2 ou 3) : ")
    global type = readline()
end

if type == "1"
        println("Rentrez le nom du fichier :")
        #C:/Users/Félix/Documents/GitHub/MINIMUM-BIN-PACKING/instances/instance1.txt
        fname = readline()
        global n, obj = loadMBP(fname)

elseif type == "2"
    global n, obj = inputMBP()

else
    print("Combien d'instances souhaitez-vous créer ?")
    global nb_instances = parse(Int, readline())
    print("Combien d'objets voulez-vous ?")
    n = parse(Int, readline())
    println(nb_instances, " instance(s) vont être générées aléatoirement.")
    generateMBP(n, nb_instances)

    println("Rentrez le nom du fichier :")
    #C:/Users/Félix/Documents/GitHub/MINIMUM-BIN-PACKING/instance1.txt
    fname = readline()
    global n, obj = loadMBP(fname)
end


if (type ∈ ["1","2"])
    lb = lowerb(n, obj)
    println("Borne inférieure = ", lb)

    global resNF = NextFit(n, obj)
    println("Résultat NF = ", resNF)
    println("ratio NF =", resNF/lb)

    global resFFD = FirstFitDecreasing(n, obj)
    println("Résultat FFD =", resFFD)
    println("ratio FFD =", resFFD/lb)

    global resRORB = randomOrder(n, obj)
    println("Résultat RORB =", resRORB)
    println("ratio RORB =", resRORB/lb)

elseif (type == 3)
    ratioFFD = []
    ratioNF = []
    ratioRORB = []
    for i in 1:nb_instances
        resFFD = FirstFitDecreasing(n, obj)
        push!(ratioFFD, resFFD)
        resNF = NextFit(n, obj)
        push!(ratioNF, resNF)
        resRORB = randomOrder(n, obj)
        push!(ratioRORB, resRORB)
    end

    println("Ratio moyen FFD = ", mean(ratioFFD))
    println("Ratio moyen NF = ", mean(ratioNF))
    println("Ratio moyen RORB = ", mean(ratioRORB))

end
