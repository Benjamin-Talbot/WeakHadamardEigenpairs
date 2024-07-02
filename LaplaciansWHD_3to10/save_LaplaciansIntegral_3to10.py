#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  2 11:28:06 2024

@author: luismbvarona
"""

# %%
import os #For creating new subdirectories
import numpy as np #For numeric operations
from sage.all import graphs #For graph generation
from scipy.io import savemat #For saving to MATLAB object files

# %%
def isIntArrTol(a: 'np.ndarray'):
    '''
    Checks whether a numpy array contains all integers.

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

def generate_connect(n: 'int'):
    '''
    Returns a generator for all simple, connected graphs of order 'n'.

    Parameters
    ----------
    n : 'int'
        DESCRIPTION.

    Raises
    ------
    ValueError
        DESCRIPTION.

    Returns
    -------
    generator
        DESCRIPTION.

    '''
    if n not in range(3, 11):
        raise ValueError("The graph order 'n' must be between 3 and 10.")
    
    return graphs.nauty_geng(str(n) + " -c -l")

def main():
    cwd = os.getcwd()
    
    for n in range(3, 11):
        newdir = 'LaplaciansWHD_' + str(n)
        newpath = cwd + '/' + newdir
        if not os.path.isdir(newpath):
            os.mkdir(cwd + '/' + newdir)
        
        graphGenerator = generate_connect(n)
        Laplacians = []
        
        for g in graphGenerator:
            L = g.kirchhoff_matrix()
            if isIntArrTol(np.linalg.eigvals(L)):
                Laplacians.append(L)
        
        Laplacians = np.array(Laplacians).transpose()
        
        varname = 'LaplaciansIntegral_' + str(n)
        filename = newdir + '/' + varname
        with open(filename + '.npy', 'wb') as file:
            np.save(file, Laplacians)
        savemat(filename + '.mat', {varname: Laplacians})

main()