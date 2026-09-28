from mpi4py import MPI
import numpy as np

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

# Each rank has a little piece of a simulation
field = np.arange(8, dtype=float) + rank * 8

local_sum = np.sum(field**2)

global_sum = comm.reduce(local_sum, op=MPI.SUM, root=0)

print(f"rank {rank}: local result = {local_sum}")

if rank == 0:
    print(f"global result = {global_sum}")
