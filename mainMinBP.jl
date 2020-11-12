#Minimum Bin-Packing
#Projet de complexité - M. FERTIN
#Augustin HERVE & Mathilde HAVARD-SEDENO
#M1 Informatique

include("parser.jl")
include("binPacking.jl")

#Choix de l'instance
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
