# Vertex Cover Problem Solver using Quantum Annealing

This project demonstrates how to solve the **Vertex Cover Problem (VCP)** using a **QUBO model** and **simulated annealing**, leveraging D-Wave's Ocean SDK.

## 📌 Problem Description

The Vertex Cover Problem is a classical NP-complete problem. Given an undirected graph \( G = (V, E) \), the goal is to find a subset \( C \subseteq V \) such that every edge \( (u, v) \in E \) has at least one endpoint in \( C \).

In this project, we model VCP as a **Quadratic Unconstrained Binary Optimization (QUBO)** problem and use **SimulatedAnnealingSampler** to find an approximate minimum vertex cover.

---

## 🧠 QUBO Model

The QUBO objective function is defined as:

\[
H(x) = \sum_{i \in V} x_i + A \sum_{(u,v) \in E} (1 - x_u - x_v + x_u x_v)
\]

- \( x_i = 1 \) if vertex \( i \) is included in the cover, 0 otherwise.
- \( A \) is a penalty coefficient ensuring constraint satisfaction.

---

## 🧪 Dataset

The input graph is read from `keller4.mis` and other dataset, a `.mis` format file with edges listed per line after a header.

---

## 📦 Installation

To set up the environment for solving QUBO problems using simulated annealing on D-Wave’s software stack, please install the required packages below.

Install required packages with the following commands:

```bash
!pip install dwave-ocean-sdk
!pip install pyqubo

from pyqubo import Binary
import networkx as nx
from pyqubo import Binary
import networkx as nx

