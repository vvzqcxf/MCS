# Vertex Cover Problem Solver using Quantum Annealing

This project demonstrates how to solve the **Vertex Cover Problem (VCP)** using a **QUBO model** and **simulated annealing**, leveraging D-Wave's Ocean SDK.

## Problem Description

The Vertex Cover Problem is a classical NP-complete problem. Given an undirected graph $G = (V, E)$, the goal is to find a subset $C \subseteq V$ such that every edge $(u, v) \in E$ has at least one endpoint in $C$.

In this project, we model VCP as a **Quadratic Unconstrained Binary Optimization (QUBO)** problem and use **SimulatedAnnealingSampler** to find an approximate minimum vertex cover.



## QUBO Model

The QUBO objective function is defined as:

$H(x) = \sum_{i \in V} x_i + A \sum_{(u,v) \in E} (1 - x_u - x_v + x_u x_v)$

- \( x_i = 1 \) if vertex \( i \) is included in the cover, 0 otherwise.
- \( A \) is a penalty coefficient ensuring constraint satisfaction.



## Dataset

The input graph is read from `keller4.mis` and other dataset, a `.mis` format file with edges listed per line after a header.



## Installation

To set up the environment for solving QUBO problems using simulated annealing on D-Wave’s software stack, please install the required packages below.

Install required packages with the following commands:

```bash
!pip install dwave-ocean-sdk
!pip install pyqubo

from pyqubo import Binary
import networkx as nx
from pyqubo import Binary
import networkx as nx
```

## Graph Construction

The following code reads a `.mis` format file (e.g., `keller6.mis`) and constructs a graph object using the `networkx` library.

```python
path = f'/content/keller6.mis' 
instance = [] 

with open(path) as f:
    for line in f.readlines():
        first_node = line.split()[1]   
        second_node = line.split()[2]  

        if len(instance) != 0:
            first_node = int(first_node)
            second_node = int(second_node)

        edge = (first_node, second_node)
        instance.append(edge)

instance.pop(0)  

import networkx as nx
G = nx.Graph()
G.add_edges_from(instance) 
```
## QUBO Formulation and Quantum Annealing

This section formulates the Vertex Cover Problem as a QUBO (Quadratic Unconstrained Binary Optimization) model and solves it using a simulated quantum annealer.
You can add any penalty weights to A_list, and the code will evaluate each of them using a for loop.

```python
def is_valid_cover(G, cover):
    for u, v in G.edges():
        if u not in cover and v not in cover:
            return False
    return True

A_list = [1.4]
nodes = list(G.nodes)

for A in A_list:
    print(f"\n--- A = {A} ---")

    x = {i: Binary(f'x{i}') for i in nodes}  
    H = sum(x[i] for i in nodes)            

    for u, v in G.edges():
        H += A * (1 - x[u] - x[v] + x[u] * x[v])

    model = H.compile()
    Q, offset = model.to_qubo()

    from dwave.samplers import SimulatedAnnealingSampler
    sampler = SimulatedAnnealingSampler()
    sampleset = sampler.sample_qubo(Q, num_reads=1000)

    best_sample = sampleset.first.sample
    energy = sampleset.first.energy + offset
    cover_nodes = [i for i in nodes if best_sample[f'x{i}'] == 1]

    print("Dataset: keller6.mis")
    print("Hamiltonian (energy):", energy)
    print("Vertex cover size:", len(cover_nodes))
    print("Valid vertex cover:", is_valid_cover(G, cover_nodes))
```
