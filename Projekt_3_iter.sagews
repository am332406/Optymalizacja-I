︠3cb9dd61-666f-41f2-a30c-480aa2c96364s︠
#TIME START
import time
a = time.time()

#WCZYTYWANIE DANYCH
import numpy as np
path = r''
fileName = '7.in'
file = open(os.path.join(path, fileName), 'r')
l = [ map (int,line.split(' ')) for line in file]
file.close()
N = l[0][0]
tree=np.array(l[1:])

#FUNKCJA ILOSCI PRACOWNIKOW DANEGO SZEFA
def pracownicy(boss, organizacja):
    global tree
    global N
    lst=[]
    lst.append(boss)
    for j in lst:
        for i in range (0, N):
            if (tree[i,organizacja] == j and i != j): ##
                lst.append(i)
    return(lst)

#METODA SYMPLEKS
lp = MixedIntegerLinearProgram(maximization=False, solver="GLPK")
x = lp.new_variable(binary=True, nonnegative=True)
lp.set_objective(sum(x[i] for i in range (0, N)))

#DODAWANIE OGRANICZEN
for i in range(0, N):
    lst1 = (pracownicy(i, 0))
    lst2 = (pracownicy(i, 1))
    lp.add_constraint(sum(x[i] for i in lst1), min = tree[i,2])
    lp.add_constraint(sum(x[i] for i in lst2), min = tree[i,3])

#WYNIK OPTYMALIZACJI
result = int(lp.solve())
#print result
#lp.show()                #za duzo tekstu na wiekszych plikach

# wartosci zmiennych
val = lp.get_values(x)
#print val
output = ""
result = N - result
for i, v in lp.get_values(x).iteritems():
    if int(v) == 0:
        output = output + str(i) + " "
#print output

#TWORZENIE PLIKU OUTPUT
fileo = open('out.out', 'w')
fileo.write(str(result) + "\n")
fileo.write(str(output))
fileo.close()
print "done"

#TIME END
b = time.time()
print b-a
︡8d8eaf07-5454-49ea-bef4-c4424e5b1170︡{"stdout":"done\n"}︡{"stdout":"161.297438145\n"}︡{"done":true}︡









