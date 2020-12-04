import cx_Oracle
import pandas as pd

"""
Some quick start guides:
* cx_Oracle 8: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
* pandas: https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html
"""
# TODO change path of Oracle Instant Client to yours
cx_Oracle.init_oracle_client(lib_dir = "/Users/allegrapapera/Desktop/python_tutorial/instantclient_19_8")
#cx_Oracle.init_oracle_client(lib_dir = "./instantclient_19_3")

# TODO change credentials
# Connect as user "user" with password "mypass" to the "CSC423" service
# running on lawtech.law.miami.edu
connection = cx_Oracle.connect(
    "alpacsc423", "c07329", "lawtech.law.miami.edu/CSC_423")
cursor = connection.cursor()

print("Enter a number 1-5 to choose which query you would like to execute: \n")
print("1. List all employees working in each outlet and the address where that outlet is located.\n")
print("2. List the names and job titles of staff who work at address 310 E Grand Ave #103, El Segundo, CA 90245\n")
print("3. List the names and phone numbers, and HireAgreement numbers of clients who live in Beverly Hills, CA, 90210.\n")
print("4. List the names and phone numbers of clients who have taken out HireAgreements and finished their rental with an endMileage lower than 20,000.\n")
print("5. Display all HireAgreements for Mid-Size vehicles.\n")

choice = int(input())

if choice == 1:
    cursor.execute("""
        SELECT o.outletNo, s.staffNo, s.firstName, s.lastName, o.address
        FROM Outlets o, Staff s
        WHERE o.outletNo = s.outletNo;
     """)

if choice == 2: 
    cursor.execute("""
        SELECT s.staffNo, s.firstName, s.lastName, s.jobTitle, o.address
        FROM Staff s, Outlets o
        WHERE o.outletNo = s.outletNo AND o.address = '310 E Grand Ave #103, El Segundo, CA 90245';
     """)

if choice == 3:
    cursor.execute("""
        SELECT c.clientNo, c.firstName, c.lastName, c.phoneNo, h.hireNo
        FROM Clients c, HireAgreements h
        WHERE (c.address LIKE '%Beverly Hills, CA, 90210%') AND h.clientNo = c.clientNo;
     """)

if choice == 4:
    cursor.execute("""
        SELECT c.firstName, c.lastName, c.phoneNo, h.endMileage
        FROM Clients c, HireAgreements h
        WHERE (h.endMileage < 20000) AND (c.clientNo = h.clientNo);
    """)

if choice == 5:
    cursor.execute("""
        SELECT h.hireNo, h.clientNo, h.firstName, h.lastName, h.model, h.make, v.carSize
        FROM HireAgreements h, Vehicles v
        WHERE (h.registrationNo = v.registrationNo) AND (v.carSize LIKE '%Mid-size%');
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)
# print(df['FIRST_NAME']) # example to extract a column

