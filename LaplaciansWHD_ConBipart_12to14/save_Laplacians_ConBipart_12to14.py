#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  2 16:36:30 2024

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

def generate_ConBipart(n: 'int'):
    '''
    Returns a generator for all simple, connected, bipartite graphs of order
    'n' with (nauty's) canonical labeling.

    Parameters
    ----------
    n : 'int'
        DESCRIPTION.

    Returns
    -------
    generator
        DESCRIPTION.
    '''
    return graphs.nauty_geng(str(n) + " -b -c -l")

def main():
    cwd = os.getcwd()
    
    for n in range(12, 15):
        newdir = 'LaplaciansWHD_ConBipart_' + str(n)
        newpath = cwd + '/' + newdir
        if not os.path.isdir(newpath):
            os.mkdir(cwd + '/' + newdir)
        
        graphGenerator = generate_ConBipart(n)
        Laplacians = []
        
        for g in graphGenerator:
            L = g.kirchhoff_matrix()
            if isIntArrTol(np.linalg.eigvals(L)):
                Laplacians.append(L)
        
        Laplacians = np.array(Laplacians).transpose()
        
        varname = 'LaplaciansIntegral_ConBipart_' + str(n)
        filename = newdir + '/' + varname
        with open(filename + '.npy', 'wb') as file:
            np.save(file, Laplacians)
        savemat(filename + '.mat', {varname: Laplacians})

main()