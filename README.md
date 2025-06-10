# Traveling Salesman Problem (TSP) - Branch and Bound Solver

This project provides a simple and efficient Python implementation of the **Traveling Salesman Problem (TSP)** using **Branch and Bound** with depth-first search (DFS) and pruning.

---

##  Problem Description

Given a set of cities and pairwise distances between them, the **Traveling Salesman Problem** seeks to find the shortest possible route that:

1. Starts at a given city (default: city 0),
2. Visits each city exactly once,
3. Returns to the starting city.

---

##  Example Input / Output

### Input Format

n  
d[0][0] d[0][1] ... d[0][n-1]  
d[1][0] d[1][1] ... d[1][n-1]  
...  
d[n-1][0] d[n-1][1] ... d[n-1][n-1]  

- `n` = number of cities
- `d[i][j]` = distance from city `i` to city `j`  
- Use `-1` to indicate no direct path between two cities

### Sample Input

4  
0 10 15 20  
10 0 35 25  
15 35 0 30  
20 25 30 0  

### Sample Output  
80  
0 1 3 2 0  

This means the shortest route has cost 80 and visits cities in the order: 0 → 1 → 3 → 2 → 0.

---

