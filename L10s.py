#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 25 17:03:40 2024

@author: luismbvarona
"""
from numpy import array, save
from sage.all import *
from scipy.io import savemat

L10s = []
f = lambda g: g.is_connected()
for G in filter(f, graphs(10)):
    L = array(G.kirchhoff_matrix())
    L10s.append(L)

L10s = array(L10s).transpose()
#%%
numL10s = L10s.shape[2]
with open('L10s.npy', 'wb') as file:
    save(file, L10s)

splits = [i*int(numL10s/4) for i in range(1, 4)]
savemat('L10s_1.mat', {'L10s_1': L10s[:, :, 0:splits[0]]})
savemat('L10s_2.mat', {'L10s_2': L10s[:, :, splits[0]:splits[1]]})
savemat('L10s_3.mat', {'L10s_3': L10s[:, :, splits[1]:splits[2]]})
savemat('L10s_4.mat', {'L10s_4': L10s[:, :, splits[2]:numL10s]})