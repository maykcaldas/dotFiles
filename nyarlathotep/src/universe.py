#!/usr/bin/python3
#!-*- coding: utf8 -*-

''' Documentation '''

class atom:
    ''' Documentation '''
    def __init__(self, name="atom", x=0.0, y=0.0, z=0.0):
        self.name   = name
        self.x      = x
        self.y      = y
        self.z      = z
        self.Dx     = []
        self.Dy     = []
        self.Dz     = []

    def get_name(self):
        return self.name

    def get_x(self):
        return self.x
    
    def get_y(self):
        return self.y

    def get_z(self):
        return self.z

    def get_Dx(self):
        return self.Dx

    def get_Dy(self):
        return self.Dy

    def get_Dz(self):
        return self.Dz

    def set_Dx(self, Dx):
        self.Dx.append(Dx)

    def set_Dy(self,Dy):
        self.Dy.append(Dy)

    def set_Dz(self,Dz):
        self.Dz.append(Dz)
    
class molecule:
    ''' Documentation '''
    def __init__(self,name="molecule", id=0, atoms=[]):
        self.name   = name
        self.id     = id
        self.atoms  = atoms

    def get_name(self):
        return self.name

    def get_id(self):
        return self.if

    def get_atoms(self):
        return self.atoms

    def set_name(self, name):
        self.name = name

    def set_id(self, id):
        self.id = id

    def set_atoms(self, atoms):
        self.atoms = atoms

    def add_atom(self, atom):
        self.atoms.appen(atom)

    def remove_atom(self, atom):
        self.atoms.remove(atom)