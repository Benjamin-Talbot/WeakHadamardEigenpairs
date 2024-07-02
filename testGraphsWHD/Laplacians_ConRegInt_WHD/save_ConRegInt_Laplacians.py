#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul  1 00:14:28 2024

@author: luismbvarona
"""

# %%
import numpy as np #For numeric operations
from sage.all import graphs #For graph generation
from itertools import chain #For "merging" graph generators
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

def num_connect_reg(n: 'int'):
    if n not in range(3, 16):
        raise ValueError("The graph order 'n' must be between 3 and 15.")
    n_iter = range(3, 16)
    num_iter = [1, 2, 2, 5, 4, 17, 22, 167, 539, 18979,
                389436, 50314796, 2942198440]
    OEIS_A005177 = dict(zip(n_iter, num_iter))
    return OEIS_A005177[n]

def generate_connect_reg(n: 'int'):
    '''
    Returns a generator for all simple, connected, regular graphs of order n.

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
    
    def generate_connect_kReg(n: 'int', k: 'int'):
        '''
        Returns a generator for all simple, connected, k-regular graphs of
        order n.

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
        return graphs.nauty_geng(str(n) + " -c -d" + str(k) + ' -D' + str(k))
    
    k_iter = range(2, n, (n % 2) + 1)
    return chain.from_iterable([generate_connect_kReg(n, k) for k in k_iter])

def save_ConRegInt_Laplacians(n, filename):
    Laplacians = []
    gen_Laplacians = generate_connect_reg(n)
    integral = lambda g: isIntArrTol(np.linalg.eigvals(g.kirchhoff_matrix()))
    
    for g in filter(integral, gen_Laplacians):
        Laplacians.append(g.kirchhoff_matrix())
    
    if Laplacians == []:
        Laplacians = np.empty((n, n, 0), int)
    else:
        Laplacians = np.array(Laplacians).transpose()
    
    with open(filename + '.npy', 'wb') as file:
        np.save(file, Laplacians)
    
    savemat(filename + '.mat', {'Laplacians': Laplacians})

# %%
def main():
    n = int(input('Please enter the graph order for which you wish to '
                  'generate all simple, connected, regular graphs. '))
    filename = input('Please enter the name of the file (without any '
                     'extensions) to which you wish to save the resulting '
                     'list of Laplacians (in both .npy and .mat format). ')
    save_ConRegInt_Laplacians(n, filename)

main()