# Data modeling: Entity relationship (ER) modeling: Entity types, relationships, constraints, ER diagrams, EER model 

# Simulated ER & EER Modeling in Python

# ----------- ENTITY TYPES -----------

class Entity:
    def __init__(self, name, attributes):
        self.name = name
        self.attributes = attributes  # List of attribute names
        self.instances = []

    def add_instance(self, data):
        if set(data.keys()) != set(self.attributes):
            raise ValueError(f"Attributes mismatch in {self.name}")
        self.instances.append(data)

    def __str__(self):
        return f"Entity({self.name}) with attributes {self.attributes}"

# ----------- RELATIONSHIPS -----------

class Relationship:
    def __init__(self, name, entities, cardinality, participation):
        self.name = name
        self.entities = entities  # List of Entity objects
        self.cardinality = cardinality  # e.g., ("1", "N")
        self.participation = participation  # e.g., ("total", "partial")
        self.pairs = []

    def relate(self, instance1, instance2):
        self.pairs.append((instance1, instance2))

    def __str__(self):
        return (f"Relationship({self.name}) between {[e.name for e in self.entities]} "
                f"with cardinality {self.cardinality} and participation {self.participation}")

# ----------- SPECIALIZATION / INHERITANCE (EER Model) -----------

class SubEntity(Entity):
    def __init__(self, name, parent_entity, extra_attributes):
        super().__init__(name, parent_entity.attributes + extra_attributes)
        self.parent = parent_entity

# ----------- Example ER Model -----------

# Entities
Person = Entity("Person", ["id", "name", "age"])
Car = Entity("Car", ["plate", "model", "owner_id"])  # owner_id links to Person

# Relationship: Owns (1 Person : N Cars)
Owns = Relationship("Owns", [Person, Car], cardinality=("1", "N"), participation=("total", "partial"))

# Add data to entities
Person.add_instance({"id": 1, "name": "Ravi", "age": 30})
Person.add_instance({"id": 2, "name": "Neha", "age": 25})

Car.add_instance({"plate": "KA123", "model": "Honda", "owner_id": 1})
Car.add_instance({"plate": "MH456", "model": "Hyundai", "owner_id": 2})

# Relating Persons and Cars
Owns.relate(Person.instances[0], Car.instances[0])
Owns.relate(Person.instances[1], Car.instances[1])

# ----------- EER: Specialization Example -----------

# Subclass of Person → Employee (Specialization)
Employee = SubEntity("Employee", Person, extra_attributes=["salary", "position"])
Employee.add_instance({"id": 3, "name": "Karan", "age": 35, "salary": 50000, "position": "Manager"})

# ----------- Display Output -----------

print(Person)
print(Car)
print(Owns)
print("\n-- Person Instances --")
for p in Person.instances:
    print(p)

print("\n-- Car Instances --")
for c in Car.instances:
    print(c)

print("\n-- Owns Relationships --")
for r in Owns.pairs:
    print(f"{r[0]['name']} owns {r[1]['model']}")

print("\n-- Employee Subclass (Specialized Entity) --")
for e in Employee.instances:
    print(e)
