from sympy import Quaternion, transpose

a = (Quaternion(1, 3, 5, 7), Quaternion(9, 11, 13, 15))
b = (Quaternion(4, 3, 2, 1), Quaternion(1, 2, 3, 4))


def sum(a, b):  # Сумма бикватернионов.
    return a[0] + b[0], a[1] + b[1]


def mult_scalar(a, scalyar):  # Умножение на скаляр.
    return a[0] * scalyar, a[1] * scalyar

def mult(a, b):  # Произведение бикватернионов.
    glavn = a[0] * b[0]
    vt = a[0] * b[1] + a[1] * b[0]
    return glavn, vt


def conj(a):  # Сопряженный бикватернион.
    return a[0].conjugate(), a[1].conjugate()

    
def proverka(a,b):  # Проверка (исходный * обратный), получим ед и нули.
    return a[0] * a[0].inverse(), a[1] * a[1].inverse(), b[0] * b[0].inverse(), b[1] * b[1].inverse(),





print("Первый бикватернион = ", a)
print("Второй бикватернион = ", b)
print("Сумма бикватернионов = ", sum(a, b))
print("Умножение на скаляр первого =", mult_scalar(a, 5))
print("Умножение на скаляр второго =", mult_scalar(b, 5))
print("Сопряженный бикватернион первому= ", conj(a))
print("Сопряженный бикватернион второму= ", conj(b))
print("Проверка = ", proverka(a,b))
print("Произведение бикватернионов = ", mult(a, b))
