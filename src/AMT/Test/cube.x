xof 0303txt 0032
template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template FVFData {
 <b6e70a0e-8ef9-4e83-94ad-ecc8b0c04897>
 DWORD dwFVF;
 DWORD nDWords;
 array DWORD data[nDWords];
}


Frame {
 

 FrameTransformMatrix {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Mesh {
  8;
  0.996094;1.000000;-0.995850;,
  -0.995850;1.000000;-0.995850;,
  -0.995850;1.000000;0.996094;,
  0.996094;1.000000;0.996094;,
  0.996094;-0.999756;-0.995850;,
  -0.995850;-0.999756;-0.995850;,
  -0.995850;-0.999756;0.996094;,
  0.996094;-0.999756;0.996094;;
  12;
  3;0,1,2;,
  3;0,2,3;,
  3;0,4,5;,
  3;0,5,1;,
  3;1,5,6;,
  3;1,6,2;,
  3;2,6,7;,
  3;2,7,3;,
  3;3,7,4;,
  3;3,4,0;,
  3;4,7,6;,
  3;4,6,5;;

  MeshNormals {
   8;
   0.333333;0.666667;-0.666667;,
   -0.816497;0.408248;-0.408248;,
   -0.333333;0.666667;0.666667;,
   0.816497;0.408248;0.408248;,
   0.666667;-0.666667;-0.333333;,
   -0.408248;-0.408248;-0.816497;,
   -0.666667;-0.666667;0.333333;,
   0.408248;-0.408248;0.816497;;
   12;
   3;0,1,2;,
   3;0,2,3;,
   3;0,4,5;,
   3;0,5,1;,
   3;1,5,6;,
   3;1,6,2;,
   3;2,6,7;,
   3;2,7,3;,
   3;3,7,4;,
   3;3,4,0;,
   3;4,7,6;,
   3;4,6,5;;
  }

  MeshTextureCoords {
   8;
   0.000000;0.000000;,
   0.000000;0.000000;,
   0.000000;0.000000;,
   0.000000;0.000000;,
   0.000000;0.000000;,
   0.000000;0.000000;,
   0.000000;0.000000;,
   0.000000;0.000000;;
  }

  MeshMaterialList {
   1;
   12;
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0;

   Material {
    1.000000;1.000000;1.000000;1.000000;;
    0.000000;
    0.000000;0.000000;0.000000;;
    0.000000;0.000000;0.000000;;
   }
  }

  VertexDuplicationIndices {
   8;
   8;
   0,
   1,
   2,
   3,
   4,
   5,
   6,
   7;
  }
 }
}