#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jun 30 00:12:45 2024

@author: luismbvarona
"""

"""
This program allows us to generate and filter bundles of Laplacian matrices.
Each bundle contains all Laplacians with integral eigenvalues from a given
chunk of 3,078,595 simple, connected graphs of order 11. There are 327 such
bundles to be generated, with 1,006,700,565 such order 11 graphs in total.
"""

# %%
import numpy as np #For numeric operations
from sage.all import graphs #For graph generation
from itertools import islice #For taking slices of graph generators

# %%
def isIntArrTol(a: 'np.ndarray'):
    '''
    Checks whether a numpy array contains all integers

    Parameters
    ----------
    a : 'np.ndarray'
        Numeric numpy array.

    Returns
    -------
    'bool'
        True or false.
    '''
    return np.allclose(a, np.round(a))

def saveIntegralChunks(chunkNumStart: 'int', chunkNumEnd: 'int'):
    '''
    Meow

    Parameters
    ----------
    chunkNumStart : 'int'
        Number of the first Laplacian bundle to be generated and filtered
        (indexing starts at 1).
    chunkNumEnd : 'int'
        Number of the last Laplacian bundle to be generated and filtered.

    Returns
    -------
    None.

    '''
    itemStart = 3078595*(chunkNumStart - 1)
    itemEnd = 3078595*chunkNumEnd
    gen_L11s = graphs.nauty_geng("11 -c")
    gen_L11s_chunk = islice(gen_L11s, itemStart, itemEnd)
    
    for j in range(chunkNumStart, chunkNumEnd + 1):
        print('\nBundle no. ' + str(j) + ':')
        L11sIntegral_chunk = []
        filename = 'L11sIntegral_chunk' + str(j) + '.npy'
        
        for k in range(3078595):
            L = next(gen_L11s_chunk).kirchhoff_matrix()
            if isIntArrTol(np.linalg.eigvals(L)):
                L11sIntegral_chunk.append(L)
            if k % (2*10**5) == 0:
                print('k = ' + str(int(k/10**3)) + ' thousand')
        
        L11sIntegral_chunk = np.array(L11sIntegral_chunk).transpose()
        with open(filename, 'wb') as file:
            np.save(file, L11sIntegral_chunk)
        print('\nSaved filtered bundle to ' + filename)
        print('________________________________'
              '________________________________')

def main():
    chunkNumStart = int(
        input('Please enter the number of your first Laplacian bundle (must '
              'be an integer from 1 to 327). ')
    )
    while chunkNumStart not in range(1, 328):
        chunkNumStart = int(input('Invalid input. Please enter an integer '
                                  'from 1 to 327. '))
    
    chunkNumEnd = int(
        input('Plase enter the number of your last Laplacian bundle (must be '
              'an integer from ' + str (chunkNumStart) + ' to 327). ')
    )
    while chunkNumEnd not in range(chunkNumStart, 328):
        chunkNumEnd = int(input('Invalid input. Please enter an integer from '
                                + str(chunkNumStart) + ' to 327. '))
    
    print("\nLovely! Let's get started, then... meow! <3")
    saveIntegralChunks(chunkNumStart, chunkNumEnd)

main()