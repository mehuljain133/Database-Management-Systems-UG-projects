# Relation data model: Relational model concepts, relational constraints, relational algebra

# Relational Data Model Simulator in Python

from copy import deepcopy

# ----------- RELATION CLASS (RELATION CONCEPT) -----------

class Relation:
    def __init__(self, name, attributes, primary_key):
        self.name = name
        self.attributes = attributes
        self.primary_key = primary_key
        self.tuples = []

    # ----------- Insert with Constraints -----------
    def insert(self, tuple_data):
        # Domain constraint
        if set(tuple_data.keys()) != set(self.attributes):
            raise ValueError(f"Attribute mismatch in {self.name}")

        # Primary key constraint
        for t in self.tuples:
            if all(t[k] == tuple_data[k] for k in self.primary_key):
                raise ValueError("Primary key violation.")

        self.tuples.append(deepcopy(tuple_data))

    # ----------- Projection (π) -----------
    def project(self, attrs):
        projected = Relation(f"π_{attrs}_{self.name}", attrs, [])
        seen = set()
        for t in self.tuples:
            proj_tuple = {k: t[k] for k in attrs}
            tup_tuple = tuple(proj_tuple.items())
            if tup_tuple not in seen:
                projected.tuples.append(proj_tuple)
                seen.add(tup_tuple)
        return projected

    # ----------- Selection (σ) -----------
    def select(self, condition):
        selected = Relation(f"σ_{self.name}", self.attributes, self.primary_key)
        for t in self.tuples:
            if condition(t):
                selected.tuples.append(deepcopy(t))
        return selected

    # ----------- Rename (ρ) -----------
    def rename(self, new_name):
        renamed = Relation(new_name, self.attributes, self.primary_key)
        renamed.tuples = deepcopy(self.tuples)
        return renamed

    # ----------- Union (∪) -----------
    def union(self, other):
        if self.attributes != other.attributes:
            raise ValueError("Union error: schema mismatch")
        unioned = Relation(f"{self.name}_UNION_{other.name}", self.attributes, self.primary_key)
        all_tuples = {tuple(sorted(t.items())) for t in self.tuples + other.tuples}
        for t in all_tuples:
            unioned.tuples.append(dict(t))
        return unioned

    # ----------- Difference (-) -----------
    def difference(self, other):
        if self.attributes != other.attributes:
            raise ValueError("Difference error: schema mismatch")
        diff = Relation(f"{self.name}_DIFF_{other.name}", self.attributes, self.primary_key)
        other_tuples = {tuple(sorted(t.items())) for t in other.tuples}
        for t in self.tuples:
            if tuple(sorted(t.items())) not in other_tuples:
                diff.tuples.append(deepcopy(t))
        return diff

    # ----------- Cartesian Product (×) -----------
    def cartesian_product(self, other):
        attrs = [f"{self.name}.{a}" for a in self.attributes] + [f"{other.name}.{a}" for a in other.attributes]
        product = Relation(f"{self.name}_X_{other.name}", attrs, [])
        for t1 in self.tuples:
            for t2 in other.tuples:
                combined = {f"{self.name}.{k}": v for k, v in t1.items()}
                combined.update({f"{other.name}.{k}": v for k, v in t2.items()})
                product.tuples.append(combined)
        return product

    # ----------- Natural Join (⨝) -----------
    def natural_join(self, other):
        join_attrs = set(self.attributes) & set(other.attributes)
        new_attrs = self.attributes + [a for a in other.attributes if a not in join_attrs]
        joined = Relation(f"{self.name}_JOIN_{other.name}", new_attrs, [])
        for t1 in self.tuples:
            for t2 in other.tuples:
                if all(t1[a] == t2[a] for a in join_attrs):
                    combined = deepcopy(t1)
                    for a in other.attributes:
                        if a not in join_attrs:
                            combined[a] = t2[a]
                    joined.tuples.append(combined)
        return joined

    # ----------- Display -----------
    def show(self):
        print(f"\nRelation: {self.name}")
        print("Attributes:", self.attributes)
        for t in self.tuples:
            print(t)

# ----------- DEMO: USING RELATIONS, CONSTRAINTS & ALGEBRA -----------

# Create Relations
Student = Relation("Student", ["id", "name", "dept"], primary_key=["id"])
Department = Relation("Department", ["dept", "head"], primary_key=["dept"])

# Insert tuples
Student.insert({"id": 1, "name": "Asha", "dept": "CS"})
Student.insert({"id": 2, "name": "Ravi", "dept": "Math"})

Department.insert({"dept": "CS", "head": "Dr. Rao"})
Department.insert({"dept": "Math", "head": "Dr. Singh"})

# Constraints check: this will fail (duplicate ID)
# Student.insert({"id": 1, "name": "Mira", "dept": "Physics"})

# Selection σ (students in CS)
cs_students = Student.select(lambda t: t["dept"] == "CS")
cs_students.show()

# Projection π (only names)
names = Student.project(["name"])
names.show()

# Join ⨝ (Student ⨝ Department)
enriched = Student.natural_join(Department)
enriched.show()

# Union ∪ (must be same schema)
ExtraStudents = Relation("Extra", ["id", "name", "dept"], primary_key=["id"])
ExtraStudents.insert({"id": 3, "name": "Neha", "dept": "CS"})
unioned = Student.union(ExtraStudents)
unioned.show()

# Difference - (students not in CS)
not_cs = Student.difference(cs_students)
not_cs.show()
