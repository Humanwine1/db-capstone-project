import ctypes
ctypes.windll.user32.ShowWindow(ctypes.windll.kernel32.GetConsoleWindow(), 0)

import os
from dotenv import load_dotenv
load_dotenv()

import mysql.connector
import tkinter as tk
#from tkinter import messagebox

user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")


def connect_to_db():
    cnx = mysql.connector.connect(
        user="user",
        password="password",
        database="LittleLemonDB"
    )
    return cnx

class BookingApp(tk.Tk):
    def add_booking_popup(self):
        def submit():
            table_no = table_no_var.get()
            booking_date = booking_date_var.get()
            guest_first_name = guest_first_name_var.get()
            guest_last_name = guest_last_name_var.get()

            cursor = connection.cursor()
            cursor.callproc("AddValidBooking", [booking_date, table_no, guest_first_name, guest_last_name])
            connection.commit()
            cursor.close()

            result_label.config(text="Booking added successfully")
            self.after(3000, popup.destroy)

        popup = tk.Toplevel(self)
        popup.title("Add Booking")
        popup.geometry("300x300")

        table_no_var = tk.IntVar()
        booking_date_var = tk.StringVar()
        guest_first_name_var = tk.StringVar()
        guest_last_name_var = tk.StringVar()

        tk.Label(popup, text="Table No:").pack()
        tk.Entry(popup, textvariable=table_no_var).pack()
  
        tk.Label(popup, text="Booking Date (YYYY-MM-DD):").pack()
        tk.Entry(popup, textvariable=booking_date_var).pack()

        tk.Label(popup, text="Guest First Name:").pack()
        tk.Entry(popup, textvariable=guest_first_name_var).pack()

        tk.Label(popup, text="Guest Last Name:").pack()
        tk.Entry(popup, textvariable=guest_last_name_var).pack()

        submit_btn = tk.Button(popup, text="Submit", command=submit)
        submit_btn.pack()

        result_label = tk.Label(popup, text="")
        result_label.pack()

    def update_booking_popup(self):
        def submit():
            booking_id = booking_id_var.get()
            new_booking_date = new_booking_date_var.get()

            cursor = connection.cursor()
            cursor.callproc("UpdateBooking", [booking_id, new_booking_date])
            connection.commit()
            cursor.close()

            result_label.config(text="Booking updated successfully")
            popup.after(3000, popup.destroy)

        popup = tk.Toplevel(self)
        popup.title("Update Booking")
        popup.geometry("300x200")

        booking_id_var = tk.IntVar()
        new_booking_date_var = tk.StringVar()

        tk.Label(popup, text="Booking ID:").pack()
        tk.Entry(popup, textvariable=booking_id_var).pack()

        tk.Label(popup, text="New Booking Date (YYYY-MM-DD):").pack()
        tk.Entry(popup, textvariable=new_booking_date_var).pack()

        submit_btn = tk.Button(popup, text="Submit", command=submit)
        submit_btn.pack()

        result_label = tk.Label(popup, text="")
        result_label.pack()

    def cancel_booking_popup(self):
        def submit():
            booking_id = booking_id_var.get()

            cursor = connection.cursor()
            cursor.callproc("CancelBooking", [booking_id])
            connection.commit()
            cursor.close()

            result_label.config(text="Booking cancelled successfully")
            popup.after(3000, popup.destroy)

        popup = tk.Toplevel(self)
        popup.title("Cancel Booking")
        popup.geometry("300x200")

        booking_id_var = tk.IntVar()

        tk.Label(popup, text="Booking ID:").pack()
        tk.Entry(popup, textvariable=booking_id_var).pack()

        submit_btn = tk.Button(popup, text="Submit", command=submit)
        submit_btn.pack()

        result_label = tk.Label(popup, text="")
        result_label.pack()

    def __init__(self):
        super().__init__()

        self.title("Booking App")
        self.geometry("1x1+-1000+-1000") #hide window

        self.show_main_popup()

    def show_main_popup(self):
        popup = tk.Toplevel(self)
        popup.title("Booking Options")
        popup.geometry("300x200")

        add_booking_btn = tk.Button(popup, text="Add Booking", command=self.add_booking_popup)
        add_booking_btn.pack(pady=5)

        update_booking_btn = tk.Button(popup, text="Update Booking", command=self.update_booking_popup)
        update_booking_btn.pack(pady=5)

        cancel_booking_btn = tk.Button(popup, text="Cancel Booking", command=self.cancel_booking_popup)
        cancel_booking_btn.pack(pady=5)

if __name__ == "__main__":
    connection = connect_to_db()

    app = BookingApp()
    app.mainloop()

    connection.close()
