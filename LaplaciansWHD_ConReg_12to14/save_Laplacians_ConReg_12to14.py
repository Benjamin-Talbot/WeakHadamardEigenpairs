#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  2 22:35:48 2024

@author: luismbvarona
"""

# %%
import os #For creating new subdirectories
import numpy as np #For numeric operations
from sage.all import graphs #For graph generation
from itertools import chain #For "merging" graph generators
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

def generate_ConReg(n: 'int'):
    '''
    Returns a generator for all simple, connected, regular graphs of order 'n'
    with (nauty's) canonical labeling.

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
    itertools.chain
        DESCRIPTION.
    '''
    if n not in range(3, 16):
        raise ValueError("The graph order 'n' must be between 3 and 15.")
    
    def generate_ConkReg(n: 'int', k: 'int'):
        '''
        Returns a generator for all simple, connected, k-regular graphs of
        order 'n' with (nauty's) canonical labeling.

        Parameters
        ----------
        n : 'int'
            DESCRIPTION.
        k : 'int'
            DESCRIPTION.

        Returns
        -------
        generator
            DESCRIPTION.
        '''
        return graphs.nauty_geng(
            str(n) + " -c -l -d" + str(k) + ' -D' + str(k)
        )
    
    k_iter = range(2, n, (n % 2) + 1)
    return chain.from_iterable([generate_ConkReg(n, k) for k in k_iter])

def main():
    cwd = os.getcwd()
    
    for n in range(12, 15):
        newdir = 'LaplaciansWHD_ConReg_' + str(n)
        newpath = cwd + '/' + newdir
        if not os.path.isdir(newpath):
            os.mkdir(cwd + '/' + newdir)
        
        graphGenerator = generate_ConReg(n)
        Laplacians = []
        
        for g in graphGenerator:
            L = g.kirchhoff_matrix()
            if isIntArrTol(np.linalg.eigvals(L)):
                Laplacians.append(L)
        
        Laplacians = np.array(Laplacians).transpose()
        
        varname = 'LaplaciansIntegral_ConReg_' + str(n)
        filename = newdir + '/' + varname
        with open(filename + '.npy', 'wb') as file:
            np.save(file, Laplacians)
        savemat(filename + '.mat', {varname: Laplacians})

main()