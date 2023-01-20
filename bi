from math import *

gl = [1,2,3,4]
m = [4,5,6,7]
L =(gl,m)

gl = [1,4,6,8]
m = [3,5,7,9]
M = (gl,m)

#сумма
def summa(lam,mu):
  nu=[0,0,0,0]
  for i in range(4):
    nu[i]=lam[i]+mu[i]
  return nu

#разность
def raz(lam1,mu1):
  nu=[0,0,0,0]
  for i in range(4):
    nu[i]=lam1[i]-mu1[i]
  return nu

#умножение кватерниона на число
def umnachis(a,mu1):
  nu=[0,0,0,0]
  for i in range(4):
    nu[i]=a*mu1[i]
  return nu

#произведение кватернионов
def multip(mu,lam):
  nu=[0,0,0,0]
  nu[0]=mu[0]*lam[0]-(mu[1]*lam[1]+mu[2]*lam[2]+mu[3]*lam[3])
  nu[1]=mu[0]*lam[1]+mu[1]*lam[0]+mu[2]*lam[3]-mu[3]*lam[2]
  nu[2]=mu[0]*lam[2]-mu[1]*lam[3]+mu[2]*lam[0]+mu[3]*lam[1]
  nu[3]=mu[0]*lam[3]+mu[1]*lam[2]-mu[2]*lam[1]+mu[3]*lam[0]
  return nu

#сопряжённый кватернион
def sopr(mu1):
  nu=[0,0,0,0]
  nu[0]=mu1[0]
  for i in range(1,4):
    nu[i]=-mu1[i]
  return nu

#--------------------------БИКВАТЕРНИОНЫ------------------------------------------ 

#сумма бикватернионов
def sB(l,m):
  glav = summa(l[0],m[0])
  m = summa(l[1],m[1])
  return(glav,m)

print('Сумма бикватернионов:',sB(L,M))

#разность бикватернионов
def rB(l,m):
  glav = raz(l[0],m[0])
  m = raz(l[1],m[1])
  return(glav,m)

print('Разность бикватернионов:',rB(L,M))

#умножение на число бикватернион
def umnachisB(chis,l):
  glav = umnachis(chis,l[0])
  m = umnachis(chis,l[1])
  return(glav,m)

print('Число*бикватернион:',umnachisB(2,L))

#произведение бикватернионов
def multipB(l,m):
  glav = multip(l[0],m[0])
  m = summa(multip(l[1],m[0]), multip(l[0],m[1]))
  return(glav,m)

print('Произведение бикватернионов:',multipB(L,M))

#сопряженный бикватернион 
def soprB(l):
  glav = sopr(l[0])
  m = sopr(l[1])
  return(glav,m)

print('Сопряженный бикватернион :',soprB(L))

#норма бикватерниона
def normB(l):
  return(multipB(soprB(l),l))

print('Норма бикватерниона:',normB(L))

#обратное дуальное
def obrD(l):
  print(l)
  sq = l[0][0]**2
  glav = umnachis((1/sq),l[0])
  m = umnachis((-1/sq),l[1])
  return(glav,m)

#Обратный бикватернион
def obrB(l):
  sopr = soprB(l)
  norma = normB(l)
  obrnorm = obrD(norma)
  k = (multipB(obrnorm,sopr))
  return k

print('Обратный бикватернион:',obrB(L))

print('проверка обратного к бикватерниону =',multipB(obrB(L),L))

# Проверка для нормы 
A = multipB(normB(L), normB(M))
print('Произведение норм:',A)

B = normB(multipB(L,M))
print('Норма произведения:',A)

print('Произведение норм - норма произведения',rB(A,B))

