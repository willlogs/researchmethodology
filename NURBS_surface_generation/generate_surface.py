#!/usr/bin/env python3

## STEPS to get control points
#   1) organize surface points and normal in grid (matrix)
#   2) define plane equation for every points
#   3) for every adjacent points p1 and p2:
#       - line equation l = (p2 - p1)
#       - interssect the two planes in a line l_inter
#       - project l on the plane of p1 or the plane of p2 (l_proj)
#       - interssect l_proj and l_inter to find the control points

import numpy as np
import pandas as pd
import json
from sympy import *
from sympy.solvers.solveset import linsolve
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from geomdl import BSpline, NURBS, fitting, multi, operations, exchange
from geomdl.visualization import VisMPL
from matplotlib import cm


def round_expr(expr, num_digits):
    return expr.xreplace({n : round(n, num_digits) for n in expr.atoms(Number)})


def correct_cp(p1, p2, cp):

    cp_ = Point3D(cp)
    p_med = (np.array(p1).astype(np.float64) + np.array(p2).astype(np.float64)) /2
    d = p1.distance(p2)

def correct_cp(p1, p2, cp):

    p_med = (np.array(p1).astype(np.float64) + np.array(p2).astype(np.float64)) /2
    p_med = Point3D(p_med)
    d = p1.distance(p2)
    cp_ = Point3D(cp)
    d1 = p1.distance(cp_)
    d2 = p2.distance(cp_)

    if d1 > d2:

        p_far = p1
        p_close = p2

    else:

        p_far = p2
        p_close = p1

    l_close = Line3D(cp_, p_close)
    l_base = Line3D(p_close, p_far)
    alpha = l_close.angle_between(l_base)
    l_aux = Line3D(cp_, p_med)
    if alpha < pi/2:

        cp_old = cp
        dir = np.array(l_aux.direction_ratio).astype(np.float64)
        dist = cp_.distance(p_med)
        delta = 0.00001
        while dist > d:

            cp_old += delta*dir
            dist = Point3D(cp_old).distance(p_med)
        cp_new = cp_old
        return cp_new
    else:

        return cp


def correct_cpi(p1, p2, cpi):

    p_medium = (np.array(p1).astype(np.float64) + np.array(p2).astype(np.float64)) /2
    medium_coord = p_medium[0]
    cpi_ = Point3D(cpi)
    d1 = p1.distance(cpi_)
    d2 = p2.distance(cpi_)
    d = p1.distance(p2)
    if ((d1 > d2) and (d2>= d)):

        l1 = Line3D(p1,Point3D(cpi))

        t = Symbol('t')
        alpha = np.array(l1.direction_ratio).astype(np.float64)
        answer = solve(np.array(p1).astype(np.float64)[0] + t*alpha[0] - medium_coord , t)
        p = np.array(p1).astype(np.float64) + answer*alpha
        return p
    if ((d1 <= d2) and (d1 >= d)):

        l1 = Line3D(p2,Point3D(cpi))

        t = Symbol('t')
        alpha = np.array(l1.direction_ratio).astype(np.float64)
        answer = solve(np.array(p2).astype(np.float64)[0] + t*alpha[0] - medium_coord , t)
        p = np.array(p2).astype(np.float64) + answer*alpha
        return p
    return cpi

def correct_cpj(p1, p2, cpj):

    p_medium = (np.array(p1).astype(np.float64) + np.array(p2).astype(np.float64)) /2
    medium_coord = p_medium[1]
    cpj_ = Point3D(cpj)
    d1 = p1.distance(cpj_)
    d2 = p2.distance(cpj_)
    d = p1.distance(p2)
    if ((d1 > d2) and (d2 >= d)):

        l1 = Line3D(p1,Point3D(cpj))

        t = Symbol('t')
        alpha = np.array(l1.direction_ratio).astype(np.float64)
        answer = solve(np.array(p1).astype(np.float64)[1] + t*alpha[1] - medium_coord , t)
        p = np.array(p1).astype(np.float64) + answer*alpha
        return p
    if ((d1 <= d2) and (d1 >= d)):

        l1 = Line3D(p2,Point3D(cpj))

        t = Symbol('t')
        alpha = np.array(l1.direction_ratio).astype(np.float64)
        answer = solve(np.array(p2).astype(np.float64)[1] + t*alpha[1] - medium_coord , t)
        p = np.array(p2).astype(np.float64) + answer*alpha
        return p
    return cpj

