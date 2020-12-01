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

while (type != 1) && (type != 2) && (type != 3)
    print("non")
end

if type == 1

elseif type == 2

else

#Chargement
fname = "C:/Users/Félix/Documents/GitHub/MINIMUM-BIN-PACKING/instance1.txt"
n, obj = loadMBP(fname)
#Saisie
#inputMBP()
#Aléatoire
#generateMBP(2,2)

#NextFit(n, obj)
#randomOrder(n, obj)
FirstFitDecreasing(n, obj)
