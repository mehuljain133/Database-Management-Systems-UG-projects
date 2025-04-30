# Transaction and data storage: Introduction to transaction processing: ACID properties,concurrency control; Introduction to indexing structures for files

import threading
from time import sleep
from collections import defaultdict

# ---------------- 1. TRANSACTION PROCESSING & ACID ----------------

class TransactionManager:
    def __init__(self):
        self.database = {'x': 100, 'y': 200}
        self.log = []
        self.locks = defaultdict(lambda: None)  # data_item -> transaction_id

    def begin(self, tid):
        self.log.append((tid, 'BEGIN'))
        print(f"T{tid} begins.")

    def read(self, tid, item):
        if self.locks[item] in (None, tid):
            self.locks[item] = tid
            val = self.database[item]
            self.log.append((tid, 'READ', item, val))
            print(f"T{tid} reads {item} = {val}")
            return val
        else:
            raise Exception(f"T{tid} blocked: {item} is locked by T{self.locks[item]}")

    def write(self, tid, item, val):
        if self.locks[item] != tid:
            raise Exception(f"T{tid} cannot write {item} without lock.")
        self.database[item] = val
        self.log.append((tid, 'WRITE', item, val))
        print(f"T{tid} writes {item} = {val}")

    def commit(self, tid):
        self.log.append((tid, 'COMMIT'))
        print(f"T{tid} commits.")
        # Release locks
        for item in self.locks:
            if self.locks[item] == tid:
                self.locks[item] = None

# ---------------- 2. CONCURRENCY CONTROL ----------------

# Simple transaction simulation with concurrency
def transaction1(tm: TransactionManager):
    tid = 1
    try:
        tm.begin(tid)
        x = tm.read(tid, 'x')
        tm.write(tid, 'x', x + 10)
        tm.commit(tid)
    except Exception as e:
        print(f"T{tid} aborted:", e)

def transaction2(tm: TransactionManager):
    tid = 2
    try:
        tm.begin(tid)
        y = tm.read(tid, 'y')
        tm.write(tid, 'y', y - 20)
        tm.commit(tid)
    except Exception as e:
        print(f"T{tid} aborted:", e)

# ---------------- 3. SERIALIZABILITY (Conflict Graph) ----------------

def conflict_serializable(schedule):
    graph = defaultdict(set)
    for i, (ti, opi, datai, _) in enumerate(schedule):
        for j in range(i+1, len(schedule)):
            tj, opj, dataj, _ = schedule[j]
            if ti != tj and datai == dataj:
                if opi == 'WRITE' or opj == 'WRITE':
                    graph[ti].add(tj)
    # Cycle detection
    visited = set()
    stack = set()

    def dfs(v):
        visited.add(v)
        stack.add(v)
        for neighbor in graph[v]:
            if neighbor in stack or (neighbor not in visited and dfs(neighbor)):
                return True
        stack.remove(v)
        return False

    return not any(dfs(v) for v in graph)

# ---------------- 4. INDEXING STRUCTURE ----------------

class SimpleIndex:
    def __init__(self):
        self.index = {}  # key -> file offset (simulated)

    def insert(self, key, offset):
        self.index[key] = offset
        print(f"Index: {key} -> {offset}")

    def search(self, key):
        return self.index.get(key, None)

# ---------------- MAIN DEMO ----------------

print("=== Transaction Processing Simulation ===")
tm = TransactionManager()
t1 = threading.Thread(target=transaction1, args=(tm,))
t2 = threading.Thread(target=transaction2, args=(tm,))
t1.start()
t2.start()
t1.join()
t2.join()

print("\n=== Transaction Log ===")
for log in tm.log:
    print(log)

print("\n=== Conflict Serializability ===")
conflict_ops = [log for log in tm.log if log[1] in ('READ', 'WRITE')]
serializable = conflict_serializable(conflict_ops)
print("Conflict Serializable:", serializable)

print("\n=== Indexing Structure ===")
idx = SimpleIndex()
idx.insert("Asha", 120)
idx.insert("Ravi", 200)
print("Search Ravi:", idx.search("Ravi"))