def get_ctrl_point3(point1, plane1, point2, plane2):

    p1_proj = plane2.projection(point1)
    p2_proj = plane1.projection(point2)
    l1 = Line3D(point1, point2)
    l2 = Line3D(p1_proj, p2_proj)
    ### Creating vertical plane passing through l1 (p1 and p2) to project our ctrl_point at the end
    p_vert = np.array(point1)
    p_vert[2] += 1
    p_vert = Point3D(p_vert)
    plane_vert = Plane(point1, point2, p_vert)
    alpha1 = np.array(l1.direction_ratio).astype(np.float64)
    alpha2 = np.array(l2.direction_ratio).astype(np.float64)
    p1_proj = np.array(p1_proj).astype(np.float64)
    p2_proj = np.array(p2_proj).astype(np.float64)
    p1 = np.array(point1).astype(np.float64)
    p2 = np.array(point2).astype(np.float64)
    t1 = Symbol('t1')
    t2 = Symbol('t2')
    eqs = ((p1[0] - p2[0] + t1*alpha1[0] - t2*alpha2[0])*alpha1[0] + (p1[1] - p2[1] + t1*alpha1[1] - t2*alpha2[1])*alpha1[1] + (p1[2] - p2[2] + t1*alpha1[2] - t2*alpha2[2])*alpha1[2],
    (p1[0] - p2[0] + t1*alpha1[0] - t2*alpha2[0])*alpha2[0] + (p1[1] - p2[1] + t1*alpha1[1] - t2*alpha2[1])*alpha2[1] + (p1[2] - p2[2] + t1*alpha1[2] - t2*alpha2[2])*alpha2[2])
    answer = solve(eqs, t1, t2)
    m = p1 + answer[t1]*alpha1
    n = p1_proj + answer[t2]*alpha2
    ctrl_point_ = (m + n)/2
    ctrl_point_ = plane_vert.projection(Point3D(ctrl_point_))
    ctrl_point_ = np.array(ctrl_point_).astype(np.float64)


    return ctrl_point_

def get_ctrl_point4(point1, plane1, point2, plane2):

    p1_proj = plane2.projection(point1)
    p2_proj = plane1.projection(point2)
    ### Creating vertical plane passing through l1 (p1 and p2) to project our ctrl_point at the end
    p_vert = np.array(point1)
    p_vert[2] += 1
    p_vert = Point3D(p_vert)
    plane_vert = Plane(point1, point2, p_vert)
    p1_proj_ = plane_vert.projection(p1_proj)
    p2_proj_ = plane_vert.projection(p2_proj)

    l1_ = Line3D(point1, p2_proj_)
    l2_ = Line3D(point2, p1_proj_)
    ctrl_pt = l1_.intersection(l2_)[0]
    ctrl_pt = np.array(ctrl_pt).astype(np.float64)
    # alpha1 = np.array(l1.direction_ratio).astype(np.float64)
    # alpha2 = np.array(l2.direction_ratio).astype(np.float64)
    # p1_proj = np.array(p1_proj).astype(np.float64)
    # p2_proj = np.array(p2_proj).astype(np.float64)
    # p1 = np.array(point1).astype(np.float64)
    # p2 = np.array(point2).astype(np.float64)
    # t1 = Symbol('t1')
    # t2 = Symbol('t2')
    # eqs = ((p1[0] - p2[0] + t1*alpha1[0] - t2*alpha2[0])*alpha1[0] + (p1[1] - p2[1] + t1*alpha1[1] - t2*alpha2[1])*alpha1[1] + (p1[2] - p2[2] + t1*alpha1[2] - t2*alpha2[2])*alpha1[2],
    # (p1[0] - p2[0] + t1*alpha1[0] - t2*alpha2[0])*alpha2[0] + (p1[1] - p2[1] + t1*alpha1[1] - t2*alpha2[1])*alpha2[1] + (p1[2] - p2[2] + t1*alpha1[2] - t2*alpha2[2])*alpha2[2])
    # answer = solve(eqs, t1, t2)
    # m = p1 + answer[t1]*alpha1
    # n = p2 + answer[t2]*alpha2
    # ctrl_point_ = (m + n)/2
    # ctrl_point_ = plane_vert.projection(Point3D(ctrl_point_))
    # ctrl_point_ = np.array(ctrl_point_).astype(np.float64)


    return ctrl_pt


print('hello')

raw_file_points = pd.read_csv('./surface points/surface_vulcan_s_test/surface_points.txt', header = None, sep=';')
raw_file_normals = pd.read_csv('./surface points/surface_vulcan_s_test/surface_normals.txt', header = None, sep=';')
raw_file_points.columns = ['coordinates']
raw_file_normals.columns = ['normal']
raw_file_points = raw_file_points[raw_file_points.coordinates.str.contains(r'[0-9]')]
raw_file_points = raw_file_points.reset_index(drop=True)
raw_file_normals = raw_file_normals[raw_file_normals.normal.str.contains(r'[0-9]')]
raw_file_normals = raw_file_normals.reset_index(drop=True)
for x in range(len(raw_file_points)):

    raw_file_points['coordinates'].iloc[x] = json.loads(raw_file_points['coordinates'].iloc[x])
    raw_file_normals['normal'].iloc[x] = json.loads(raw_file_normals['normal'].iloc[x])
    raw_file_points['coordinates'].iloc[x] = np.array(raw_file_points['coordinates'].iloc[x])
    raw_file_normals['normal'].iloc[x] = np.array(raw_file_normals['normal'].iloc[x])



