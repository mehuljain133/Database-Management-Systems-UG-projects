# Database design: Mapping ER/EER model to relational database, functional dependencies,Lossless decomposition, Normal forms

from itertools import combinations

# ------------ 1. EER to Relational Mapping ------------

class Entity:
    def __init__(self, name, attributes, primary_key):
        self.name = name
        self.attributes = attributes
        self.primary_key = primary_key

    def to_relation(self):
        return {
            "name": self.name,
            "attributes": self.attributes,
            "primary_key": self.primary_key
        }

# EER Model Example
Student = Entity("Student", ["id", "name", "dept", "advisor"], primary_key=["id"])
Department = Entity("Department", ["dept", "head"], primary_key=["dept"])

entities = [Student, Department]

# ------------ 2. Functional Dependencies ------------

# Format: (LHS, RHS)
fd_set = [
    ({"id"}, {"name", "dept", "advisor"}),  # id → name, dept, advisor
    ({"dept"}, {"head"}),                   # dept → head
]

# ------------ 3. Closure of Attributes ------------

def closure(attrs, fds):
    result = set(attrs)
    changed = True
    while changed:
        changed = False
        for lhs, rhs in fds:
            if lhs.issubset(result) and not rhs.issubset(result):
                result |= rhs
                changed = True
    return result

# ------------ 4. Lossless Join Test (binary decomposition) ------------

def is_lossless(r1, r2):
    common_attrs = set(r1["attributes"]) & set(r2["attributes"])
    if not common_attrs:
        return False

    # If common attributes form a key in either relation, it's lossless
    return (set(r1["primary_key"]).issubset(common_attrs) or
            set(r2["primary_key"]).issubset(common_attrs))

# ------------ 5. Normal Forms Checking ------------

def is_2NF(relation, fds):
    pk = set(relation["primary_key"])
    for lhs, rhs in fds:
        for attr in rhs:
            if attr not in lhs and attr not in pk:
                if lhs < pk:  # Partial dependency
                    return False
    return True

def is_3NF(relation, fds):
    pk = set(relation["primary_key"])
    for lhs, rhs in fds:
        for attr in rhs:
            if not (
                attr in lhs or
                set(lhs).issuperset(pk) or
                is_superkey(lhs, relation, fds)
            ):
                return False
    return True

def is_bcnf(relation, fds):
    for lhs, rhs in fds:
        if not is_superkey(lhs, relation, fds):
            return False
    return True

# Helper: Is superkey
def is_superkey(attrs, relation, fds):
    attr_closure = closure(attrs, fds)
    return set(relation["attributes"]).issubset(attr_closure)

# ------------ 6. Demonstration ------------

print("=== ER to Relational Tables ===")
for entity in entities:
    rel = entity.to_relation()
    print(f"Table: {rel['name']} ({', '.join(rel['attributes'])}), PK: {rel['primary_key']}")

print("\n=== Functional Dependencies ===")
for lhs, rhs in fd_set:
    print(f"{' '.join(lhs)} → {' '.join(rhs)}")

print("\n=== Closure of {id} ===")
print(closure({"id"}, fd_set))

print("\n=== Lossless Decomposition Test ===")
r1 = Student.to_relation()
r2 = Department.to_relation()
print("Lossless:", is_lossless(r1, r2))

print("\n=== Normal Form Checks for Student ===")
print("2NF:", is_2NF(r1, fd_set))
print("3NF:", is_3NF(r1, fd_set))
print("BCNF:", is_bcnf(r1, fd_set))
