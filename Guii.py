import tkinter as tk
import sqlite3
from tkinter import ttk
##############################################################

#функция добавления записей, здесь выбираем в какую табличку добавляем запись

def adder():
    rootk = tk.Tk()
    rootk.title('Dva')
    rootk.geometry("330x250+150+200")


    btnk=tk.Button(rootk, text='Добавить Машину', command=add_auto) #добавить запись
    btnk.pack()

    btnk1 = tk.Button(rootk, text='Добавить клиента', command=add_client)  # добавить запись
    btnk1.pack()

    btnk2 = tk.Button(rootk, text='Добавить сотрудника', command=add_employee)  # добавить запись
    btnk2.pack()

    btnk3 = tk.Button(rootk, text='Добавить сервисный ордер', command=add_auto)  # добавить запись
    btnk3.pack()

    btnk4 = tk.Button(rootk, text='Добавить инцидент', command=add_auto)  # добавить запись
    btnk4.pack()

    btnk5 = tk.Button(rootk, text='Добавить сотрудника на выезд', command=add_auto)  # добавить запись
    btnk5.pack()

    btnk6 = tk.Button(rootk, text='Заказ', command=add_auto)  # добавить запись
    btnk6.pack()


    btn_ex=ttk.Button(rootk, text='Back', command = rootk.destroy)
    btn_ex.pack()


def add_auto():
    root1 = tk.Tk()
    root1.title('Auto Adder')
    root1.geometry("330x250+150+200")
    ee=tk.StringVar()
    ee1 = tk.StringVar()
    ee2 = tk.StringVar()

    e=tk.Entry(root1, textvariable=ee)#работает
    e.pack()
    e1 = tk.Entry(root1,textvariable=ee1)  # работает
    e1.pack()
    e2 = tk.Entry(root1,textvariable=ee2)  # работает
    e2.pack()
    # кнопка добавить запись
    btn_conf = ttk.Button(root1, text='Add')
    btn_conf.place(x=220, y=170)
    btn_conf.bind('<Button-1>', lambda event: rec(e.get(), e1.get(), e2.get()))
    btn_conf.pack()
    btn_ex = tk.Button(root1, text='Exit', command=root1.destroy)
    btn_ex.pack()
    #кнопка выход из окна
    root.mainloop()


def rec(q,qq,qqq):
    db.insert_data(q,qq,qqq)
    view()
    root.mainloop()


def view():
    db.c.execute('''SELECT * FROM automob''')
    [tree.delete(i) for i in tree.get_children()]
    [tree.insert('', 'end', values=row) for row in db.c.fetchall()]



def add_client():
    root1 = tk.Tk()
    root1.title('Client Adder')
    root1.geometry("500x350+150+200")
    id0=tk.StringVar()
    fname0 = tk.StringVar()
    lname0 = tk.StringVar()
    sname0=tk.StringVar()
    passid0=tk.StringVar()
    hiredate0=tk.StringVar()
    birthdate0=tk.StringVar()
    contrid0=tk.StringVar()
    licd0=tk.StringVar()


    l1 = tk.Label(root1, text='ID клиента')
    l1.place(x=20,y=10)
    id=tk.Entry(root1, textvariable=id0)#работает
    id.place(x=190,y=13)



    l2 = tk.Label(root1, text='Фамилия клиента')
    l2.place(x=20, y=40)
    fname = tk.Entry(root1, textvariable=fname0)  # работает
    fname.place(x=190,y=41)



    l3 = tk.Label(root1, text='Имя клиента')
    l3.place(x=20, y=80)
    lname = tk.Entry(root1, textvariable=lname0)  # работает
    lname.place(x=190,y=80)



    l4 = tk.Label(root1, text='Отчество клиента')
    l4.place(x=20, y=110)
    sname=tk.Entry(root1, textvariable=sname0)#работает
    sname.place(x=190,y=110)

    l5 = tk.Label(root1, text='Pass ID')
    l5.place(x=20, y=140)
    passid=tk.Entry(root1, textvariable=passid0)#работает
    passid.place(x=190,y=140)



    l6 = tk.Label(root1, text='ID контракта')
    l6.place(x=20, y=170)
    hiredate=tk.Entry(root1, textvariable=hiredate0)#работает
    hiredate.place(x=190,y=170)



    l7 = tk.Label(root1, text='Дата Рождения')
    l7.place(x=20, y=200)
    birthdate=tk.Entry(root1, textvariable=birthdate0)#работает
    birthdate.place(x=190,y=200)


    l8 = tk.Label(root1, text='Номер вод. удостоверения')
    l8.place(x=20, y=230)
    contrid=tk.Entry(root1, textvariable=contrid0)#работает
    contrid.place(x=190, y=230)


