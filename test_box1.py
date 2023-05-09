import mysql.connector
import tkinter as tk
from tkinter import messagebox

import mysql.connector

#define functions to addbookings, updatebookings, cancelbookings procedures

def connect_to_db():
    cnx = mysql.connector.connect(
        user="root",
        password="Punkstat1kParanoia",
        database="LittleLemonDB"
    )
    return cnx

#test connection to db
def test_connection():
    connection = connect_to_db()
    connection.close()
    print("Connection successful")


def add_booking():
    table_no = int(input("Enter table number: "))
    booking_date = input("Enter booking date (YYYY-MM-DD): ")

    #call proc
    cursor = connection.cursor()
    cursor.callproc("AddValidBooking", [booking_date, table_no])
    connection.commit()
    cursor.close()

    print("Booking added successfully")

def update_booking():
    booking_id = int(input("Enter Booking ID: "))
    new_booking_date = input("Enter New Booking Date (YYYY-MM-DD): ")

    #call proc
    cursor = connection.cursor()
    cursor.callproc("UpdateBooking", [booking_id, new_booking_date])
    connection.commit()
    cursor.close()

    print("Booking updated successfully")

def cancel_booking():
    booking_id = int(input("Enter Booking ID: "))

    #call proc
    cursor = connection.cursor()
    cursor.callproc("CancelBooking", [booking_id])
    connection.commit()
    cursor.close()

    print("Booking cancelled successfully")

if __name__ == "__main__":

    connection = connect_to_db()

    add_booking()
    update_booking()
    cancel_booking()

    connection.close()

####################

class BookingApp(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Booking App")
        self.geometry("300x200")

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


####################

if __name__ == "__main__":
    # Connect to the database
    connection = connect_to_db()

    # Start the application
    app = BookingApp()
    app.mainloop()

    # Close the connection
    connection.close()
