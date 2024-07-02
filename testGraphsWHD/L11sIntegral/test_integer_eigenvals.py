#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jun 27 23:52:23 2024

@author: luismbvarona
"""
# %%
import numpy as np
from random import randint

# %%
print('No. of Laplacian integral graphs per bundle:\n')

for i in range(1, 136):
    arrayName = 'L11sIntegral_chunk' + str(i)
    exec(arrayName + " = np.load('chunks/" + arrayName + ".npy')")
    print('- ' + arrayName + ': ' + str(eval(arrayName + '.shape[2]')))

print('________________________________'
      '________________________________\n')

# %%
def main(numBundlesCompleted):
    chunkNum = randint(1, numBundlesCompleted)
    Laplacians = np.load('chunks/L11sIntegral_chunk' +
                         str(chunkNum) + '.npy')
    print('Laplacian bundle no. ' + str(chunkNum), end = ':')
    
    max_k = Laplacians.shape[2] - 1
    if max_k == -1:
        print(' Empty (no Laplacian integral graphs)')
    else:
        k = randint(0, max_k)
        L = Laplacians[:, :, k]
        eigvals_L = np.linalg.eigvals(L)
        print('\n\n' + str(eigvals_L))

print('Approx. eigenvalues of random Laplacians from random bundles:\n')
for i in range(20):
    main(135)
    print('________________________________'
          '________________________________\n')