def add_employee():
    root1 = tk.Tk()
    root1.title('Employee Adder')
    root1.geometry("500x350+150+200")
    id0 = tk.StringVar()
    fname0 = tk.StringVar()
    lname0 = tk.StringVar()
    sname0 = tk.StringVar()
    passid0 = tk.StringVar()
    hiredate0 = tk.StringVar()
    birthdate0 = tk.StringVar()
    contrid0 = tk.StringVar()
    licd0 = tk.StringVar()

    l1 = tk.Label(root1, text='ID сотрудника')
    l1.place(x=20, y=10)
    id = tk.Entry(root1, textvariable=id0)  # работает
    id.place(x=190, y=13)

    l2 = tk.Label(root1, text='Фамилия сотрудника')
    l2.place(x=20, y=40)
    fname = tk.Entry(root1, textvariable=fname0)  # работает
    fname.place(x=190, y=41)

    l3 = tk.Label(root1, text='Имя сотрудника')
    l3.place(x=20, y=80)
    lname = tk.Entry(root1, textvariable=lname0)  # работает
    lname.place(x=190, y=80)

    l4 = tk.Label(root1, text='Отчество сотрудника')
    l4.place(x=20, y=110)
    sname = tk.Entry(root1, textvariable=sname0)  # работает
    sname.place(x=190, y=110)

    l5 = tk.Label(root1, text='Pass ID')
    l5.place(x=20, y=140)
    passid = tk.Entry(root1, textvariable=passid0)  # работает
    passid.place(x=190, y=140)

    l6 = tk.Label(root1, text='Hire дата')
    l6.place(x=20, y=170)
    hiredate = tk.Entry(root1, textvariable=hiredate0)  # работает
    hiredate.place(x=190, y=170)

    l7 = tk.Label(root1, text='Дата Рождения')
    l7.place(x=20, y=200)
    birthdate = tk.Entry(root1, textvariable=birthdate0)  # работает
    birthdate.place(x=190, y=200)

    l8 = tk.Label(root1, text='ID контракта')
    l8.place(x=20, y=230)
    contrid = tk.Entry(root1, textvariable=contrid0)  # работает
    contrid.place(x=190, y=230)

    l9=tk.Label(root1, text='Номер вод. удостоверения')
    l8.place(x=20, y=260)
    licid=tk.Entry(root1, textvariable=licd0)
    licid.place(x=190,y=260)

    # кнопка добавить запись
    btn_conf = ttk.Button(root1, text='Добавить')
    btn_conf.place(x=130, y=300)
    #btn_conf.bind('<Button-1>', lambda event: rec(id.get(), fname.get(), lname.get(),sname.get(),passid.get(), hiredate.get(), birthdate.get(),contrid.get()))
    #btn_conf.pack()
    btn_ex = tk.Button(root1, text='Назад', command=root1.destroy)
    btn_ex.place(x=300, y=297)
    #кнопка выход из окна
    root.mainloop()




#ервисный ордер, выбирается 





###################################################################











##изменение записей в таблице

def changer():
    root=tk.Tk()
    root.title('Vi eblan?')
    lbl = tk.Label(root, text='Vi dolboeb')
    lbl.grid()


class DB :
    def __init__(self):
        self.conn = sqlite3.connect('automob.sql')
        self.c = self.conn.cursor()
        self.c.execute(
            '''CREATE TABLE IF NOT EXISTS automob (id integer primary key, description text, costs text, total text)''')
        self.conn.commit()

    def insert_data(self, description, costs, total):
        self.c.execute('''INSERT INTO automob(description, costs, total) VALUES (?, ?, ?)''',
                       (description, costs, total))
        self.conn.commit()

root = tk.Tk()
root.title('DataBaser')
root.geometry()

db = DB()

tree = ttk.Treeview(root, columns=('description', 'costs', 'total'), height=15, show='headings')

#tree.column('ID', width=30, anchor=tk.CENTER)
tree.column('description', width=365, anchor=tk.CENTER)
tree.column('costs', width=150, anchor=tk.CENTER)
tree.column('total', width=100, anchor=tk.CENTER)

#tree.heading('ID', text='ID')
tree.heading('description', text='Наименование')
tree.heading('costs', text='Статья дохода\расхода')
tree.heading('total', text='Сумма')

tree.pack()



btn1 = tk.Button(root, text='JOP', command=adder) #добавление записи в таблицу, далее выбираем в какую

btn2= tk.Button(root, text = 'Change', command=changer) #изменение записи в таблице

btn3=tk.Button(root, text='Delete') #удаление записи в таблице

btn1.pack()
btn2.pack()
btn3.pack()



root.mainloop()