#### Generating plane equations N . (p - p0) = 0
planes = pd.DataFrame(columns = ['a', 'b', 'c', 'd'], index = raw_file_normals.index)
for i in range(len(raw_file_points)):

    planes.a.iloc[i] = raw_file_normals.normal.iloc[i][0]
    planes.b.iloc[i] = raw_file_normals.normal.iloc[i][1]
    planes.c.iloc[i] = raw_file_normals.normal.iloc[i][2]
    planes.d.iloc[i] = np.dot(raw_file_normals.normal.iloc[i], raw_file_points.coordinates.iloc[i])



surf_container = multi.SurfaceContainer()
I = 3 ##ROWS
J = 3 ##COLUMNS
planes_matrix = []
points_matrix = []

a = 0
i = 0
j = 0
while j < J:
    sublist_point = []
    sublist_plane = []
    while i < I:
        point = Point3D(raw_file_points.coordinates.iloc[i + a][0], raw_file_points.coordinates.iloc[i + a][1], raw_file_points.coordinates.iloc[i + a][2])
        sublist_point.append(point)
        sublist_plane.append(Plane(point, normal_vector=(planes.a.iloc[i + a], planes.b.iloc[i + a], planes.c.iloc[i + a])))
        i += 1
    points_matrix.append(sublist_point)
    planes_matrix.append(sublist_plane)
    a += I
    j += 1
    i = 0


planes_matrix

CP_i = []
CP_j = []
i = 0
j = 0

for i in range(J):

    cpi_sublist = []
    cpj_sublist = []
    for j in range(I):


        if ((j + 1) < I):

            point1 = points_matrix[i][j]
            point2 = points_matrix[i][j + 1]
            plane1 = planes_matrix[i][j]
            plane2 = planes_matrix[i][j + 1]

            cpi = get_ctrl_point3(point1, plane1, point2, plane2)
            cpi = correct_cpi(point1, point2, cpi)
            cpi_sublist.append(cpi)
            print(cpi)

        if ((i + 1) < J):
            point1 = points_matrix[i][j]
            point3 = points_matrix[i + 1][j]
            plane1 = planes_matrix[i][j]
            plane3 = planes_matrix[i + 1][j]

            cpj = get_ctrl_point3(point1, plane1, point3, plane3)
            cpj = correct_cpj(point1, point3, cpj)
            cpj_sublist.append(cpj)
            print(cpj)
    if cpi_sublist:
        CP_i.append(cpi_sublist)

    if cpj_sublist:
        CP_j.append(cpj_sublist)



    CP_i

i = 0
j = 0

for i in range(J - 1):


    for j in range(I - 1):

        control_points = []
        cp1 = CP_i[i][j]
        cp2 = CP_j[i][j]
        cp3 = CP_j[i][j + 1]
        cp4 = CP_i[i + 1][j]
        cp_central = (cp1 + cp2 + cp3 + cp4) / 4
        p1 = points_matrix[i][j]
        p2 = points_matrix[i][j + 1]
        p3 = points_matrix[i + 1][j]
        p4 = points_matrix[i + 1][j + 1]
        plane1 = planes_matrix[i][j]
        plane2 = planes_matrix[i][j + 1]
        plane3 = planes_matrix[i + 1][j]
        plane4 = planes_matrix[i + 1][j + 1]
        # cp_central_part1 = get_ctrl_point4(p1, plane1, p4, plane4)
        # cp_central_part2 = get_ctrl_point4(p2, plane2, p3, plane3)
        control_points.append(list(np.array(p1).astype(np.float64).round(3)))
        control_points.append(list(cp1))
        control_points.append(list(np.array(p2).astype(np.float64).round(3)))
        control_points.append(list(cp2))
        control_points.append(list(cp_central))
        control_points.append(list(cp3))
        control_points.append(list(np.array(p3).astype(np.float64).round(3)))
        control_points.append(list(cp4))
        control_points.append(list(np.array(p4).astype(np.float64).round(3)))

        surf = BSpline.Surface()
        surf.degree_u = 2
        surf.degree_v = 2
        surf.set_ctrlpts(control_points, 3, 3)
        # Set knot vectors
        surf.knotvector_u = [0, 0, 0, 1, 1, 1]
        surf.knotvector_v = [0, 0, 0, 1, 1, 1]
        # surf.delta = 0.05
        surf.vis = VisMPL.VisSurface(ctrlpts=False, legend=False)
        surf_container.add(surf)
surf_container.sample_size = 5
surf_container.vis = VisMPL.VisSurface(ctrlpts=False, legend=False)
# operations.refine_knotvector(surf_container, [3, 3])
surf_container.render()
###### The final nuber of points will be (sample_size -1)^2 * (I-1)*(J-1)
###### For example: if sample_size = 10, surface vulcan 5x5 will have 16 patches each will have 9*9 evalpts.
print(surf_container.evalpts)
print(type(surf_container.evalpts))
print(len(surf_container.evalpts))
f = open('poses_test.txt', 'w')
json.dump(surf_container.evalpts, f)
f.close()
# for idx, mpt in enumerate(surf_container.evalpts):
exchange.export_stl(surf_container,"surface_vulcan_s_test_3x3.stl")
