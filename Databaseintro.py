# Introduction to databases: Characteristics of database approach, data models, database system architecture, data independence and data abstraction.

# Simulated Mini-Relational DBMS in Python

# ---------- Data Abstraction Layers ----------

# Internal Level (Physical Storage Simulation)
class Storage:
    def __init__(self):
        self.disk = {}  # Simulated disk with tables as keys

    def write(self, table_name, data):
        self.disk[table_name] = data

    def read(self, table_name):
        return self.disk.get(table_name, [])

# Conceptual Level (Logical Schema)
class Schema:
    def __init__(self):
        self.schemas = {}

    def define_table(self, table_name, columns):
        self.schemas[table_name] = columns

    def get_schema(self, table_name):
        return self.schemas.get(table_name)

# External Level (User Views)
class View:
    def __init__(self, db):
        self.db = db

    def query(self, table_name, condition=lambda row: True):
        table = self.db.read_table(table_name)
        return [row for row in table if condition(row)]

# ---------- Database Engine (DBMS Core) ----------

class MiniDBMS:
    def __init__(self):
        self.storage = Storage()
        self.schema = Schema()

    # Define table schema (data model)
    def create_table(self, table_name, columns):
        self.schema.define_table(table_name, columns)
        self.storage.write(table_name, [])
        print(f"Table '{table_name}' created with columns {columns}.")

    # Insert data (characteristic: persistent, consistent)
    def insert(self, table_name, row):
        columns = self.schema.get_schema(table_name)
        if set(row.keys()) != set(columns):
            raise ValueError("Row doesn't match schema.")
        table = self.storage.read(table_name)
        table.append(row)
        self.storage.write(table_name, table)
        print(f"Inserted into '{table_name}': {row}")

    # Read data (abstraction through View)
    def read_table(self, table_name):
        return self.storage.read(table_name)

    # Update schema (data independence)
    def add_column(self, table_name, column_name, default=None):
        columns = self.schema.get_schema(table_name)
        if column_name in columns:
            raise ValueError("Column already exists.")
        columns.append(column_name)
        self.schema.define_table(table_name, columns)
        # Update stored rows
        table = self.storage.read(table_name)
        for row in table:
            row[column_name] = default
        self.storage.write(table_name, table)
        print(f"Added column '{column_name}' to '{table_name}'.")

# ---------- Usage Example ----------

db = MiniDBMS()

# Create table (define data model)
db.create_table("students", ["id", "name", "age"])

# Insert rows (data persistence)
db.insert("students", {"id": 1, "name": "Asha", "age": 20})
db.insert("students", {"id": 2, "name": "Ravi", "age": 22})

# Query through external view (abstraction)
view = View(db)
results = view.query("students", condition=lambda r: r["age"] > 20)
print("\n[Students over age 20]:", results)

# Modify schema (demonstrating data independence)
db.add_column("students", "grade", default="B")

# See updated table
print("\n[All Students after schema change]:", db.read_table("students"))
