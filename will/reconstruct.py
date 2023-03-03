import numpy as np
import open3d as o3d
import re

vertices = []
normals = []

def split_array(line):
    splitted = re.split(r'[\s\s+,\[\]]', line)
    splitted = [float(splitted[2]), float(splitted[4]), float(splitted[6])]
    return splitted

with open("./points.txt") as file:
    for line in file:
        if not line[0] == "-":
            if line[0] == "n":
                splitted = split_array(line)
                normals.append(splitted)

            else:
                splitted = split_array(line)
                vertices.append(splitted)

vertices = np.array(vertices)
normals = np.array(normals)

pcd = o3d.io.read_point_cloud("pcd.pcd")
print(np.asarray(pcd.normals))
radii = [0.005, 0.01, 0.02, 0.04]
rec_mesh = o3d.geometry.TriangleMesh.create_from_point_cloud_ball_pivoting(
    pcd, o3d.utility.DoubleVector(radii)
)
o3d.visualization.draw_geometries([pcd, rec_mesh])