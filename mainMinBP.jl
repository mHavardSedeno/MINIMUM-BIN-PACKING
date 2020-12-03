#Minimum Bin-Packing
#Projet de complexité - M. FERTIN
#Augustin HERVE & Mathilde HAVARD-SEDENO
#M1 Informatique

include("parser.jl")
include("binPacking.jl")

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
        #C:/Users/Félix/Documents/GitHub/MINIMUM-BIN-PACKING/instance1.txt
        fname = readline()
        global n, obj = loadMBP(fname)

elseif type == "2"
    global n, obj = inputMBP()

else
    print("Combien d'instances souhaitez-vous créer ?")
    nb = parse(Int, readline())
    print("Combien d'objets voulez-vous ?")
    n = parse(Int, readline())
    println(nb, " instance(s) vont être générées aléatoirement.")
    generateMBP(n, nb)

    println("Rentrez le nom du fichier :")
    #C:/Users/Félix/Documents/GitHub/MINIMUM-BIN-PACKING/instance1.txt
    fname = readline()
    global n, obj = loadMBP(fname)
end

lb = lowerb(n, obj)
println("Borne inférieure = ", lb)

resFFD = FirstFitDecreasing(n, obj)
println("Résultat FFD =", resFFD)
println("ratio FFD =", resFFD/lb)

resNF = NextFit(n, obj)
println("Résultat NF = ", resNF)
println("ratio NF =", resNF/lb)

resRORB = randomOrder(n, obj)
println("Résultat RORB =", resRORB)
println("ratio RORB =", resRORB/lb)
