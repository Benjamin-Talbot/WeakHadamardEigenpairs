#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul  1 15:48:46 2024

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
    gen_L10s = graphs.nauty_geng("10 -c")
    L10sIntegral = []
    k = 0
    for g in gen_L10s:
        L = g.kirchhoff_matrix()
        if isIntArrTol(np.linalg.eigvals(L)):
            L10sIntegral.append(L)
        k += 1
        if k % (4*10**5) == 0:
            print('k = ' + str(int(k/10**3)) + ' thousand')
    
    L10sIntegral = np.array(L10sIntegral).transpose()
    with open('L10sIntegral.npy', 'wb') as file:
        np.save(file, L10sIntegral)
    savemat('L10sIntegral.mat', {'L10sIntegral': L10sIntegral})

main()