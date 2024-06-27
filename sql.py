import os

day = input("Введите номер дня: ")
ex = input("Введите количество заданий: ")

def sql_dir():
    for i in range(int(ex)):
        os.mkdir(f"ex{i:02}")
        text_file = open(f"ex{i:02}//day{int(day):02}_ex{i:02}.sql", "w")

sql_dir()