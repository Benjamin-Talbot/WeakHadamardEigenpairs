#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul  1 22:19:27 2024

@author: luismbvarona
"""

# %%
import numpy as np #For numeric operations
from sage.all import graphs #For graph generation
from scipy.io import savemat #For saving to MATLAB object files

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

def main():
    gen_L9s = graphs.nauty_geng("9 -c")
    L9sIntegral = []
    k = 0
    for g in gen_L9s:
        L = g.kirchhoff_matrix()
        if isIntArrTol(np.linalg.eigvals(L)):
            L9sIntegral.append(L)
        k += 1
        if k % (2.5*10**4) == 0:
            print('k = ' + str(int(k/10**3)) + ' thousand')
    
    L9sIntegral = np.array(L9sIntegral).transpose()
    with open('L9sIntegral.npy', 'wb') as file:
        np.save(file, L9sIntegral)
    savemat('L9sIntegral.mat', {'L9sIntegral': L9sIntegral})

main()