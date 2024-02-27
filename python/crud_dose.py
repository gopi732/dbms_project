import mysql.connector
import json

# Connect to MySQL database
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="mediMarket"
)
db_cursor = db_connection.cursor()

# Function to create a new dose
def create_dose(dose_data):
    query = "INSERT INTO dose (id, dose_stg, created_by, updated_by, last_updated_date, date_created) VALUES (%s, %s, %s, %s, NOW(), NOW())"
    db_cursor.execute(query, dose_data)
    db_connection.commit()
    print("Dose created successfully")

# Function to read all doses
def read_doses():
    query = "SELECT * FROM dose"
    db_cursor.execute(query)
    doses = db_cursor.fetchall()
    for dose in doses:
        print(dose)

# Function to update a dose
def update_dose(dose_id, new_dose_stg, updated_by):
    query = "UPDATE dose SET dose_stg = %s, updated_by = %s, last_updated_date = NOW() WHERE id = %s"
    db_cursor.execute(query, (new_dose_stg, updated_by, dose_id))
    db_connection.commit()
    print("Dose updated successfully")

# Function to delete a dose
def delete_dose(dose_id):
    query = "DELETE FROM dose WHERE id = %s"
    db_cursor.execute(query, (dose_id,))
    db_connection.commit()
    print("Dose deleted successfully")

# Function to store dose data into a file
def store_dose_data_to_file():
    query = "SELECT * FROM dose"
    db_cursor.execute(query)
    doses = db_cursor.fetchall()
    dose_data = []
    for dose in doses:
        dose_dict = {
            "id": dose[0],
            "dose_stg": dose[1],
            "created_by": dose[2],
            "updated_by": dose[3],
            "last_updated_date": dose[4].isoformat(),
            "date_created": dose[5].isoformat()
        }
        dose_data.append(dose_dict)
    with open('dose_data.json', 'w') as file:
        json.dump(dose_data, file)
    print("Dose data stored in file 'dose_data.json'")

# Main program loop
while True:
    print("\nDose Management Menu:")
    print("1. Create Dose")
    print("2. Read Doses")
    print("3. Update Dose")
    print("4. Delete Dose")
    print("5. Store Dose Data to File")
    print("6. Quit")

    choice = input("Enter your choice: ")

    if choice == '1':
        id = input("Enter dose ID: ")
        dose_stg = input("Enter dose strength: ")
        created_by = input("Enter created by: ")
        updated_by = input("Enter updated by: ")
        create_dose((id, dose_stg, created_by, updated_by))
    elif choice == '2':
        read_doses()
    elif choice == '3':
        dose_id = input("Enter dose ID to update: ")
        new_dose_stg = input("Enter new dose strength: ")
        updated_by = input("Enter updated by: ")
        update_dose(dose_id, new_dose_stg, updated_by)
    elif choice == '4':
        dose_id = input("Enter dose ID to delete: ")
        delete_dose(dose_id)
    elif choice == '5':
        store_dose_data_to_file()
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice. Please enter a number from 1 to 6.")

# Close database connection
db_cursor.close()
db_connection.close()
