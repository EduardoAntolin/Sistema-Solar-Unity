

Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0.000000,1.000000)) = 0.500000
 _Glossiness ("Smoothness", Range(0.000000,1.000000)) = 0.500000
 _GlossMapScale ("Smoothness Scale", Range(0.000000,1.000000)) = 1.000000
[Enum(Metallic Alpha,0,Albedo Alpha,1)]  _SmoothnessTextureChannel ("Smoothness texture channel", Float) = 0.000000
[Gamma]  _Metallic ("Metallic", Range(0.000000,1.000000)) = 0.000000
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
[ToggleOff]  _SpecularHighlights ("Specular Highlights", Float) = 1.000000
[ToggleOff]  _GlossyReflections ("Glossy Reflections", Float) = 1.000000
 _BumpScale ("Scale", Float) = 1.000000
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005000,0.080000)) = 0.020000
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0.000000,1.000000)) = 1.000000
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1.000000
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0.000000
[HideInInspector]  _Mode ("__mode", Float) = 0.000000
[HideInInspector]  _SrcBlend ("__src", Float) = 1.000000
[HideInInspector]  _DstBlend ("__dst", Float) = 0.000000
[HideInInspector]  _ZWrite ("__zw", Float) = 1.000000
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //        d3d11: 32 avg math (22..55)
 // Stats for Fragment shader:
 //        d3d11: 157 avg math (137..177), 5 avg texture (3..8), 7 avg branch (6..8)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
/

      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  14: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  23: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  24: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  25: dp3 r0.w, r0.xyzx, r0.xyzx
  26: rsq r0.w, r0.w
  27: mul o5.xyz, r0.wwww, r0.xyzx
  28: mov o6.xyzw, l(0,0,0,0)
  29: mov o7.xyzw, l(0,0,0,0)
  30: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 137 math, 13 temp registers, 3 textures, 6 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 2 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 3 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[8], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texturecube (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texture3d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_output o0.xyzw
      dcl_temps 13
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: eq r2.w, cb3[0].x, l(1.000000)
  13: if_nz r2.w
  14:   eq r2.w, cb3[0].y, l(1.000000)
  15:   mul r4.xyz, v4.wwww, cb3[2].xyzx
  16:   mad r4.xyz, cb3[1].xyzx, v3.wwww, r4.xyzx
  17:   mad r4.xyz, cb3[3].xyzx, v5.wwww, r4.xyzx
  18:   add r4.xyz, r4.xyzx, cb3[4].xyzx
  19:   mov r5.y, v3.w
  20:   mov r5.z, v4.w
  21:   mov r5.w, v5.w
  22:   movc r4.xyz, r2.wwww, r4.xyzx, r5.yzwy
  23:   add r4.xyz, r4.xyzx, -cb3[6].xyzx
  24:   mul r4.yzw, r4.xxyz, cb3[5].xxyz
  25:   mad r2.w, r4.y, l(0.250000), l(0.750000)
  26:   mad r3.w, cb3[0].z, l(0.500000), l(0.750000)
  27:   max r4.x, r2.w, r3.w
  28:   sample r4.xyzw, r4.xzwx, t4.xyzw, s1
  29: else 
  30:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  31: endif 
  32: dp4_sat r2.w, r4.xyzw, cb1[46].xyzw
  33: sample r4.xyzw, v1.xyxx, t1.xyzw, s3
  34: add r3.w, -cb0[9].y, l(1.000000)
  35: mad r3.w, r4.y, cb0[9].y, r3.w
  36: add r4.x, -cb0[8].w, l(1.000000)
  37: dp3 r4.y, r3.xyzx, r2.xyzx
  38: add r4.y, r4.y, r4.y
  39: mad r4.yzw, r2.xxyz, -r4.yyyy, r3.xxyz
  40: mul r5.xyz, r2.wwww, cb0[2].xyzx
  41: lt r2.w, l(0.000000), cb2[2].w
  42: if_nz r2.w
  43:   dp3 r2.w, r4.yzwy, r4.yzwy
  44:   rsq r2.w, r2.w
  45:   mul r6.xyz, r2.wwww, r4.yzwy
  46:   mov r7.x, v3.w
  47:   mov r7.y, v4.w
  48:   mov r7.z, v5.w
  49:   add r8.xyz, -r7.xyzx, cb2[0].xyzx
  50:   div r8.xyz, r8.xyzx, r6.xyzx
  51:   add r9.xyz, -r7.xyzx, cb2[1].xyzx
  52:   div r9.xyz, r9.xyzx, r6.xyzx
  53:   lt r10.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r6.xyzx
  54:   movc r8.xyz, r10.xyzx, r8.xyzx, r9.xyzx
  55:   min r2.w, r8.y, r8.x
  56:   min r2.w, r8.z, r2.w
  57:   add r7.xyz, r7.xyzx, -cb2[2].xyzx
  58:   mad r6.xyz, r6.xyzx, r2.wwww, r7.xyzx
  59: else 
  60:   mov r6.xyz, r4.yzwy
  61: endif 
  62: mad r2.w, -r4.x, l(0.700000), l(1.700000)
  63: mul r2.w, r2.w, r4.x
  64: mul r2.w, r2.w, l(6.000000)
  65: sample_l r6.xyzw, r6.xyzx, t2.xyzw, s0, r2.w
  66: add r5.w, r6.w, l(-1.000000)
  67: mad r5.w, cb2[3].w, r5.w, l(1.000000)
  68: mul r5.w, r5.w, cb2[3].x
  69: mul r7.xyz, r6.xyzx, r5.wwww
  70: lt r6.w, cb2[1].w, l(0.999990)
  71: if_nz r6.w
  72:   lt r6.w, l(0.000000), cb2[6].w
  73:   if_nz r6.w
  74:     dp3 r6.w, r4.yzwy, r4.yzwy
  75:     rsq r6.w, r6.w
  76:     mul r8.xyz, r4.yzwy, r6.wwww
  77:     mov r9.x, v3.w
  78:     mov r9.y, v4.w
  79:     mov r9.z, v5.w
  80:     add r10.xyz, -r9.xyzx, cb2[4].xyzx
  81:     div r10.xyz, r10.xyzx, r8.xyzx
  82:     add r11.xyz, -r9.xyzx, cb2[5].xyzx
  83:     div r11.xyz, r11.xyzx, r8.xyzx
  84:     lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r8.xyzx
  85:     movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  86:     min r6.w, r10.y, r10.x
  87:     min r6.w, r10.z, r6.w
  88:     add r9.xyz, r9.xyzx, -cb2[6].xyzx
  89:     mad r4.yzw, r8.xxyz, r6.wwww, r9.xxyz
  90:   endif 
  91:   sample_l r8.xyzw, r4.yzwy, t3.xyzw, s0, r2.w
  92:   add r2.w, r8.w, l(-1.000000)
  93:   mad r2.w, cb2[7].w, r2.w, l(1.000000)
  94:   mul r2.w, r2.w, cb2[7].x
  95:   mul r4.yzw, r8.xxyz, r2.wwww
  96:   mad r6.xyz, r5.wwww, r6.xyzx, -r4.yzwy
  97:   mad r7.xyz, cb2[1].wwww, r6.xyzx, r4.yzwy
  98: endif 
  99: mul r4.yzw, r3.wwww, r7.xxyz
 100: mad r6.xyz, -v2.xyzx, r1.wwww, cb1[0].xyzx
 101: dp3 r1.w, r6.xyzx, r6.xyzx
 102: max r1.w, r1.w, l(0.001000)
 103: rsq r1.w, r1.w
 104: mul r6.xyz, r1.wwww, r6.xyzx
 105: dp3 r1.w, r2.xyzx, -r3.xyzx
 106: dp3_sat r2.w, r2.xyzx, cb1[0].xyzx
 107: dp3_sat r2.x, r2.xyzx, r6.xyzx
 108: dp3_sat r2.y, cb1[0].xyzx, r6.xyzx
 109: mul r2.z, r2.y, r2.y
 110: dp2 r2.z, r2.zzzz, r4.xxxx
 111: add r2.z, r2.z, l(-0.500000)
 112: add r3.x, -r2.w, l(1.000000)
 113: mul r3.y, r3.x, r3.x
 114: mul r3.y, r3.y, r3.y
 115: mul r3.x, r3.x, r3.y
 116: mad r3.x, r2.z, r3.x, l(1.000000)
 117: add r3.y, -|r1.w|, l(1.000000)
 118: mul r3.z, r3.y, r3.y
 119: mul r3.z, r3.z, r3.z
 120: mul r3.y, r3.y, r3.z
 121: mad r2.z, r2.z, r3.y, l(1.000000)
 122: mul r2.z, r2.z, r3.x
 123: mul r2.z, r2.w, r2.z
 124: mul r3.x, r4.x, r4.x
 125: max r3.x, r3.x, l(0.002000)
 126: add r3.z, -r3.x, l(1.000000)
 127: mad r3.w, |r1.w|, r3.z, r3.x
 128: mad r3.z, r2.w, r3.z, r3.x
 129: mul r1.w, |r1.w|, r3.z
 130: mad r1.w, r2.w, r3.w, r1.w
 131: add r1.w, r1.w, l(0.000010)
 132: div r1.w, l(0.500000), r1.w
 133: mul r3.z, r3.x, r3.x
 134: mad r3.w, r2.x, r3.z, -r2.x
 135: mad r2.x, r3.w, r2.x, l(1.000000)
 136: mul r3.z, r3.z, l(0.318310)
 137: mad r2.x, r2.x, r2.x, l(0.000000)
 138: div r2.x, r3.z, r2.x
 139: mul r1.w, r1.w, r2.x
 140: mul r1.w, r1.w, l(3.141593)
 141: max r1.w, r1.w, l(0.000100)
 142: sqrt r1.w, r1.w
 143: mul r1.w, r2.w, r1.w
 144: mul r2.x, r3.x, l(0.280000)
 145: mad r2.x, -r2.x, r4.x, l(1.000000)
 146: dp3 r2.w, r0.xyzx, r0.xyzx
 147: ne r2.w, r2.w, l(0.000000)
 148: and r2.w, r2.w, l(0x3f800000)
 149: mul r1.w, r1.w, r2.w
 150: add r0.w, -r0.w, l(1.000000)
 151: add_sat r0.w, r0.w, cb0[8].w
 152: mul r3.xzw, r2.zzzz, r5.xxyz
 153: mul r5.xyz, r5.xyzx, r1.wwww
 154: add r1.w, -r2.y, l(1.000000)
 155: mul r2.y, r1.w, r1.w
 156: mul r2.y, r2.y, r2.y
 157: mul r1.w, r1.w, r2.y
 158: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 159: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 160: mul r2.yzw, r2.yyzw, r5.xxyz
 161: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 162: mul r2.xyz, r4.yzwy, r2.xxxx
 163: add r3.xzw, -r0.xxyz, r0.wwww
 164: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 165: mad o0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 166: mov o0.w, l(1.000000)
 167: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 29 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  23: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  24: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  25: dp3 r0.w, r0.xyzx, r0.xyzx
  26: rsq r0.w, r0.w
  27: mul r0.xyz, r0.wwww, r0.xyzx
  28: mov o5.xyz, r0.xyzx
  29: mul r0.w, r0.y, r0.y
  30: mad r0.w, r0.x, r0.x, -r0.w
  31: mul r1.xyzw, r0.yzzx, r0.xyzz
  32: dp4 r0.x, cb2[42].xyzw, r1.xyzw
  33: dp4 r0.y, cb2[43].xyzw, r1.xyzw
  34: dp4 r0.z, cb2[44].xyzw, r1.xyzw
  35: mad o6.xyz, cb2[45].xyzx, r0.wwww, r0.xyzx
  36: mov o6.w, l(0)
  37: mov o7.xyzw, l(0,0,0,0)
  38: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 166 math, 15 temp registers, 7 textures, 8 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[8], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 15
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: eq r3.w, cb3[0].x, l(1.000000)
  13: if_nz r3.w
  14:   eq r4.x, cb3[0].y, l(1.000000)
  15:   mul r4.yzw, v4.wwww, cb3[2].xxyz
  16:   mad r4.yzw, cb3[1].xxyz, v3.wwww, r4.yyzw
  17:   mad r4.yzw, cb3[3].xxyz, v5.wwww, r4.yyzw
  18:   add r4.yzw, r4.yyzw, cb3[4].xxyz
  19:   mov r5.y, v3.w
  20:   mov r5.z, v4.w
  21:   mov r5.w, v5.w
  22:   movc r4.xyz, r4.xxxx, r4.yzwy, r5.yzwy
  23:   add r4.xyz, r4.xyzx, -cb3[6].xyzx
  24:   mul r4.yzw, r4.xxyz, cb3[5].xxyz
  25:   mad r4.y, r4.y, l(0.250000), l(0.750000)
  26:   mad r5.x, cb3[0].z, l(0.500000), l(0.750000)
  27:   max r4.x, r4.y, r5.x
  28:   sample r4.xyzw, r4.xzwx, t5.xyzw, s1
  29: else 
  30:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  31: endif 
  32: dp4_sat r4.x, r4.xyzw, cb1[46].xyzw
  33: sample r5.xyzw, v1.xyxx, t1.xyzw, s3
  34: add r4.y, -cb0[9].y, l(1.000000)
  35: mad r4.y, r5.y, cb0[9].y, r4.y
  36: add r4.z, -cb0[8].w, l(1.000000)
  37: dp3 r4.w, r3.xyzx, r2.xyzx
  38: add r4.w, r4.w, r4.w
  39: mad r5.xyz, r2.xyzx, -r4.wwww, r3.xyzx
  40: mul r6.xyz, r4.xxxx, cb0[2].xyzx
  41: if_nz r3.w
  42:   eq r3.w, cb3[0].y, l(1.000000)
  43:   mul r7.xyz, v4.wwww, cb3[2].xyzx
  44:   mad r7.xyz, cb3[1].xyzx, v3.wwww, r7.xyzx
  45:   mad r7.xyz, cb3[3].xyzx, v5.wwww, r7.xyzx
  46:   add r7.xyz, r7.xyzx, cb3[4].xyzx
  47:   mov r8.y, v3.w
  48:   mov r8.z, v4.w
  49:   mov r8.w, v5.w
  50:   movc r7.xyz, r3.wwww, r7.xyzx, r8.yzwy
  51:   add r7.xyz, r7.xyzx, -cb3[6].xyzx
  52:   mul r7.yzw, r7.xxyz, cb3[5].xxyz
  53:   mul r3.w, r7.y, l(0.250000)
  54:   mul r4.x, cb3[0].z, l(0.500000)
  55:   mad r4.w, -cb3[0].z, l(0.500000), l(0.250000)
  56:   max r3.w, r3.w, r4.x
  57:   min r7.x, r4.w, r3.w
  58:   sample r8.xyzw, r7.xzwx, t5.xyzw, s1
  59:   add r9.xyz, r7.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  60:   sample r9.xyzw, r9.xyzx, t5.xyzw, s1
  61:   add r7.xyz, r7.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  62:   sample r7.xyzw, r7.xyzx, t5.xyzw, s1
  63:   mov r2.w, l(1.000000)
  64:   dp4 r8.x, r8.xyzw, r2.xyzw
  65:   dp4 r8.y, r9.xyzw, r2.xyzw
  66:   dp4 r8.z, r7.xyzw, r2.xyzw
  67: else 
  68:   mov r2.w, l(1.000000)
  69:   dp4 r8.x, cb1[39].xyzw, r2.xyzw
  70:   dp4 r8.y, cb1[40].xyzw, r2.xyzw
  71:   dp4 r8.z, cb1[41].xyzw, r2.xyzw
  72: endif 
  73: add r7.xyz, r8.xyzx, v6.xyzx
  74: max r7.xyz, r7.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  75: log r7.xyz, r7.xyzx
  76: mul r7.xyz, r7.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  77: exp r7.xyz, r7.xyzx
  78: mad r7.xyz, r7.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  79: max r7.xyz, r7.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  80: lt r2.w, l(0.000000), cb2[2].w
  81: if_nz r2.w
  82:   dp3 r2.w, r5.xyzx, r5.xyzx
  83:   rsq r2.w, r2.w
  84:   mul r8.xyz, r2.wwww, r5.xyzx
  85:   mov r9.x, v3.w
  86:   mov r9.y, v4.w
  87:   mov r9.z, v5.w
  88:   add r10.xyz, -r9.xyzx, cb2[0].xyzx
  89:   div r10.xyz, r10.xyzx, r8.xyzx
  90:   add r11.xyz, -r9.xyzx, cb2[1].xyzx
  91:   div r11.xyz, r11.xyzx, r8.xyzx
  92:   lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r8.xyzx
  93:   movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  94:   min r2.w, r10.y, r10.x
  95:   min r2.w, r10.z, r2.w
  96:   add r9.xyz, r9.xyzx, -cb2[2].xyzx
  97:   mad r8.xyz, r8.xyzx, r2.wwww, r9.xyzx
  98: else 
  99:   mov r8.xyz, r5.xyzx
 100: endif 
 101: mad r2.w, -r4.z, l(0.700000), l(1.700000)
 102: mul r2.w, r2.w, r4.z
 103: mul r2.w, r2.w, l(6.000000)
 104: sample_l r8.xyzw, r8.xyzx, t3.xyzw, s0, r2.w
 105: add r3.w, r8.w, l(-1.000000)
 106: mad r3.w, cb2[3].w, r3.w, l(1.000000)
 107: mul r3.w, r3.w, cb2[3].x
 108: mul r9.xyz, r8.xyzx, r3.wwww
 109: lt r4.x, cb2[1].w, l(0.999990)
 110: if_nz r4.x
 111:   lt r4.x, l(0.000000), cb2[6].w
 112:   if_nz r4.x
 113:     dp3 r4.x, r5.xyzx, r5.xyzx
 114:     rsq r4.x, r4.x
 115:     mul r10.xyz, r4.xxxx, r5.xyzx
 116:     mov r11.x, v3.w
 117:     mov r11.y, v4.w
 118:     mov r11.z, v5.w
 119:     add r12.xyz, -r11.xyzx, cb2[4].xyzx
 120:     div r12.xyz, r12.xyzx, r10.xyzx
 121:     add r13.xyz, -r11.xyzx, cb2[5].xyzx
 122:     div r13.xyz, r13.xyzx, r10.xyzx
 123:     lt r14.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r10.xyzx
 124:     movc r12.xyz, r14.xyzx, r12.xyzx, r13.xyzx
 125:     min r4.x, r12.y, r12.x
 126:     min r4.x, r12.z, r4.x
 127:     add r11.xyz, r11.xyzx, -cb2[6].xyzx
 128:     mad r5.xyz, r10.xyzx, r4.xxxx, r11.xyzx
 129:   endif 
 130:   sample_l r5.xyzw, r5.xyzx, t4.xyzw, s0, r2.w
 131:   add r2.w, r5.w, l(-1.000000)
 132:   mad r2.w, cb2[7].w, r2.w, l(1.000000)
 133:   mul r2.w, r2.w, cb2[7].x
 134:   mul r5.xyz, r5.xyzx, r2.wwww
 135:   mad r8.xyz, r3.wwww, r8.xyzx, -r5.xyzx
 136:   mad r9.xyz, cb2[1].wwww, r8.xyzx, r5.xyzx
 137: endif 
 138: mul r5.xyz, r4.yyyy, r9.xyzx
 139: mad r8.xyz, -v2.xyzx, r1.wwww, cb1[0].xyzx
 140: dp3 r1.w, r8.xyzx, r8.xyzx
 141: max r1.w, r1.w, l(0.001000)
 142: rsq r1.w, r1.w
 143: mul r8.xyz, r1.wwww, r8.xyzx
 144: dp3 r1.w, r2.xyzx, -r3.xyzx
 145: dp3_sat r2.w, r2.xyzx, cb1[0].xyzx
 146: dp3_sat r2.x, r2.xyzx, r8.xyzx
 147: dp3_sat r2.y, cb1[0].xyzx, r8.xyzx
 148: mul r2.z, r2.y, r2.y
 149: dp2 r2.z, r2.zzzz, r4.zzzz
 150: add r2.z, r2.z, l(-0.500000)
 151: add r3.x, -r2.w, l(1.000000)
 152: mul r3.y, r3.x, r3.x
 153: mul r3.y, r3.y, r3.y
 154: mul r3.x, r3.x, r3.y
 155: mad r3.x, r2.z, r3.x, l(1.000000)
 156: add r3.y, -|r1.w|, l(1.000000)
 157: mul r3.z, r3.y, r3.y
 158: mul r3.z, r3.z, r3.z
 159: mul r3.y, r3.y, r3.z
 160: mad r2.z, r2.z, r3.y, l(1.000000)
 161: mul r2.z, r2.z, r3.x
 162: mul r2.z, r2.w, r2.z
 163: mul r3.x, r4.z, r4.z
 164: max r3.x, r3.x, l(0.002000)
 165: add r3.z, -r3.x, l(1.000000)
 166: mad r3.w, |r1.w|, r3.z, r3.x
 167: mad r3.z, r2.w, r3.z, r3.x
 168: mul r1.w, |r1.w|, r3.z
 169: mad r1.w, r2.w, r3.w, r1.w
 170: add r1.w, r1.w, l(0.000010)
 171: div r1.w, l(0.500000), r1.w
 172: mul r3.z, r3.x, r3.x
 173: mad r3.w, r2.x, r3.z, -r2.x
 174: mad r2.x, r3.w, r2.x, l(1.000000)
 175: mul r3.z, r3.z, l(0.318310)
 176: mad r2.x, r2.x, r2.x, l(0.000000)
 177: div r2.x, r3.z, r2.x
 178: mul r1.w, r1.w, r2.x
 179: mul r1.w, r1.w, l(3.141593)
 180: max r1.w, r1.w, l(0.000100)
 181: sqrt r1.w, r1.w
 182: mul r1.w, r2.w, r1.w
 183: mul r2.x, r3.x, l(0.280000)
 184: mad r2.x, -r2.x, r4.z, l(1.000000)
 185: dp3 r2.w, r0.xyzx, r0.xyzx
 186: ne r2.w, r2.w, l(0.000000)
 187: and r2.w, r2.w, l(0x3f800000)
 188: mul r1.w, r1.w, r2.w
 189: add r0.w, -r0.w, l(1.000000)
 190: add_sat r0.w, r0.w, cb0[8].w
 191: mul r3.xzw, r2.zzzz, r6.xxyz
 192: mad r3.xzw, r7.xxyz, r4.yyyy, r3.xxzw
 193: mul r4.xyz, r6.xyzx, r1.wwww
 194: add r1.w, -r2.y, l(1.000000)
 195: mul r2.y, r1.w, r1.w
 196: mul r2.y, r2.y, r2.y
 197: mul r1.w, r1.w, r2.y
 198: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 199: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 200: mul r2.yzw, r2.yyzw, r4.xxyz
 201: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 202: mul r2.xyz, r5.xyzx, r2.xxxx
 203: add r3.xzw, -r0.xxyz, r0.wwww
 204: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 205: mad r0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 206: sample r1.xyzw, v1.xyxx, t2.xyzw, s4
 207: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
 208: mov o0.w, l(1.000000)
 209: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 29 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  23: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  24: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  25: dp3 r0.w, r0.xyzx, r0.xyzx
  26: rsq r0.w, r0.w
  27: mul r0.xyz, r0.wwww, r0.xyzx
  28: mov o5.xyz, r0.xyzx
  29: mul r0.w, r0.y, r0.y
  30: mad r0.w, r0.x, r0.x, -r0.w
  31: mul r1.xyzw, r0.yzzx, r0.xyzz
  32: dp4 r0.x, cb2[42].xyzw, r1.xyzw
  33: dp4 r0.y, cb2[43].xyzw, r1.xyzw
  34: dp4 r0.z, cb2[44].xyzw, r1.xyzw
  35: mad o6.xyz, cb2[45].xyzx, r0.wwww, r0.xyzx
  36: mov o6.w, l(0)
  37: mov o7.xyzw, l(0,0,0,0)
  38: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 165 math, 15 temp registers, 6 textures, 8 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 2 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 3 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[8], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texturecube (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texture3d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 15
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: eq r3.w, cb3[0].x, l(1.000000)
  13: if_nz r3.w
  14:   eq r4.x, cb3[0].y, l(1.000000)
  15:   mul r4.yzw, v4.wwww, cb3[2].xxyz
  16:   mad r4.yzw, cb3[1].xxyz, v3.wwww, r4.yyzw
  17:   mad r4.yzw, cb3[3].xxyz, v5.wwww, r4.yyzw
  18:   add r4.yzw, r4.yyzw, cb3[4].xxyz
  19:   mov r5.y, v3.w
  20:   mov r5.z, v4.w
  21:   mov r5.w, v5.w
  22:   movc r4.xyz, r4.xxxx, r4.yzwy, r5.yzwy
  23:   add r4.xyz, r4.xyzx, -cb3[6].xyzx
  24:   mul r4.yzw, r4.xxyz, cb3[5].xxyz
  25:   mad r4.y, r4.y, l(0.250000), l(0.750000)
  26:   mad r5.x, cb3[0].z, l(0.500000), l(0.750000)
  27:   max r4.x, r4.y, r5.x
  28:   sample r4.xyzw, r4.xzwx, t4.xyzw, s1
  29: else 
  30:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  31: endif 
  32: dp4_sat r4.x, r4.xyzw, cb1[46].xyzw
  33: sample r5.xyzw, v1.xyxx, t1.xyzw, s3
  34: add r4.y, -cb0[9].y, l(1.000000)
  35: mad r4.y, r5.y, cb0[9].y, r4.y
  36: add r4.z, -cb0[8].w, l(1.000000)
  37: dp3 r4.w, r3.xyzx, r2.xyzx
  38: add r4.w, r4.w, r4.w
  39: mad r5.xyz, r2.xyzx, -r4.wwww, r3.xyzx
  40: mul r6.xyz, r4.xxxx, cb0[2].xyzx
  41: if_nz r3.w
  42:   eq r3.w, cb3[0].y, l(1.000000)
  43:   mul r7.xyz, v4.wwww, cb3[2].xyzx
  44:   mad r7.xyz, cb3[1].xyzx, v3.wwww, r7.xyzx
  45:   mad r7.xyz, cb3[3].xyzx, v5.wwww, r7.xyzx
  46:   add r7.xyz, r7.xyzx, cb3[4].xyzx
  47:   mov r8.y, v3.w
  48:   mov r8.z, v4.w
  49:   mov r8.w, v5.w
  50:   movc r7.xyz, r3.wwww, r7.xyzx, r8.yzwy
  51:   add r7.xyz, r7.xyzx, -cb3[6].xyzx
  52:   mul r7.yzw, r7.xxyz, cb3[5].xxyz
  53:   mul r3.w, r7.y, l(0.250000)
  54:   mul r4.x, cb3[0].z, l(0.500000)
  55:   mad r4.w, -cb3[0].z, l(0.500000), l(0.250000)
  56:   max r3.w, r3.w, r4.x
  57:   min r7.x, r4.w, r3.w
  58:   sample r8.xyzw, r7.xzwx, t4.xyzw, s1
  59:   add r9.xyz, r7.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  60:   sample r9.xyzw, r9.xyzx, t4.xyzw, s1
  61:   add r7.xyz, r7.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  62:   sample r7.xyzw, r7.xyzx, t4.xyzw, s1
  63:   mov r2.w, l(1.000000)
  64:   dp4 r8.x, r8.xyzw, r2.xyzw
  65:   dp4 r8.y, r9.xyzw, r2.xyzw
  66:   dp4 r8.z, r7.xyzw, r2.xyzw
  67: else 
  68:   mov r2.w, l(1.000000)
  69:   dp4 r8.x, cb1[39].xyzw, r2.xyzw
  70:   dp4 r8.y, cb1[40].xyzw, r2.xyzw
  71:   dp4 r8.z, cb1[41].xyzw, r2.xyzw
  72: endif 
  73: add r7.xyz, r8.xyzx, v6.xyzx
  74: max r7.xyz, r7.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  75: log r7.xyz, r7.xyzx
  76: mul r7.xyz, r7.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  77: exp r7.xyz, r7.xyzx
  78: mad r7.xyz, r7.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  79: max r7.xyz, r7.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  80: lt r2.w, l(0.000000), cb2[2].w
  81: if_nz r2.w
  82:   dp3 r2.w, r5.xyzx, r5.xyzx
  83:   rsq r2.w, r2.w
  84:   mul r8.xyz, r2.wwww, r5.xyzx
  85:   mov r9.x, v3.w
  86:   mov r9.y, v4.w
  87:   mov r9.z, v5.w
  88:   add r10.xyz, -r9.xyzx, cb2[0].xyzx
  89:   div r10.xyz, r10.xyzx, r8.xyzx
  90:   add r11.xyz, -r9.xyzx, cb2[1].xyzx
  91:   div r11.xyz, r11.xyzx, r8.xyzx
  92:   lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r8.xyzx
  93:   movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  94:   min r2.w, r10.y, r10.x
  95:   min r2.w, r10.z, r2.w
  96:   add r9.xyz, r9.xyzx, -cb2[2].xyzx
  97:   mad r8.xyz, r8.xyzx, r2.wwww, r9.xyzx
  98: else 
  99:   mov r8.xyz, r5.xyzx
 100: endif 
 101: mad r2.w, -r4.z, l(0.700000), l(1.700000)
 102: mul r2.w, r2.w, r4.z
 103: mul r2.w, r2.w, l(6.000000)
 104: sample_l r8.xyzw, r8.xyzx, t2.xyzw, s0, r2.w
 105: add r3.w, r8.w, l(-1.000000)
 106: mad r3.w, cb2[3].w, r3.w, l(1.000000)
 107: mul r3.w, r3.w, cb2[3].x
 108: mul r9.xyz, r8.xyzx, r3.wwww
 109: lt r4.x, cb2[1].w, l(0.999990)
 110: if_nz r4.x
 111:   lt r4.x, l(0.000000), cb2[6].w
 112:   if_nz r4.x
 113:     dp3 r4.x, r5.xyzx, r5.xyzx
 114:     rsq r4.x, r4.x
 115:     mul r10.xyz, r4.xxxx, r5.xyzx
 116:     mov r11.x, v3.w
 117:     mov r11.y, v4.w
 118:     mov r11.z, v5.w
 119:     add r12.xyz, -r11.xyzx, cb2[4].xyzx
 120:     div r12.xyz, r12.xyzx, r10.xyzx
 121:     add r13.xyz, -r11.xyzx, cb2[5].xyzx
 122:     div r13.xyz, r13.xyzx, r10.xyzx
 123:     lt r14.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r10.xyzx
 124:     movc r12.xyz, r14.xyzx, r12.xyzx, r13.xyzx
 125:     min r4.x, r12.y, r12.x
 126:     min r4.x, r12.z, r4.x
 127:     add r11.xyz, r11.xyzx, -cb2[6].xyzx
 128:     mad r5.xyz, r10.xyzx, r4.xxxx, r11.xyzx
 129:   endif 
 130:   sample_l r5.xyzw, r5.xyzx, t3.xyzw, s0, r2.w
 131:   add r2.w, r5.w, l(-1.000000)
 132:   mad r2.w, cb2[7].w, r2.w, l(1.000000)
 133:   mul r2.w, r2.w, cb2[7].x
 134:   mul r5.xyz, r5.xyzx, r2.wwww
 135:   mad r8.xyz, r3.wwww, r8.xyzx, -r5.xyzx
 136:   mad r9.xyz, cb2[1].wwww, r8.xyzx, r5.xyzx
 137: endif 
 138: mul r5.xyz, r4.yyyy, r9.xyzx
 139: mad r8.xyz, -v2.xyzx, r1.wwww, cb1[0].xyzx
 140: dp3 r1.w, r8.xyzx, r8.xyzx
 141: max r1.w, r1.w, l(0.001000)
 142: rsq r1.w, r1.w
 143: mul r8.xyz, r1.wwww, r8.xyzx
 144: dp3 r1.w, r2.xyzx, -r3.xyzx
 145: dp3_sat r2.w, r2.xyzx, cb1[0].xyzx
 146: dp3_sat r2.x, r2.xyzx, r8.xyzx
 147: dp3_sat r2.y, cb1[0].xyzx, r8.xyzx
 148: mul r2.z, r2.y, r2.y
 149: dp2 r2.z, r2.zzzz, r4.zzzz
 150: add r2.z, r2.z, l(-0.500000)
 151: add r3.x, -r2.w, l(1.000000)
 152: mul r3.y, r3.x, r3.x
 153: mul r3.y, r3.y, r3.y
 154: mul r3.x, r3.x, r3.y
 155: mad r3.x, r2.z, r3.x, l(1.000000)
 156: add r3.y, -|r1.w|, l(1.000000)
 157: mul r3.z, r3.y, r3.y
 158: mul r3.z, r3.z, r3.z
 159: mul r3.y, r3.y, r3.z
 160: mad r2.z, r2.z, r3.y, l(1.000000)
 161: mul r2.z, r2.z, r3.x
 162: mul r2.z, r2.w, r2.z
 163: mul r3.x, r4.z, r4.z
 164: max r3.x, r3.x, l(0.002000)
 165: add r3.z, -r3.x, l(1.000000)
 166: mad r3.w, |r1.w|, r3.z, r3.x
 167: mad r3.z, r2.w, r3.z, r3.x
 168: mul r1.w, |r1.w|, r3.z
 169: mad r1.w, r2.w, r3.w, r1.w
 170: add r1.w, r1.w, l(0.000010)
 171: div r1.w, l(0.500000), r1.w
 172: mul r3.z, r3.x, r3.x
 173: mad r3.w, r2.x, r3.z, -r2.x
 174: mad r2.x, r3.w, r2.x, l(1.000000)
 175: mul r3.z, r3.z, l(0.318310)
 176: mad r2.x, r2.x, r2.x, l(0.000000)
 177: div r2.x, r3.z, r2.x
 178: mul r1.w, r1.w, r2.x
 179: mul r1.w, r1.w, l(3.141593)
 180: max r1.w, r1.w, l(0.000100)
 181: sqrt r1.w, r1.w
 182: mul r1.w, r2.w, r1.w
 183: mul r2.x, r3.x, l(0.280000)
 184: mad r2.x, -r2.x, r4.z, l(1.000000)
 185: dp3 r2.w, r0.xyzx, r0.xyzx
 186: ne r2.w, r2.w, l(0.000000)
 187: and r2.w, r2.w, l(0x3f800000)
 188: mul r1.w, r1.w, r2.w
 189: add r0.w, -r0.w, l(1.000000)
 190: add_sat r0.w, r0.w, cb0[8].w
 191: mul r3.xzw, r2.zzzz, r6.xxyz
 192: mad r3.xzw, r7.xxyz, r4.yyyy, r3.xxzw
 193: mul r4.xyz, r6.xyzx, r1.wwww
 194: add r1.w, -r2.y, l(1.000000)
 195: mul r2.y, r1.w, r1.w
 196: mul r2.y, r2.y, r2.y
 197: mul r1.w, r1.w, r2.y
 198: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 199: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 200: mul r2.yzw, r2.yyzw, r4.xxyz
 201: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 202: mul r2.xyz, r5.xyzx, r2.xxxx
 203: add r3.xzw, -r0.xxyz, r0.wwww
 204: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 205: mad o0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 206: mov o0.w, l(1.000000)
 207: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 149 math, 13 temp registers, 5 textures, 6 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_sampler s5, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texturecube (float,float,float,float) t5
      dcl_resource_texture3d (float,float,float,float) t6
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 13
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r2.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r3.w, r5.xyzx, r5.xyzx
  22: sqrt r3.w, r3.w
  23: add r3.w, -r2.w, r3.w
  24: mad r2.w, cb3[25].w, r3.w, r2.w
  25: mad_sat r2.w, r2.w, cb3[24].z, cb3[24].w
  26: eq r3.w, cb6[0].x, l(1.000000)
  27: if_nz r3.w
  28:   eq r3.w, cb6[0].y, l(1.000000)
  29:   mul r5.xyz, v4.wwww, cb6[2].xyzx
  30:   mad r5.xyz, cb6[1].xyzx, v3.wwww, r5.xyzx
  31:   mad r5.xyz, cb6[3].xyzx, v5.wwww, r5.xyzx
  32:   add r5.xyz, r5.xyzx, cb6[4].xyzx
  33:   movc r5.xyz, r3.wwww, r5.xyzx, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r3.w, r5.y, l(0.250000), l(0.750000)
  37:   mad r4.w, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r3.w, r4.w
  39:   sample r5.xyzw, r5.xzwx, t6.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r3.w, r5.xyzw, cb2[46].xyzw
  44: div r5.xy, v7.xyxx, v7.wwww
  45: sample r5.xyzw, r5.xyxx, t1.xyzw, s5
  46: add r3.w, r3.w, -r5.x
  47: mad r2.w, r2.w, r3.w, r5.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r3.w, -cb0[9].y, l(1.000000)
  50: mad r3.w, r5.y, cb0[9].y, r3.w
  51: add r4.w, -cb0[8].w, l(1.000000)
  52: dp3 r5.x, r3.xyzx, r2.xyzx
  53: add r5.x, r5.x, r5.x
  54: mad r5.xyz, r2.xyzx, -r5.xxxx, r3.xyzx
  55: mul r6.xyz, r2.wwww, cb0[2].xyzx
  56: lt r2.w, l(0.000000), cb5[2].w
  57: if_nz r2.w
  58:   dp3 r2.w, r5.xyzx, r5.xyzx
  59:   rsq r2.w, r2.w
  60:   mul r7.xyz, r2.wwww, r5.xyzx
  61:   add r8.xyz, -r4.xyzx, cb5[0].xyzx
  62:   div r8.xyz, r8.xyzx, r7.xyzx
  63:   add r9.xyz, -r4.xyzx, cb5[1].xyzx
  64:   div r9.xyz, r9.xyzx, r7.xyzx
  65:   lt r10.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r7.xyzx
  66:   movc r8.xyz, r10.xyzx, r8.xyzx, r9.xyzx
  67:   min r2.w, r8.y, r8.x
  68:   min r2.w, r8.z, r2.w
  69:   add r8.xyz, r4.xyzx, -cb5[2].xyzx
  70:   mad r7.xyz, r7.xyzx, r2.wwww, r8.xyzx
  71: else 
  72:   mov r7.xyz, r5.xyzx
  73: endif 
  74: mad r2.w, -r4.w, l(0.700000), l(1.700000)
  75: mul r2.w, r2.w, r4.w
  76: mul r2.w, r2.w, l(6.000000)
  77: sample_l r7.xyzw, r7.xyzx, t4.xyzw, s0, r2.w
  78: add r5.w, r7.w, l(-1.000000)
  79: mad r5.w, cb5[3].w, r5.w, l(1.000000)
  80: mul r5.w, r5.w, cb5[3].x
  81: mul r8.xyz, r7.xyzx, r5.wwww
  82: lt r6.w, cb5[1].w, l(0.999990)
  83: if_nz r6.w
  84:   lt r6.w, l(0.000000), cb5[6].w
  85:   if_nz r6.w
  86:     dp3 r6.w, r5.xyzx, r5.xyzx
  87:     rsq r6.w, r6.w
  88:     mul r9.xyz, r5.xyzx, r6.wwww
  89:     add r10.xyz, -r4.xyzx, cb5[4].xyzx
  90:     div r10.xyz, r10.xyzx, r9.xyzx
  91:     add r11.xyz, -r4.xyzx, cb5[5].xyzx
  92:     div r11.xyz, r11.xyzx, r9.xyzx
  93:     lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
  94:     movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  95:     min r6.w, r10.y, r10.x
  96:     min r6.w, r10.z, r6.w
  97:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
  98:     mad r5.xyz, r9.xyzx, r6.wwww, r4.xyzx
  99:   endif 
 100:   sample_l r9.xyzw, r5.xyzx, t5.xyzw, s0, r2.w
 101:   add r2.w, r9.w, l(-1.000000)
 102:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 103:   mul r2.w, r2.w, cb5[7].x
 104:   mul r4.xyz, r9.xyzx, r2.wwww
 105:   mad r5.xyz, r5.wwww, r7.xyzx, -r4.xyzx
 106:   mad r8.xyz, cb5[1].wwww, r5.xyzx, r4.xyzx
 107: endif 
 108: mul r4.xyz, r3.wwww, r8.xyzx
 109: mad r5.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 110: dp3 r1.w, r5.xyzx, r5.xyzx
 111: max r1.w, r1.w, l(0.001000)
 112: rsq r1.w, r1.w
 113: mul r5.xyz, r1.wwww, r5.xyzx
 114: dp3 r1.w, r2.xyzx, -r3.xyzx
 115: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 116: dp3_sat r2.x, r2.xyzx, r5.xyzx
 117: dp3_sat r2.y, cb2[0].xyzx, r5.xyzx
 118: mul r2.z, r2.y, r2.y
 119: dp2 r2.z, r2.zzzz, r4.wwww
 120: add r2.z, r2.z, l(-0.500000)
 121: add r3.x, -r2.w, l(1.000000)
 122: mul r3.y, r3.x, r3.x
 123: mul r3.y, r3.y, r3.y
 124: mul r3.x, r3.x, r3.y
 125: mad r3.x, r2.z, r3.x, l(1.000000)
 126: add r3.y, -|r1.w|, l(1.000000)
 127: mul r3.z, r3.y, r3.y
 128: mul r3.z, r3.z, r3.z
 129: mul r3.y, r3.y, r3.z
 130: mad r2.z, r2.z, r3.y, l(1.000000)
 131: mul r2.z, r2.z, r3.x
 132: mul r2.z, r2.w, r2.z
 133: mul r3.x, r4.w, r4.w
 134: max r3.x, r3.x, l(0.002000)
 135: add r3.z, -r3.x, l(1.000000)
 136: mad r3.w, |r1.w|, r3.z, r3.x
 137: mad r3.z, r2.w, r3.z, r3.x
 138: mul r1.w, |r1.w|, r3.z
 139: mad r1.w, r2.w, r3.w, r1.w
 140: add r1.w, r1.w, l(0.000010)
 141: div r1.w, l(0.500000), r1.w
 142: mul r3.z, r3.x, r3.x
 143: mad r3.w, r2.x, r3.z, -r2.x
 144: mad r2.x, r3.w, r2.x, l(1.000000)
 145: mul r3.z, r3.z, l(0.318310)
 146: mad r2.x, r2.x, r2.x, l(0.000000)
 147: div r2.x, r3.z, r2.x
 148: mul r1.w, r1.w, r2.x
 149: mul r1.w, r1.w, l(3.141593)
 150: max r1.w, r1.w, l(0.000100)
 151: sqrt r1.w, r1.w
 152: mul r1.w, r2.w, r1.w
 153: mul r2.x, r3.x, l(0.280000)
 154: mad r2.x, -r2.x, r4.w, l(1.000000)
 155: dp3 r2.w, r0.xyzx, r0.xyzx
 156: ne r2.w, r2.w, l(0.000000)
 157: and r2.w, r2.w, l(0x3f800000)
 158: mul r1.w, r1.w, r2.w
 159: add r0.w, -r0.w, l(1.000000)
 160: add_sat r0.w, r0.w, cb0[8].w
 161: mul r3.xzw, r2.zzzz, r6.xxyz
 162: mul r5.xyz, r6.xyzx, r1.wwww
 163: add r1.w, -r2.y, l(1.000000)
 164: mul r2.y, r1.w, r1.w
 165: mul r2.y, r2.y, r2.y
 166: mul r1.w, r1.w, r2.y
 167: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 168: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 169: mul r2.yzw, r2.yyzw, r5.xxyz
 170: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 171: mul r2.xyz, r4.xyzx, r2.xxxx
 172: add r3.xzw, -r0.xxyz, r0.wwww
 173: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 174: mad r0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 175: sample r1.xyzw, v1.xyxx, t3.xyzw, s4
 176: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
 177: mov o0.w, l(1.000000)
 178: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 148 math, 13 temp registers, 4 textures, 6 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 13
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r2.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r3.w, r5.xyzx, r5.xyzx
  22: sqrt r3.w, r3.w
  23: add r3.w, -r2.w, r3.w
  24: mad r2.w, cb3[25].w, r3.w, r2.w
  25: mad_sat r2.w, r2.w, cb3[24].z, cb3[24].w
  26: eq r3.w, cb6[0].x, l(1.000000)
  27: if_nz r3.w
  28:   eq r3.w, cb6[0].y, l(1.000000)
  29:   mul r5.xyz, v4.wwww, cb6[2].xyzx
  30:   mad r5.xyz, cb6[1].xyzx, v3.wwww, r5.xyzx
  31:   mad r5.xyz, cb6[3].xyzx, v5.wwww, r5.xyzx
  32:   add r5.xyz, r5.xyzx, cb6[4].xyzx
  33:   movc r5.xyz, r3.wwww, r5.xyzx, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r3.w, r5.y, l(0.250000), l(0.750000)
  37:   mad r4.w, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r3.w, r4.w
  39:   sample r5.xyzw, r5.xzwx, t5.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r3.w, r5.xyzw, cb2[46].xyzw
  44: div r5.xy, v7.xyxx, v7.wwww
  45: sample r5.xyzw, r5.xyxx, t1.xyzw, s4
  46: add r3.w, r3.w, -r5.x
  47: mad r2.w, r2.w, r3.w, r5.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r3.w, -cb0[9].y, l(1.000000)
  50: mad r3.w, r5.y, cb0[9].y, r3.w
  51: add r4.w, -cb0[8].w, l(1.000000)
  52: dp3 r5.x, r3.xyzx, r2.xyzx
  53: add r5.x, r5.x, r5.x
  54: mad r5.xyz, r2.xyzx, -r5.xxxx, r3.xyzx
  55: mul r6.xyz, r2.wwww, cb0[2].xyzx
  56: lt r2.w, l(0.000000), cb5[2].w
  57: if_nz r2.w
  58:   dp3 r2.w, r5.xyzx, r5.xyzx
  59:   rsq r2.w, r2.w
  60:   mul r7.xyz, r2.wwww, r5.xyzx
  61:   add r8.xyz, -r4.xyzx, cb5[0].xyzx
  62:   div r8.xyz, r8.xyzx, r7.xyzx
  63:   add r9.xyz, -r4.xyzx, cb5[1].xyzx
  64:   div r9.xyz, r9.xyzx, r7.xyzx
  65:   lt r10.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r7.xyzx
  66:   movc r8.xyz, r10.xyzx, r8.xyzx, r9.xyzx
  67:   min r2.w, r8.y, r8.x
  68:   min r2.w, r8.z, r2.w
  69:   add r8.xyz, r4.xyzx, -cb5[2].xyzx
  70:   mad r7.xyz, r7.xyzx, r2.wwww, r8.xyzx
  71: else 
  72:   mov r7.xyz, r5.xyzx
  73: endif 
  74: mad r2.w, -r4.w, l(0.700000), l(1.700000)
  75: mul r2.w, r2.w, r4.w
  76: mul r2.w, r2.w, l(6.000000)
  77: sample_l r7.xyzw, r7.xyzx, t3.xyzw, s0, r2.w
  78: add r5.w, r7.w, l(-1.000000)
  79: mad r5.w, cb5[3].w, r5.w, l(1.000000)
  80: mul r5.w, r5.w, cb5[3].x
  81: mul r8.xyz, r7.xyzx, r5.wwww
  82: lt r6.w, cb5[1].w, l(0.999990)
  83: if_nz r6.w
  84:   lt r6.w, l(0.000000), cb5[6].w
  85:   if_nz r6.w
  86:     dp3 r6.w, r5.xyzx, r5.xyzx
  87:     rsq r6.w, r6.w
  88:     mul r9.xyz, r5.xyzx, r6.wwww
  89:     add r10.xyz, -r4.xyzx, cb5[4].xyzx
  90:     div r10.xyz, r10.xyzx, r9.xyzx
  91:     add r11.xyz, -r4.xyzx, cb5[5].xyzx
  92:     div r11.xyz, r11.xyzx, r9.xyzx
  93:     lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
  94:     movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  95:     min r6.w, r10.y, r10.x
  96:     min r6.w, r10.z, r6.w
  97:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
  98:     mad r5.xyz, r9.xyzx, r6.wwww, r4.xyzx
  99:   endif 
 100:   sample_l r9.xyzw, r5.xyzx, t4.xyzw, s0, r2.w
 101:   add r2.w, r9.w, l(-1.000000)
 102:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 103:   mul r2.w, r2.w, cb5[7].x
 104:   mul r4.xyz, r9.xyzx, r2.wwww
 105:   mad r5.xyz, r5.wwww, r7.xyzx, -r4.xyzx
 106:   mad r8.xyz, cb5[1].wwww, r5.xyzx, r4.xyzx
 107: endif 
 108: mul r4.xyz, r3.wwww, r8.xyzx
 109: mad r5.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 110: dp3 r1.w, r5.xyzx, r5.xyzx
 111: max r1.w, r1.w, l(0.001000)
 112: rsq r1.w, r1.w
 113: mul r5.xyz, r1.wwww, r5.xyzx
 114: dp3 r1.w, r2.xyzx, -r3.xyzx
 115: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 116: dp3_sat r2.x, r2.xyzx, r5.xyzx
 117: dp3_sat r2.y, cb2[0].xyzx, r5.xyzx
 118: mul r2.z, r2.y, r2.y
 119: dp2 r2.z, r2.zzzz, r4.wwww
 120: add r2.z, r2.z, l(-0.500000)
 121: add r3.x, -r2.w, l(1.000000)
 122: mul r3.y, r3.x, r3.x
 123: mul r3.y, r3.y, r3.y
 124: mul r3.x, r3.x, r3.y
 125: mad r3.x, r2.z, r3.x, l(1.000000)
 126: add r3.y, -|r1.w|, l(1.000000)
 127: mul r3.z, r3.y, r3.y
 128: mul r3.z, r3.z, r3.z
 129: mul r3.y, r3.y, r3.z
 130: mad r2.z, r2.z, r3.y, l(1.000000)
 131: mul r2.z, r2.z, r3.x
 132: mul r2.z, r2.w, r2.z
 133: mul r3.x, r4.w, r4.w
 134: max r3.x, r3.x, l(0.002000)
 135: add r3.z, -r3.x, l(1.000000)
 136: mad r3.w, |r1.w|, r3.z, r3.x
 137: mad r3.z, r2.w, r3.z, r3.x
 138: mul r1.w, |r1.w|, r3.z
 139: mad r1.w, r2.w, r3.w, r1.w
 140: add r1.w, r1.w, l(0.000010)
 141: div r1.w, l(0.500000), r1.w
 142: mul r3.z, r3.x, r3.x
 143: mad r3.w, r2.x, r3.z, -r2.x
 144: mad r2.x, r3.w, r2.x, l(1.000000)
 145: mul r3.z, r3.z, l(0.318310)
 146: mad r2.x, r2.x, r2.x, l(0.000000)
 147: div r2.x, r3.z, r2.x
 148: mul r1.w, r1.w, r2.x
 149: mul r1.w, r1.w, l(3.141593)
 150: max r1.w, r1.w, l(0.000100)
 151: sqrt r1.w, r1.w
 152: mul r1.w, r2.w, r1.w
 153: mul r2.x, r3.x, l(0.280000)
 154: mad r2.x, -r2.x, r4.w, l(1.000000)
 155: dp3 r2.w, r0.xyzx, r0.xyzx
 156: ne r2.w, r2.w, l(0.000000)
 157: and r2.w, r2.w, l(0x3f800000)
 158: mul r1.w, r1.w, r2.w
 159: add r0.w, -r0.w, l(1.000000)
 160: add_sat r0.w, r0.w, cb0[8].w
 161: mul r3.xzw, r2.zzzz, r6.xxyz
 162: mul r5.xyz, r6.xyzx, r1.wwww
 163: add r1.w, -r2.y, l(1.000000)
 164: mul r2.y, r1.w, r1.w
 165: mul r2.y, r2.y, r2.y
 166: mul r1.w, r1.w, r2.y
 167: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 168: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 169: mul r2.yzw, r2.yyzw, r5.xxyz
 170: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 171: mul r2.xyz, r4.xyzx, r2.xxxx
 172: add r3.xzw, -r0.xxyz, r0.wwww
 173: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 174: mad o0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 175: mov o0.w, l(1.000000)
 176: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 32 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul r1.xyz, r1.wwww, r1.xyzx
  29: mov o5.xyz, r1.xyzx
  30: mul r1.w, r1.y, r1.y
  31: mad r1.w, r1.x, r1.x, -r1.w
  32: mul r2.xyzw, r1.yzzx, r1.xyzz
  33: dp4 r1.x, cb2[42].xyzw, r2.xyzw
  34: dp4 r1.y, cb2[43].xyzw, r2.xyzw
  35: dp4 r1.z, cb2[44].xyzw, r2.xyzw
  36: mad o6.xyz, cb2[45].xyzx, r1.wwww, r1.xyzx
  37: mov o6.w, l(0)
  38: mul r0.y, r0.y, cb1[5].x
  39: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  40: mov o7.zw, r0.zzzw
  41: add o7.xy, r1.zzzz, r1.xwxx
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 177 math, 15 temp registers, 8 textures, 8 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_sampler s5, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texturecube (float,float,float,float) t5
      dcl_resource_texture3d (float,float,float,float) t6
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 15
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r3.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r4.w, r5.xyzx, r5.xyzx
  22: sqrt r4.w, r4.w
  23: add r4.w, -r3.w, r4.w
  24: mad r3.w, cb3[25].w, r4.w, r3.w
  25: mad_sat r3.w, r3.w, cb3[24].z, cb3[24].w
  26: eq r4.w, cb6[0].x, l(1.000000)
  27: if_nz r4.w
  28:   eq r5.x, cb6[0].y, l(1.000000)
  29:   mul r5.yzw, v4.wwww, cb6[2].xxyz
  30:   mad r5.yzw, cb6[1].xxyz, v3.wwww, r5.yyzw
  31:   mad r5.yzw, cb6[3].xxyz, v5.wwww, r5.yyzw
  32:   add r5.yzw, r5.yyzw, cb6[4].xxyz
  33:   movc r5.xyz, r5.xxxx, r5.yzwy, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r5.y, r5.y, l(0.250000), l(0.750000)
  37:   mad r6.x, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r5.y, r6.x
  39:   sample r5.xyzw, r5.xzwx, t6.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r5.x, r5.xyzw, cb2[46].xyzw
  44: div r5.yz, v7.xxyx, v7.wwww
  45: sample r6.xyzw, r5.yzyy, t1.xyzw, s5
  46: add r5.x, r5.x, -r6.x
  47: mad r3.w, r3.w, r5.x, r6.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r5.x, -cb0[9].y, l(1.000000)
  50: mad r5.x, r5.y, cb0[9].y, r5.x
  51: add r5.y, -cb0[8].w, l(1.000000)
  52: dp3 r5.z, r3.xyzx, r2.xyzx
  53: add r5.z, r5.z, r5.z
  54: mad r6.xyz, r2.xyzx, -r5.zzzz, r3.xyzx
  55: mul r7.xyz, r3.wwww, cb0[2].xyzx
  56: if_nz r4.w
  57:   eq r3.w, cb6[0].y, l(1.000000)
  58:   mul r8.xyz, v4.wwww, cb6[2].xyzx
  59:   mad r8.xyz, cb6[1].xyzx, v3.wwww, r8.xyzx
  60:   mad r8.xyz, cb6[3].xyzx, v5.wwww, r8.xyzx
  61:   add r8.xyz, r8.xyzx, cb6[4].xyzx
  62:   movc r8.xyz, r3.wwww, r8.xyzx, r4.xyzx
  63:   add r8.xyz, r8.xyzx, -cb6[6].xyzx
  64:   mul r8.yzw, r8.xxyz, cb6[5].xxyz
  65:   mul r3.w, r8.y, l(0.250000)
  66:   mul r4.w, cb6[0].z, l(0.500000)
  67:   mad r5.z, -cb6[0].z, l(0.500000), l(0.250000)
  68:   max r3.w, r3.w, r4.w
  69:   min r8.x, r5.z, r3.w
  70:   sample r9.xyzw, r8.xzwx, t6.xyzw, s1
  71:   add r10.xyz, r8.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  72:   sample r10.xyzw, r10.xyzx, t6.xyzw, s1
  73:   add r8.xyz, r8.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  74:   sample r8.xyzw, r8.xyzx, t6.xyzw, s1
  75:   mov r2.w, l(1.000000)
  76:   dp4 r9.x, r9.xyzw, r2.xyzw
  77:   dp4 r9.y, r10.xyzw, r2.xyzw
  78:   dp4 r9.z, r8.xyzw, r2.xyzw
  79: else 
  80:   mov r2.w, l(1.000000)
  81:   dp4 r9.x, cb2[39].xyzw, r2.xyzw
  82:   dp4 r9.y, cb2[40].xyzw, r2.xyzw
  83:   dp4 r9.z, cb2[41].xyzw, r2.xyzw
  84: endif 
  85: add r8.xyz, r9.xyzx, v6.xyzx
  86: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  87: log r8.xyz, r8.xyzx
  88: mul r8.xyz, r8.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  89: exp r8.xyz, r8.xyzx
  90: mad r8.xyz, r8.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  91: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  92: lt r2.w, l(0.000000), cb5[2].w
  93: if_nz r2.w
  94:   dp3 r2.w, r6.xyzx, r6.xyzx
  95:   rsq r2.w, r2.w
  96:   mul r9.xyz, r2.wwww, r6.xyzx
  97:   add r10.xyz, -r4.xyzx, cb5[0].xyzx
  98:   div r10.xyz, r10.xyzx, r9.xyzx
  99:   add r11.xyz, -r4.xyzx, cb5[1].xyzx
 100:   div r11.xyz, r11.xyzx, r9.xyzx
 101:   lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
 102:   movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
 103:   min r2.w, r10.y, r10.x
 104:   min r2.w, r10.z, r2.w
 105:   add r10.xyz, r4.xyzx, -cb5[2].xyzx
 106:   mad r9.xyz, r9.xyzx, r2.wwww, r10.xyzx
 107: else 
 108:   mov r9.xyz, r6.xyzx
 109: endif 
 110: mad r2.w, -r5.y, l(0.700000), l(1.700000)
 111: mul r2.w, r2.w, r5.y
 112: mul r2.w, r2.w, l(6.000000)
 113: sample_l r9.xyzw, r9.xyzx, t4.xyzw, s0, r2.w
 114: add r3.w, r9.w, l(-1.000000)
 115: mad r3.w, cb5[3].w, r3.w, l(1.000000)
 116: mul r3.w, r3.w, cb5[3].x
 117: mul r10.xyz, r9.xyzx, r3.wwww
 118: lt r4.w, cb5[1].w, l(0.999990)
 119: if_nz r4.w
 120:   lt r4.w, l(0.000000), cb5[6].w
 121:   if_nz r4.w
 122:     dp3 r4.w, r6.xyzx, r6.xyzx
 123:     rsq r4.w, r4.w
 124:     mul r11.xyz, r4.wwww, r6.xyzx
 125:     add r12.xyz, -r4.xyzx, cb5[4].xyzx
 126:     div r12.xyz, r12.xyzx, r11.xyzx
 127:     add r13.xyz, -r4.xyzx, cb5[5].xyzx
 128:     div r13.xyz, r13.xyzx, r11.xyzx
 129:     lt r14.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r11.xyzx
 130:     movc r12.xyz, r14.xyzx, r12.xyzx, r13.xyzx
 131:     min r4.w, r12.y, r12.x
 132:     min r4.w, r12.z, r4.w
 133:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
 134:     mad r6.xyz, r11.xyzx, r4.wwww, r4.xyzx
 135:   endif 
 136:   sample_l r4.xyzw, r6.xyzx, t5.xyzw, s0, r2.w
 137:   add r2.w, r4.w, l(-1.000000)
 138:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 139:   mul r2.w, r2.w, cb5[7].x
 140:   mul r4.xyz, r4.xyzx, r2.wwww
 141:   mad r6.xyz, r3.wwww, r9.xyzx, -r4.xyzx
 142:   mad r10.xyz, cb5[1].wwww, r6.xyzx, r4.xyzx
 143: endif 
 144: mul r4.xyz, r5.xxxx, r10.xyzx
 145: mad r6.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 146: dp3 r1.w, r6.xyzx, r6.xyzx
 147: max r1.w, r1.w, l(0.001000)
 148: rsq r1.w, r1.w
 149: mul r6.xyz, r1.wwww, r6.xyzx
 150: dp3 r1.w, r2.xyzx, -r3.xyzx
 151: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 152: dp3_sat r2.x, r2.xyzx, r6.xyzx
 153: dp3_sat r2.y, cb2[0].xyzx, r6.xyzx
 154: mul r2.z, r2.y, r2.y
 155: dp2 r2.z, r2.zzzz, r5.yyyy
 156: add r2.z, r2.z, l(-0.500000)
 157: add r3.x, -r2.w, l(1.000000)
 158: mul r3.y, r3.x, r3.x
 159: mul r3.y, r3.y, r3.y
 160: mul r3.x, r3.x, r3.y
 161: mad r3.x, r2.z, r3.x, l(1.000000)
 162: add r3.y, -|r1.w|, l(1.000000)
 163: mul r3.z, r3.y, r3.y
 164: mul r3.z, r3.z, r3.z
 165: mul r3.y, r3.y, r3.z
 166: mad r2.z, r2.z, r3.y, l(1.000000)
 167: mul r2.z, r2.z, r3.x
 168: mul r2.z, r2.w, r2.z
 169: mul r3.x, r5.y, r5.y
 170: max r3.x, r3.x, l(0.002000)
 171: add r3.z, -r3.x, l(1.000000)
 172: mad r3.w, |r1.w|, r3.z, r3.x
 173: mad r3.z, r2.w, r3.z, r3.x
 174: mul r1.w, |r1.w|, r3.z
 175: mad r1.w, r2.w, r3.w, r1.w
 176: add r1.w, r1.w, l(0.000010)
 177: div r1.w, l(0.500000), r1.w
 178: mul r3.z, r3.x, r3.x
 179: mad r3.w, r2.x, r3.z, -r2.x
 180: mad r2.x, r3.w, r2.x, l(1.000000)
 181: mul r3.z, r3.z, l(0.318310)
 182: mad r2.x, r2.x, r2.x, l(0.000000)
 183: div r2.x, r3.z, r2.x
 184: mul r1.w, r1.w, r2.x
 185: mul r1.w, r1.w, l(3.141593)
 186: max r1.w, r1.w, l(0.000100)
 187: sqrt r1.w, r1.w
 188: mul r1.w, r2.w, r1.w
 189: mul r2.x, r3.x, l(0.280000)
 190: mad r2.x, -r2.x, r5.y, l(1.000000)
 191: dp3 r2.w, r0.xyzx, r0.xyzx
 192: ne r2.w, r2.w, l(0.000000)
 193: and r2.w, r2.w, l(0x3f800000)
 194: mul r1.w, r1.w, r2.w
 195: add r0.w, -r0.w, l(1.000000)
 196: add_sat r0.w, r0.w, cb0[8].w
 197: mul r3.xzw, r2.zzzz, r7.xxyz
 198: mad r3.xzw, r8.xxyz, r5.xxxx, r3.xxzw
 199: mul r5.xyz, r7.xyzx, r1.wwww
 200: add r1.w, -r2.y, l(1.000000)
 201: mul r2.y, r1.w, r1.w
 202: mul r2.y, r2.y, r2.y
 203: mul r1.w, r1.w, r2.y
 204: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 205: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 206: mul r2.yzw, r2.yyzw, r5.xxyz
 207: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 208: mul r2.xyz, r4.xyzx, r2.xxxx
 209: add r3.xzw, -r0.xxyz, r0.wwww
 210: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 211: mad r0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 212: sample r1.xyzw, v1.xyxx, t3.xyzw, s4
 213: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
 214: mov o0.w, l(1.000000)
 215: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 32 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul r1.xyz, r1.wwww, r1.xyzx
  29: mov o5.xyz, r1.xyzx
  30: mul r1.w, r1.y, r1.y
  31: mad r1.w, r1.x, r1.x, -r1.w
  32: mul r2.xyzw, r1.yzzx, r1.xyzz
  33: dp4 r1.x, cb2[42].xyzw, r2.xyzw
  34: dp4 r1.y, cb2[43].xyzw, r2.xyzw
  35: dp4 r1.z, cb2[44].xyzw, r2.xyzw
  36: mad o6.xyz, cb2[45].xyzx, r1.wwww, r1.xyzx
  37: mov o6.w, l(0)
  38: mul r0.y, r0.y, cb1[5].x
  39: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  40: mov o7.zw, r0.zzzw
  41: add o7.xy, r1.zzzz, r1.xwxx
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 176 math, 15 temp registers, 7 textures, 8 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 15
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r3.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r4.w, r5.xyzx, r5.xyzx
  22: sqrt r4.w, r4.w
  23: add r4.w, -r3.w, r4.w
  24: mad r3.w, cb3[25].w, r4.w, r3.w
  25: mad_sat r3.w, r3.w, cb3[24].z, cb3[24].w
  26: eq r4.w, cb6[0].x, l(1.000000)
  27: if_nz r4.w
  28:   eq r5.x, cb6[0].y, l(1.000000)
  29:   mul r5.yzw, v4.wwww, cb6[2].xxyz
  30:   mad r5.yzw, cb6[1].xxyz, v3.wwww, r5.yyzw
  31:   mad r5.yzw, cb6[3].xxyz, v5.wwww, r5.yyzw
  32:   add r5.yzw, r5.yyzw, cb6[4].xxyz
  33:   movc r5.xyz, r5.xxxx, r5.yzwy, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r5.y, r5.y, l(0.250000), l(0.750000)
  37:   mad r6.x, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r5.y, r6.x
  39:   sample r5.xyzw, r5.xzwx, t5.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r5.x, r5.xyzw, cb2[46].xyzw
  44: div r5.yz, v7.xxyx, v7.wwww
  45: sample r6.xyzw, r5.yzyy, t1.xyzw, s4
  46: add r5.x, r5.x, -r6.x
  47: mad r3.w, r3.w, r5.x, r6.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r5.x, -cb0[9].y, l(1.000000)
  50: mad r5.x, r5.y, cb0[9].y, r5.x
  51: add r5.y, -cb0[8].w, l(1.000000)
  52: dp3 r5.z, r3.xyzx, r2.xyzx
  53: add r5.z, r5.z, r5.z
  54: mad r6.xyz, r2.xyzx, -r5.zzzz, r3.xyzx
  55: mul r7.xyz, r3.wwww, cb0[2].xyzx
  56: if_nz r4.w
  57:   eq r3.w, cb6[0].y, l(1.000000)
  58:   mul r8.xyz, v4.wwww, cb6[2].xyzx
  59:   mad r8.xyz, cb6[1].xyzx, v3.wwww, r8.xyzx
  60:   mad r8.xyz, cb6[3].xyzx, v5.wwww, r8.xyzx
  61:   add r8.xyz, r8.xyzx, cb6[4].xyzx
  62:   movc r8.xyz, r3.wwww, r8.xyzx, r4.xyzx
  63:   add r8.xyz, r8.xyzx, -cb6[6].xyzx
  64:   mul r8.yzw, r8.xxyz, cb6[5].xxyz
  65:   mul r3.w, r8.y, l(0.250000)
  66:   mul r4.w, cb6[0].z, l(0.500000)
  67:   mad r5.z, -cb6[0].z, l(0.500000), l(0.250000)
  68:   max r3.w, r3.w, r4.w
  69:   min r8.x, r5.z, r3.w
  70:   sample r9.xyzw, r8.xzwx, t5.xyzw, s1
  71:   add r10.xyz, r8.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  72:   sample r10.xyzw, r10.xyzx, t5.xyzw, s1
  73:   add r8.xyz, r8.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  74:   sample r8.xyzw, r8.xyzx, t5.xyzw, s1
  75:   mov r2.w, l(1.000000)
  76:   dp4 r9.x, r9.xyzw, r2.xyzw
  77:   dp4 r9.y, r10.xyzw, r2.xyzw
  78:   dp4 r9.z, r8.xyzw, r2.xyzw
  79: else 
  80:   mov r2.w, l(1.000000)
  81:   dp4 r9.x, cb2[39].xyzw, r2.xyzw
  82:   dp4 r9.y, cb2[40].xyzw, r2.xyzw
  83:   dp4 r9.z, cb2[41].xyzw, r2.xyzw
  84: endif 
  85: add r8.xyz, r9.xyzx, v6.xyzx
  86: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  87: log r8.xyz, r8.xyzx
  88: mul r8.xyz, r8.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  89: exp r8.xyz, r8.xyzx
  90: mad r8.xyz, r8.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  91: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  92: lt r2.w, l(0.000000), cb5[2].w
  93: if_nz r2.w
  94:   dp3 r2.w, r6.xyzx, r6.xyzx
  95:   rsq r2.w, r2.w
  96:   mul r9.xyz, r2.wwww, r6.xyzx
  97:   add r10.xyz, -r4.xyzx, cb5[0].xyzx
  98:   div r10.xyz, r10.xyzx, r9.xyzx
  99:   add r11.xyz, -r4.xyzx, cb5[1].xyzx
 100:   div r11.xyz, r11.xyzx, r9.xyzx
 101:   lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
 102:   movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
 103:   min r2.w, r10.y, r10.x
 104:   min r2.w, r10.z, r2.w
 105:   add r10.xyz, r4.xyzx, -cb5[2].xyzx
 106:   mad r9.xyz, r9.xyzx, r2.wwww, r10.xyzx
 107: else 
 108:   mov r9.xyz, r6.xyzx
 109: endif 
 110: mad r2.w, -r5.y, l(0.700000), l(1.700000)
 111: mul r2.w, r2.w, r5.y
 112: mul r2.w, r2.w, l(6.000000)
 113: sample_l r9.xyzw, r9.xyzx, t3.xyzw, s0, r2.w
 114: add r3.w, r9.w, l(-1.000000)
 115: mad r3.w, cb5[3].w, r3.w, l(1.000000)
 116: mul r3.w, r3.w, cb5[3].x
 117: mul r10.xyz, r9.xyzx, r3.wwww
 118: lt r4.w, cb5[1].w, l(0.999990)
 119: if_nz r4.w
 120:   lt r4.w, l(0.000000), cb5[6].w
 121:   if_nz r4.w
 122:     dp3 r4.w, r6.xyzx, r6.xyzx
 123:     rsq r4.w, r4.w
 124:     mul r11.xyz, r4.wwww, r6.xyzx
 125:     add r12.xyz, -r4.xyzx, cb5[4].xyzx
 126:     div r12.xyz, r12.xyzx, r11.xyzx
 127:     add r13.xyz, -r4.xyzx, cb5[5].xyzx
 128:     div r13.xyz, r13.xyzx, r11.xyzx
 129:     lt r14.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r11.xyzx
 130:     movc r12.xyz, r14.xyzx, r12.xyzx, r13.xyzx
 131:     min r4.w, r12.y, r12.x
 132:     min r4.w, r12.z, r4.w
 133:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
 134:     mad r6.xyz, r11.xyzx, r4.wwww, r4.xyzx
 135:   endif 
 136:   sample_l r4.xyzw, r6.xyzx, t4.xyzw, s0, r2.w
 137:   add r2.w, r4.w, l(-1.000000)
 138:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 139:   mul r2.w, r2.w, cb5[7].x
 140:   mul r4.xyz, r4.xyzx, r2.wwww
 141:   mad r6.xyz, r3.wwww, r9.xyzx, -r4.xyzx
 142:   mad r10.xyz, cb5[1].wwww, r6.xyzx, r4.xyzx
 143: endif 
 144: mul r4.xyz, r5.xxxx, r10.xyzx
 145: mad r6.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 146: dp3 r1.w, r6.xyzx, r6.xyzx
 147: max r1.w, r1.w, l(0.001000)
 148: rsq r1.w, r1.w
 149: mul r6.xyz, r1.wwww, r6.xyzx
 150: dp3 r1.w, r2.xyzx, -r3.xyzx
 151: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 152: dp3_sat r2.x, r2.xyzx, r6.xyzx
 153: dp3_sat r2.y, cb2[0].xyzx, r6.xyzx
 154: mul r2.z, r2.y, r2.y
 155: dp2 r2.z, r2.zzzz, r5.yyyy
 156: add r2.z, r2.z, l(-0.500000)
 157: add r3.x, -r2.w, l(1.000000)
 158: mul r3.y, r3.x, r3.x
 159: mul r3.y, r3.y, r3.y
 160: mul r3.x, r3.x, r3.y
 161: mad r3.x, r2.z, r3.x, l(1.000000)
 162: add r3.y, -|r1.w|, l(1.000000)
 163: mul r3.z, r3.y, r3.y
 164: mul r3.z, r3.z, r3.z
 165: mul r3.y, r3.y, r3.z
 166: mad r2.z, r2.z, r3.y, l(1.000000)
 167: mul r2.z, r2.z, r3.x
 168: mul r2.z, r2.w, r2.z
 169: mul r3.x, r5.y, r5.y
 170: max r3.x, r3.x, l(0.002000)
 171: add r3.z, -r3.x, l(1.000000)
 172: mad r3.w, |r1.w|, r3.z, r3.x
 173: mad r3.z, r2.w, r3.z, r3.x
 174: mul r1.w, |r1.w|, r3.z
 175: mad r1.w, r2.w, r3.w, r1.w
 176: add r1.w, r1.w, l(0.000010)
 177: div r1.w, l(0.500000), r1.w
 178: mul r3.z, r3.x, r3.x
 179: mad r3.w, r2.x, r3.z, -r2.x
 180: mad r2.x, r3.w, r2.x, l(1.000000)
 181: mul r3.z, r3.z, l(0.318310)
 182: mad r2.x, r2.x, r2.x, l(0.000000)
 183: div r2.x, r3.z, r2.x
 184: mul r1.w, r1.w, r2.x
 185: mul r1.w, r1.w, l(3.141593)
 186: max r1.w, r1.w, l(0.000100)
 187: sqrt r1.w, r1.w
 188: mul r1.w, r2.w, r1.w
 189: mul r2.x, r3.x, l(0.280000)
 190: mad r2.x, -r2.x, r5.y, l(1.000000)
 191: dp3 r2.w, r0.xyzx, r0.xyzx
 192: ne r2.w, r2.w, l(0.000000)
 193: and r2.w, r2.w, l(0x3f800000)
 194: mul r1.w, r1.w, r2.w
 195: add r0.w, -r0.w, l(1.000000)
 196: add_sat r0.w, r0.w, cb0[8].w
 197: mul r3.xzw, r2.zzzz, r7.xxyz
 198: mad r3.xzw, r8.xxyz, r5.xxxx, r3.xxzw
 199: mul r5.xyz, r7.xyzx, r1.wwww
 200: add r1.w, -r2.y, l(1.000000)
 201: mul r2.y, r1.w, r1.w
 202: mul r2.y, r2.y, r2.y
 203: mul r1.w, r1.w, r2.y
 204: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 205: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 206: mul r2.yzw, r2.yyzw, r5.xxyz
 207: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 208: mul r2.xyz, r4.xyzx, r2.xxxx
 209: add r3.xzw, -r0.xxyz, r0.wwww
 210: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 211: mad o0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 212: mov o0.w, l(1.000000)
 213: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION 
-- Vertex shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 138 math, 13 temp registers, 4 textures, 6 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[8], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_output o0.xyzw
      dcl_temps 13
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: eq r2.w, cb3[0].x, l(1.000000)
  13: if_nz r2.w
  14:   eq r2.w, cb3[0].y, l(1.000000)
  15:   mul r4.xyz, v4.wwww, cb3[2].xyzx
  16:   mad r4.xyz, cb3[1].xyzx, v3.wwww, r4.xyzx
  17:   mad r4.xyz, cb3[3].xyzx, v5.wwww, r4.xyzx
  18:   add r4.xyz, r4.xyzx, cb3[4].xyzx
  19:   mov r5.y, v3.w
  20:   mov r5.z, v4.w
  21:   mov r5.w, v5.w
  22:   movc r4.xyz, r2.wwww, r4.xyzx, r5.yzwy
  23:   add r4.xyz, r4.xyzx, -cb3[6].xyzx
  24:   mul r4.yzw, r4.xxyz, cb3[5].xxyz
  25:   mad r2.w, r4.y, l(0.250000), l(0.750000)
  26:   mad r3.w, cb3[0].z, l(0.500000), l(0.750000)
  27:   max r4.x, r2.w, r3.w
  28:   sample r4.xyzw, r4.xzwx, t5.xyzw, s1
  29: else 
  30:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  31: endif 
  32: dp4_sat r2.w, r4.xyzw, cb1[46].xyzw
  33: sample r4.xyzw, v1.xyxx, t1.xyzw, s3
  34: add r3.w, -cb0[9].y, l(1.000000)
  35: mad r3.w, r4.y, cb0[9].y, r3.w
  36: add r4.x, -cb0[8].w, l(1.000000)
  37: dp3 r4.y, r3.xyzx, r2.xyzx
  38: add r4.y, r4.y, r4.y
  39: mad r4.yzw, r2.xxyz, -r4.yyyy, r3.xxyz
  40: mul r5.xyz, r2.wwww, cb0[2].xyzx
  41: lt r2.w, l(0.000000), cb2[2].w
  42: if_nz r2.w
  43:   dp3 r2.w, r4.yzwy, r4.yzwy
  44:   rsq r2.w, r2.w
  45:   mul r6.xyz, r2.wwww, r4.yzwy
  46:   mov r7.x, v3.w
  47:   mov r7.y, v4.w
  48:   mov r7.z, v5.w
  49:   add r8.xyz, -r7.xyzx, cb2[0].xyzx
  50:   div r8.xyz, r8.xyzx, r6.xyzx
  51:   add r9.xyz, -r7.xyzx, cb2[1].xyzx
  52:   div r9.xyz, r9.xyzx, r6.xyzx
  53:   lt r10.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r6.xyzx
  54:   movc r8.xyz, r10.xyzx, r8.xyzx, r9.xyzx
  55:   min r2.w, r8.y, r8.x
  56:   min r2.w, r8.z, r2.w
  57:   add r7.xyz, r7.xyzx, -cb2[2].xyzx
  58:   mad r6.xyz, r6.xyzx, r2.wwww, r7.xyzx
  59: else 
  60:   mov r6.xyz, r4.yzwy
  61: endif 
  62: mad r2.w, -r4.x, l(0.700000), l(1.700000)
  63: mul r2.w, r2.w, r4.x
  64: mul r2.w, r2.w, l(6.000000)
  65: sample_l r6.xyzw, r6.xyzx, t3.xyzw, s0, r2.w
  66: add r5.w, r6.w, l(-1.000000)
  67: mad r5.w, cb2[3].w, r5.w, l(1.000000)
  68: mul r5.w, r5.w, cb2[3].x
  69: mul r7.xyz, r6.xyzx, r5.wwww
  70: lt r6.w, cb2[1].w, l(0.999990)
  71: if_nz r6.w
  72:   lt r6.w, l(0.000000), cb2[6].w
  73:   if_nz r6.w
  74:     dp3 r6.w, r4.yzwy, r4.yzwy
  75:     rsq r6.w, r6.w
  76:     mul r8.xyz, r4.yzwy, r6.wwww
  77:     mov r9.x, v3.w
  78:     mov r9.y, v4.w
  79:     mov r9.z, v5.w
  80:     add r10.xyz, -r9.xyzx, cb2[4].xyzx
  81:     div r10.xyz, r10.xyzx, r8.xyzx
  82:     add r11.xyz, -r9.xyzx, cb2[5].xyzx
  83:     div r11.xyz, r11.xyzx, r8.xyzx
  84:     lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r8.xyzx
  85:     movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  86:     min r6.w, r10.y, r10.x
  87:     min r6.w, r10.z, r6.w
  88:     add r9.xyz, r9.xyzx, -cb2[6].xyzx
  89:     mad r4.yzw, r8.xxyz, r6.wwww, r9.xxyz
  90:   endif 
  91:   sample_l r8.xyzw, r4.yzwy, t4.xyzw, s0, r2.w
  92:   add r2.w, r8.w, l(-1.000000)
  93:   mad r2.w, cb2[7].w, r2.w, l(1.000000)
  94:   mul r2.w, r2.w, cb2[7].x
  95:   mul r4.yzw, r8.xxyz, r2.wwww
  96:   mad r6.xyz, r5.wwww, r6.xyzx, -r4.yzwy
  97:   mad r7.xyz, cb2[1].wwww, r6.xyzx, r4.yzwy
  98: endif 
  99: mul r4.yzw, r3.wwww, r7.xxyz
 100: mad r6.xyz, -v2.xyzx, r1.wwww, cb1[0].xyzx
 101: dp3 r1.w, r6.xyzx, r6.xyzx
 102: max r1.w, r1.w, l(0.001000)
 103: rsq r1.w, r1.w
 104: mul r6.xyz, r1.wwww, r6.xyzx
 105: dp3 r1.w, r2.xyzx, -r3.xyzx
 106: dp3_sat r2.w, r2.xyzx, cb1[0].xyzx
 107: dp3_sat r2.x, r2.xyzx, r6.xyzx
 108: dp3_sat r2.y, cb1[0].xyzx, r6.xyzx
 109: mul r2.z, r2.y, r2.y
 110: dp2 r2.z, r2.zzzz, r4.xxxx
 111: add r2.z, r2.z, l(-0.500000)
 112: add r3.x, -r2.w, l(1.000000)
 113: mul r3.y, r3.x, r3.x
 114: mul r3.y, r3.y, r3.y
 115: mul r3.x, r3.x, r3.y
 116: mad r3.x, r2.z, r3.x, l(1.000000)
 117: add r3.y, -|r1.w|, l(1.000000)
 118: mul r3.z, r3.y, r3.y
 119: mul r3.z, r3.z, r3.z
 120: mul r3.y, r3.y, r3.z
 121: mad r2.z, r2.z, r3.y, l(1.000000)
 122: mul r2.z, r2.z, r3.x
 123: mul r2.z, r2.w, r2.z
 124: mul r3.x, r4.x, r4.x
 125: max r3.x, r3.x, l(0.002000)
 126: add r3.z, -r3.x, l(1.000000)
 127: mad r3.w, |r1.w|, r3.z, r3.x
 128: mad r3.z, r2.w, r3.z, r3.x
 129: mul r1.w, |r1.w|, r3.z
 130: mad r1.w, r2.w, r3.w, r1.w
 131: add r1.w, r1.w, l(0.000010)
 132: div r1.w, l(0.500000), r1.w
 133: mul r3.z, r3.x, r3.x
 134: mad r3.w, r2.x, r3.z, -r2.x
 135: mad r2.x, r3.w, r2.x, l(1.000000)
 136: mul r3.z, r3.z, l(0.318310)
 137: mad r2.x, r2.x, r2.x, l(0.000000)
 138: div r2.x, r3.z, r2.x
 139: mul r1.w, r1.w, r2.x
 140: mul r1.w, r1.w, l(3.141593)
 141: max r1.w, r1.w, l(0.000100)
 142: sqrt r1.w, r1.w
 143: mul r1.w, r2.w, r1.w
 144: mul r2.x, r3.x, l(0.280000)
 145: mad r2.x, -r2.x, r4.x, l(1.000000)
 146: dp3 r2.w, r0.xyzx, r0.xyzx
 147: ne r2.w, r2.w, l(0.000000)
 148: and r2.w, r2.w, l(0x3f800000)
 149: mul r1.w, r1.w, r2.w
 150: add r0.w, -r0.w, l(1.000000)
 151: add_sat r0.w, r0.w, cb0[8].w
 152: mul r3.xzw, r2.zzzz, r5.xxyz
 153: mul r5.xyz, r5.xyzx, r1.wwww
 154: add r1.w, -r2.y, l(1.000000)
 155: mul r2.y, r1.w, r1.w
 156: mul r2.y, r2.y, r2.y
 157: mul r1.w, r1.w, r2.y
 158: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 159: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 160: mul r2.yzw, r2.yyzw, r5.xxyz
 161: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 162: mul r2.xyz, r4.yzwy, r2.xxxx
 163: add r3.xzw, -r0.xxyz, r0.wwww
 164: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 165: mad r0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 166: sample r1.xyzw, v1.xyxx, t2.xyzw, s4
 167: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
 168: mov o0.w, l(1.000000)
 169: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  14: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  23: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  24: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  25: dp3 r0.w, r0.xyzx, r0.xyzx
  26: rsq r0.w, r0.w
  27: mul o5.xyz, r0.wwww, r0.xyzx
  28: mov o6.xyzw, l(0,0,0,0)
  29: mov o7.xyzw, l(0,0,0,0)
  30: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  14: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  23: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  24: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  25: dp3 r0.w, r0.xyzx, r0.xyzx
  26: rsq r0.w, r0.w
  27: mul o5.xyz, r0.wwww, r0.xyzx
  28: mov o6.xyzw, l(0,0,0,0)
  29: mov o7.xyzw, l(0,0,0,0)
  30: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 52 math, 5 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 5
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  23: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  24: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  25: dp3 r0.w, r1.xyzx, r1.xyzx
  26: rsq r0.w, r0.w
  27: mul r1.xyz, r0.wwww, r1.xyzx
  28: mov o5.xyz, r1.xyzx
  29: add r2.xyzw, -r0.xxxx, cb2[3].xyzw
  30: add r3.xyzw, -r0.yyyy, cb2[4].xyzw
  31: add r0.xyzw, -r0.zzzz, cb2[5].xyzw
  32: mul r4.xyzw, r1.yyyy, r3.xyzw
  33: mul r3.xyzw, r3.xyzw, r3.xyzw
  34: mad r3.xyzw, r2.xyzw, r2.xyzw, r3.xyzw
  35: mad r2.xyzw, r2.xyzw, r1.xxxx, r4.xyzw
  36: mad r2.xyzw, r0.xyzw, r1.zzzz, r2.xyzw
  37: mad r0.xyzw, r0.xyzw, r0.xyzw, r3.xyzw
  38: max r0.xyzw, r0.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  39: rsq r3.xyzw, r0.xyzw
  40: mad r0.xyzw, r0.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  41: div r0.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r0.xyzw
  42: mul r2.xyzw, r2.xyzw, r3.xyzw
  43: max r2.xyzw, r2.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  44: mul r0.xyzw, r0.xyzw, r2.xyzw
  45: mul r2.xyz, r0.yyyy, cb2[8].xyzx
  46: mad r2.xyz, cb2[7].xyzx, r0.xxxx, r2.xyzx
  47: mad r0.xyz, cb2[9].xyzx, r0.zzzz, r2.xyzx
  48: mad r0.xyz, cb2[10].xyzx, r0.wwww, r0.xyzx
  49: mad r2.xyz, r0.xyzx, l(0.305306, 0.305306, 0.305306, 0.000000), l(0.682171, 0.682171, 0.682171, 0.000000)
  50: mad r2.xyz, r0.xyzx, r2.xyzx, l(0.012523, 0.012523, 0.012523, 0.000000)
  51: mul r0.w, r1.y, r1.y
  52: mad r0.w, r1.x, r1.x, -r0.w
  53: mul r1.xyzw, r1.yzzx, r1.xyzz
  54: dp4 r3.x, cb2[42].xyzw, r1.xyzw
  55: dp4 r3.y, cb2[43].xyzw, r1.xyzw
  56: dp4 r3.z, cb2[44].xyzw, r1.xyzw
  57: mad r1.xyz, cb2[45].xyzx, r0.wwww, r3.xyzx
  58: mad o6.xyz, r0.xyzx, r2.xyzx, r1.xyzx
  59: mov o6.w, l(0)
  60: mov o7.xyzw, l(0,0,0,0)
  61: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 52 math, 5 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 5
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  23: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  24: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  25: dp3 r0.w, r1.xyzx, r1.xyzx
  26: rsq r0.w, r0.w
  27: mul r1.xyz, r0.wwww, r1.xyzx
  28: mov o5.xyz, r1.xyzx
  29: add r2.xyzw, -r0.xxxx, cb2[3].xyzw
  30: add r3.xyzw, -r0.yyyy, cb2[4].xyzw
  31: add r0.xyzw, -r0.zzzz, cb2[5].xyzw
  32: mul r4.xyzw, r1.yyyy, r3.xyzw
  33: mul r3.xyzw, r3.xyzw, r3.xyzw
  34: mad r3.xyzw, r2.xyzw, r2.xyzw, r3.xyzw
  35: mad r2.xyzw, r2.xyzw, r1.xxxx, r4.xyzw
  36: mad r2.xyzw, r0.xyzw, r1.zzzz, r2.xyzw
  37: mad r0.xyzw, r0.xyzw, r0.xyzw, r3.xyzw
  38: max r0.xyzw, r0.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  39: rsq r3.xyzw, r0.xyzw
  40: mad r0.xyzw, r0.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  41: div r0.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r0.xyzw
  42: mul r2.xyzw, r2.xyzw, r3.xyzw
  43: max r2.xyzw, r2.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  44: mul r0.xyzw, r0.xyzw, r2.xyzw
  45: mul r2.xyz, r0.yyyy, cb2[8].xyzx
  46: mad r2.xyz, cb2[7].xyzx, r0.xxxx, r2.xyzx
  47: mad r0.xyz, cb2[9].xyzx, r0.zzzz, r2.xyzx
  48: mad r0.xyz, cb2[10].xyzx, r0.wwww, r0.xyzx
  49: mad r2.xyz, r0.xyzx, l(0.305306, 0.305306, 0.305306, 0.000000), l(0.682171, 0.682171, 0.682171, 0.000000)
  50: mad r2.xyz, r0.xyzx, r2.xyzx, l(0.012523, 0.012523, 0.012523, 0.000000)
  51: mul r0.w, r1.y, r1.y
  52: mad r0.w, r1.x, r1.x, -r0.w
  53: mul r1.xyzw, r1.yzzx, r1.xyzz
  54: dp4 r3.x, cb2[42].xyzw, r1.xyzw
  55: dp4 r3.y, cb2[43].xyzw, r1.xyzw
  56: dp4 r3.z, cb2[44].xyzw, r1.xyzw
  57: mad r1.xyz, cb2[45].xyzx, r0.wwww, r3.xyzx
  58: mad o6.xyz, r0.xyzx, r2.xyzx, r1.xyzx
  59: mov o6.w, l(0)
  60: mov o7.xyzw, l(0,0,0,0)
  61: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 55 math, 6 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 6
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r2.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r2.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r2.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r2.xyzx, r2.xyzx
  27: rsq r1.w, r1.w
  28: mul r2.xyz, r1.wwww, r2.xyzx
  29: mov o5.xyz, r2.xyzx
  30: add r3.xyzw, -r1.xxxx, cb2[3].xyzw
  31: add r4.xyzw, -r1.yyyy, cb2[4].xyzw
  32: add r1.xyzw, -r1.zzzz, cb2[5].xyzw
  33: mul r5.xyzw, r2.yyyy, r4.xyzw
  34: mul r4.xyzw, r4.xyzw, r4.xyzw
  35: mad r4.xyzw, r3.xyzw, r3.xyzw, r4.xyzw
  36: mad r3.xyzw, r3.xyzw, r2.xxxx, r5.xyzw
  37: mad r3.xyzw, r1.xyzw, r2.zzzz, r3.xyzw
  38: mad r1.xyzw, r1.xyzw, r1.xyzw, r4.xyzw
  39: max r1.xyzw, r1.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  40: rsq r4.xyzw, r1.xyzw
  41: mad r1.xyzw, r1.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  42: div r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyzw
  43: mul r3.xyzw, r3.xyzw, r4.xyzw
  44: max r3.xyzw, r3.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: mul r1.xyzw, r1.xyzw, r3.xyzw
  46: mul r3.xyz, r1.yyyy, cb2[8].xyzx
  47: mad r3.xyz, cb2[7].xyzx, r1.xxxx, r3.xyzx
  48: mad r1.xyz, cb2[9].xyzx, r1.zzzz, r3.xyzx
  49: mad r1.xyz, cb2[10].xyzx, r1.wwww, r1.xyzx
  50: mad r3.xyz, r1.xyzx, l(0.305306, 0.305306, 0.305306, 0.000000), l(0.682171, 0.682171, 0.682171, 0.000000)
  51: mad r3.xyz, r1.xyzx, r3.xyzx, l(0.012523, 0.012523, 0.012523, 0.000000)
  52: mul r1.w, r2.y, r2.y
  53: mad r1.w, r2.x, r2.x, -r1.w
  54: mul r2.xyzw, r2.yzzx, r2.xyzz
  55: dp4 r4.x, cb2[42].xyzw, r2.xyzw
  56: dp4 r4.y, cb2[43].xyzw, r2.xyzw
  57: dp4 r4.z, cb2[44].xyzw, r2.xyzw
  58: mad r2.xyz, cb2[45].xyzx, r1.wwww, r4.xyzx
  59: mad o6.xyz, r1.xyzx, r3.xyzx, r2.xyzx
  60: mov o6.w, l(0)
  61: mul r0.y, r0.y, cb1[5].x
  62: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  63: mov o7.zw, r0.zzzw
  64: add o7.xy, r1.zzzz, r1.xwxx
  65: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 55 math, 6 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 6
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r2.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r2.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r2.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r2.xyzx, r2.xyzx
  27: rsq r1.w, r1.w
  28: mul r2.xyz, r1.wwww, r2.xyzx
  29: mov o5.xyz, r2.xyzx
  30: add r3.xyzw, -r1.xxxx, cb2[3].xyzw
  31: add r4.xyzw, -r1.yyyy, cb2[4].xyzw
  32: add r1.xyzw, -r1.zzzz, cb2[5].xyzw
  33: mul r5.xyzw, r2.yyyy, r4.xyzw
  34: mul r4.xyzw, r4.xyzw, r4.xyzw
  35: mad r4.xyzw, r3.xyzw, r3.xyzw, r4.xyzw
  36: mad r3.xyzw, r3.xyzw, r2.xxxx, r5.xyzw
  37: mad r3.xyzw, r1.xyzw, r2.zzzz, r3.xyzw
  38: mad r1.xyzw, r1.xyzw, r1.xyzw, r4.xyzw
  39: max r1.xyzw, r1.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  40: rsq r4.xyzw, r1.xyzw
  41: mad r1.xyzw, r1.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  42: div r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyzw
  43: mul r3.xyzw, r3.xyzw, r4.xyzw
  44: max r3.xyzw, r3.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: mul r1.xyzw, r1.xyzw, r3.xyzw
  46: mul r3.xyz, r1.yyyy, cb2[8].xyzx
  47: mad r3.xyz, cb2[7].xyzx, r1.xxxx, r3.xyzx
  48: mad r1.xyz, cb2[9].xyzx, r1.zzzz, r3.xyzx
  49: mad r1.xyz, cb2[10].xyzx, r1.wwww, r1.xyzx
  50: mad r3.xyz, r1.xyzx, l(0.305306, 0.305306, 0.305306, 0.000000), l(0.682171, 0.682171, 0.682171, 0.000000)
  51: mad r3.xyz, r1.xyzx, r3.xyzx, l(0.012523, 0.012523, 0.012523, 0.000000)
  52: mul r1.w, r2.y, r2.y
  53: mad r1.w, r2.x, r2.x, -r1.w
  54: mul r2.xyzw, r2.yzzx, r2.xyzz
  55: dp4 r4.x, cb2[42].xyzw, r2.xyzw
  56: dp4 r4.y, cb2[43].xyzw, r2.xyzw
  57: dp4 r4.z, cb2[44].xyzw, r2.xyzw
  58: mad r2.xyz, cb2[45].xyzx, r1.wwww, r4.xyzx
  59: mad o6.xyz, r1.xyzx, r3.xyzx, r2.xyzx
  60: mov o6.w, l(0)
  61: mul r0.y, r0.y, cb1[5].x
  62: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  63: mov o7.zw, r0.zzzw
  64: add o7.xy, r1.zzzz, r1.xwxx
  65: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  14: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  17: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  18: mov r0.w, l(0)
  19: mov o3.xyzw, r0.wwwx
  20: mov o4.xyzw, r0.wwwy
  21: mov o5.w, r0.z
  22: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  23: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  24: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  25: dp3 r0.w, r0.xyzx, r0.xyzx
  26: rsq r0.w, r0.w
  27: mul o5.xyz, r0.wwww, r0.xyzx
  28: mov o6.xyzw, l(0,0,0,0)
  29: mov o7.xyzw, l(0,0,0,0)
  30: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

 }


 // Stats for Vertex shader:
 //        d3d11: 27 avg math (23..32)
 // Stats for Fragment shader:
 //        d3d11: 105 avg math (83..144), 3 avg texture (2..4), 2 avg branch (2..4)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: POINT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  32: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  33: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  34: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 92 math, 7 temp registers, 3 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyz, v6.yyyy, cb0[12].xyzx
  13: mad r4.xyz, cb0[11].xyzx, v6.xxxx, r4.xyzx
  14: mad r4.xyz, cb0[13].xyzx, v6.zzzz, r4.xyzx
  15: add r4.xyz, r4.xyzx, cb0[14].xyzx
  16: eq r0.w, cb2[0].x, l(1.000000)
  17: if_nz r0.w
  18:   eq r0.w, cb2[0].y, l(1.000000)
  19:   mul r5.xyz, v6.yyyy, cb2[2].xyzx
  20:   mad r5.xyz, cb2[1].xyzx, v6.xxxx, r5.xyzx
  21:   mad r5.xyz, cb2[3].xyzx, v6.zzzz, r5.xyzx
  22:   add r5.xyz, r5.xyzx, cb2[4].xyzx
  23:   movc r5.xyz, r0.wwww, r5.xyzx, v6.xyzx
  24:   add r5.xyz, r5.xyzx, -cb2[6].xyzx
  25:   mul r5.yzw, r5.xxyz, cb2[5].xxyz
  26:   mad r0.w, r5.y, l(0.250000), l(0.750000)
  27:   mad r1.w, cb2[0].z, l(0.500000), l(0.750000)
  28:   max r5.x, r0.w, r1.w
  29:   sample r5.xyzw, r5.xzwx, t2.xyzw, s0
  30: else 
  31:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  32: endif 
  33: dp4_sat r0.w, r5.xyzw, cb1[46].xyzw
  34: dp3 r1.w, r4.xyzx, r4.xyzx
  35: sample r4.xyzw, r1.wwww, t1.xyzw, s2
  36: mul r0.w, r0.w, r4.x
  37: mov r4.x, v3.w
  38: mov r4.y, v4.w
  39: mov r4.z, v5.w
  40: dp3 r1.w, r4.xyzx, r4.xyzx
  41: rsq r1.w, r1.w
  42: mul r5.xyz, r1.wwww, r4.xyzx
  43: mul r6.xyz, r0.wwww, cb0[2].xyzx
  44: add r0.w, -cb0[8].w, l(1.000000)
  45: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  46: dp3 r1.w, r4.xyzx, r4.xyzx
  47: max r1.w, r1.w, l(0.001000)
  48: rsq r1.w, r1.w
  49: mul r4.xyz, r1.wwww, r4.xyzx
  50: dp3 r1.w, r2.xyzx, -r3.xyzx
  51: dp3_sat r2.w, r2.xyzx, r5.xyzx
  52: dp3_sat r2.x, r2.xyzx, r4.xyzx
  53: dp3_sat r2.y, r5.xyzx, r4.xyzx
  54: mul r2.z, r2.y, r2.y
  55: dp2 r2.z, r2.zzzz, r0.wwww
  56: add r2.z, r2.z, l(-0.500000)
  57: add r3.x, -r2.w, l(1.000000)
  58: mul r3.y, r3.x, r3.x
  59: mul r3.y, r3.y, r3.y
  60: mul r3.x, r3.x, r3.y
  61: mad r3.x, r2.z, r3.x, l(1.000000)
  62: add r3.y, -|r1.w|, l(1.000000)
  63: mul r3.z, r3.y, r3.y
  64: mul r3.z, r3.z, r3.z
  65: mul r3.y, r3.y, r3.z
  66: mad r2.z, r2.z, r3.y, l(1.000000)
  67: mul r2.z, r2.z, r3.x
  68: mul r2.z, r2.w, r2.z
  69: mul r0.w, r0.w, r0.w
  70: max r0.w, r0.w, l(0.002000)
  71: add r3.x, -r0.w, l(1.000000)
  72: mad r3.y, |r1.w|, r3.x, r0.w
  73: mad r3.x, r2.w, r3.x, r0.w
  74: mul r1.w, |r1.w|, r3.x
  75: mad r1.w, r2.w, r3.y, r1.w
  76: add r1.w, r1.w, l(0.000010)
  77: div r1.w, l(0.500000), r1.w
  78: mul r0.w, r0.w, r0.w
  79: mad r3.x, r2.x, r0.w, -r2.x
  80: mad r2.x, r3.x, r2.x, l(1.000000)
  81: mul r0.w, r0.w, l(0.318310)
  82: mad r2.x, r2.x, r2.x, l(0.000000)
  83: div r0.w, r0.w, r2.x
  84: mul r0.w, r0.w, r1.w
  85: mul r0.w, r0.w, l(3.141593)
  86: max r0.w, r0.w, l(0.000100)
  87: sqrt r0.w, r0.w
  88: mul r0.w, r2.w, r0.w
  89: dp3 r1.w, r0.xyzx, r0.xyzx
  90: ne r1.w, r1.w, l(0.000000)
  91: and r1.w, r1.w, l(0x3f800000)
  92: mul r0.w, r0.w, r1.w
  93: mul r2.xzw, r2.zzzz, r6.xxyz
  94: mul r3.xyz, r6.xyzx, r0.wwww
  95: add r0.w, -r2.y, l(1.000000)
  96: mul r1.w, r0.w, r0.w
  97: mul r1.w, r1.w, r1.w
  98: mul r0.w, r0.w, r1.w
  99: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 100: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 101: mul r0.xyz, r0.xyzx, r3.xyzx
 102: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 103: mov o0.w, l(1.000000)
 104: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 23 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov o2.w, l(0)
  18: mad r1.xyz, -r0.xyzx, cb2[0].wwww, cb2[0].xyzx
  19: mov o6.xyz, r0.xyzx
  20: mov r1.w, l(0)
  21: mov o3.xyzw, r1.wwwx
  22: mov o4.xyzw, r1.wwwy
  23: mov o5.w, r1.z
  24: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  25: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  26: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  27: dp3 r0.w, r0.xyzx, r0.xyzx
  28: rsq r0.w, r0.w
  29: mul o5.xyz, r0.wwww, r0.xyzx
  30: mov o7.xyzw, l(0,0,0,0)
  31: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 83 math, 7 temp registers, 2 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 1 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[9], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture3d (float,float,float,float) t1
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: eq r1.w, cb2[0].x, l(1.000000)
  13: if_nz r1.w
  14:   eq r1.w, cb2[0].y, l(1.000000)
  15:   mul r4.xyz, v6.yyyy, cb2[2].xyzx
  16:   mad r4.xyz, cb2[1].xyzx, v6.xxxx, r4.xyzx
  17:   mad r4.xyz, cb2[3].xyzx, v6.zzzz, r4.xyzx
  18:   add r4.xyz, r4.xyzx, cb2[4].xyzx
  19:   movc r4.xyz, r1.wwww, r4.xyzx, v6.xyzx
  20:   add r4.xyz, r4.xyzx, -cb2[6].xyzx
  21:   mul r4.yzw, r4.xxyz, cb2[5].xxyz
  22:   mad r1.w, r4.y, l(0.250000), l(0.750000)
  23:   mad r2.w, cb2[0].z, l(0.500000), l(0.750000)
  24:   max r4.x, r1.w, r2.w
  25:   sample r4.xyzw, r4.xzwx, t1.xyzw, s0
  26: else 
  27:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  28: endif 
  29: dp4_sat r1.w, r4.xyzw, cb1[46].xyzw
  30: mul r4.xyz, r1.wwww, cb0[2].xyzx
  31: add r1.w, -cb0[8].w, l(1.000000)
  32: mov r5.x, v3.w
  33: mov r5.y, v4.w
  34: mov r5.z, v5.w
  35: mad r6.xyz, -v2.xyzx, r0.wwww, r5.xyzx
  36: dp3 r0.w, r6.xyzx, r6.xyzx
  37: max r0.w, r0.w, l(0.001000)
  38: rsq r0.w, r0.w
  39: mul r6.xyz, r0.wwww, r6.xyzx
  40: dp3 r0.w, r2.xyzx, -r3.xyzx
  41: dp3_sat r2.w, r2.xyzx, r5.xyzx
  42: dp3_sat r2.x, r2.xyzx, r6.xyzx
  43: dp3_sat r2.y, r5.xyzx, r6.xyzx
  44: mul r2.z, r2.y, r2.y
  45: dp2 r2.z, r2.zzzz, r1.wwww
  46: add r2.z, r2.z, l(-0.500000)
  47: add r3.x, -r2.w, l(1.000000)
  48: mul r3.y, r3.x, r3.x
  49: mul r3.y, r3.y, r3.y
  50: mul r3.x, r3.x, r3.y
  51: mad r3.x, r2.z, r3.x, l(1.000000)
  52: add r3.y, -|r0.w|, l(1.000000)
  53: mul r3.z, r3.y, r3.y
  54: mul r3.z, r3.z, r3.z
  55: mul r3.y, r3.y, r3.z
  56: mad r2.z, r2.z, r3.y, l(1.000000)
  57: mul r2.z, r2.z, r3.x
  58: mul r2.z, r2.w, r2.z
  59: mul r1.w, r1.w, r1.w
  60: max r1.w, r1.w, l(0.002000)
  61: add r3.x, -r1.w, l(1.000000)
  62: mad r3.y, |r0.w|, r3.x, r1.w
  63: mad r3.x, r2.w, r3.x, r1.w
  64: mul r0.w, |r0.w|, r3.x
  65: mad r0.w, r2.w, r3.y, r0.w
  66: add r0.w, r0.w, l(0.000010)
  67: div r0.w, l(0.500000), r0.w
  68: mul r1.w, r1.w, r1.w
  69: mad r3.x, r2.x, r1.w, -r2.x
  70: mad r2.x, r3.x, r2.x, l(1.000000)
  71: mul r1.w, r1.w, l(0.318310)
  72: mad r2.x, r2.x, r2.x, l(0.000000)
  73: div r1.w, r1.w, r2.x
  74: mul r0.w, r0.w, r1.w
  75: mul r0.w, r0.w, l(3.141593)
  76: max r0.w, r0.w, l(0.000100)
  77: sqrt r0.w, r0.w
  78: mul r0.w, r2.w, r0.w
  79: dp3 r1.w, r0.xyzx, r0.xyzx
  80: ne r1.w, r1.w, l(0.000000)
  81: and r1.w, r1.w, l(0x3f800000)
  82: mul r0.w, r0.w, r1.w
  83: mul r2.xzw, r2.zzzz, r4.xxyz
  84: mul r3.xyz, r4.xyzx, r0.wwww
  85: add r0.w, -r2.y, l(1.000000)
  86: mul r1.w, r0.w, r0.w
  87: mul r1.w, r1.w, r1.w
  88: mul r0.w, r0.w, r1.w
  89: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  90: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
  91: mul r0.xyz, r0.xyzx, r3.xyzx
  92: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
  93: mov o0.w, l(1.000000)
  94: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: SPOT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float   xyzw
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyzw, r0.yyyy, cb0[12].xyzw
  32: mad r1.xyzw, cb0[11].xyzw, r0.xxxx, r1.xyzw
  33: mad r1.xyzw, cb0[13].xyzw, r0.zzzz, r1.xyzw
  34: mad o7.xyzw, cb0[14].xyzw, r0.wwww, r1.xyzw
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 98 math, 7 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyzw, v6.yyyy, cb0[12].xyzw
  13: mad r4.xyzw, cb0[11].xyzw, v6.xxxx, r4.xyzw
  14: mad r4.xyzw, cb0[13].xyzw, v6.zzzz, r4.xyzw
  15: add r4.xyzw, r4.xyzw, cb0[14].xyzw
  16: eq r0.w, cb2[0].x, l(1.000000)
  17: if_nz r0.w
  18:   eq r0.w, cb2[0].y, l(1.000000)
  19:   mul r5.xyz, v6.yyyy, cb2[2].xyzx
  20:   mad r5.xyz, cb2[1].xyzx, v6.xxxx, r5.xyzx
  21:   mad r5.xyz, cb2[3].xyzx, v6.zzzz, r5.xyzx
  22:   add r5.xyz, r5.xyzx, cb2[4].xyzx
  23:   movc r5.xyz, r0.wwww, r5.xyzx, v6.xyzx
  24:   add r5.xyz, r5.xyzx, -cb2[6].xyzx
  25:   mul r5.yzw, r5.xxyz, cb2[5].xxyz
  26:   mad r0.w, r5.y, l(0.250000), l(0.750000)
  27:   mad r1.w, cb2[0].z, l(0.500000), l(0.750000)
  28:   max r5.x, r0.w, r1.w
  29:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  30: else 
  31:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  32: endif 
  33: dp4_sat r0.w, r5.xyzw, cb1[46].xyzw
  34: lt r1.w, l(0.000000), r4.z
  35: and r1.w, r1.w, l(0x3f800000)
  36: div r5.xy, r4.xyxx, r4.wwww
  37: add r5.xy, r5.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  38: sample r5.xyzw, r5.xyxx, t1.xyzw, s2
  39: mul r1.w, r1.w, r5.w
  40: dp3 r2.w, r4.xyzx, r4.xyzx
  41: sample r4.xyzw, r2.wwww, t2.xyzw, s3
  42: mul r1.w, r1.w, r4.x
  43: mul r0.w, r0.w, r1.w
  44: mov r4.x, v3.w
  45: mov r4.y, v4.w
  46: mov r4.z, v5.w
  47: dp3 r1.w, r4.xyzx, r4.xyzx
  48: rsq r1.w, r1.w
  49: mul r5.xyz, r1.wwww, r4.xyzx
  50: mul r6.xyz, r0.wwww, cb0[2].xyzx
  51: add r0.w, -cb0[8].w, l(1.000000)
  52: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  53: dp3 r1.w, r4.xyzx, r4.xyzx
  54: max r1.w, r1.w, l(0.001000)
  55: rsq r1.w, r1.w
  56: mul r4.xyz, r1.wwww, r4.xyzx
  57: dp3 r1.w, r2.xyzx, -r3.xyzx
  58: dp3_sat r2.w, r2.xyzx, r5.xyzx
  59: dp3_sat r2.x, r2.xyzx, r4.xyzx
  60: dp3_sat r2.y, r5.xyzx, r4.xyzx
  61: mul r2.z, r2.y, r2.y
  62: dp2 r2.z, r2.zzzz, r0.wwww
  63: add r2.z, r2.z, l(-0.500000)
  64: add r3.x, -r2.w, l(1.000000)
  65: mul r3.y, r3.x, r3.x
  66: mul r3.y, r3.y, r3.y
  67: mul r3.x, r3.x, r3.y
  68: mad r3.x, r2.z, r3.x, l(1.000000)
  69: add r3.y, -|r1.w|, l(1.000000)
  70: mul r3.z, r3.y, r3.y
  71: mul r3.z, r3.z, r3.z
  72: mul r3.y, r3.y, r3.z
  73: mad r2.z, r2.z, r3.y, l(1.000000)
  74: mul r2.z, r2.z, r3.x
  75: mul r2.z, r2.w, r2.z
  76: mul r0.w, r0.w, r0.w
  77: max r0.w, r0.w, l(0.002000)
  78: add r3.x, -r0.w, l(1.000000)
  79: mad r3.y, |r1.w|, r3.x, r0.w
  80: mad r3.x, r2.w, r3.x, r0.w
  81: mul r1.w, |r1.w|, r3.x
  82: mad r1.w, r2.w, r3.y, r1.w
  83: add r1.w, r1.w, l(0.000010)
  84: div r1.w, l(0.500000), r1.w
  85: mul r0.w, r0.w, r0.w
  86: mad r3.x, r2.x, r0.w, -r2.x
  87: mad r2.x, r3.x, r2.x, l(1.000000)
  88: mul r0.w, r0.w, l(0.318310)
  89: mad r2.x, r2.x, r2.x, l(0.000000)
  90: div r0.w, r0.w, r2.x
  91: mul r0.w, r0.w, r1.w
  92: mul r0.w, r0.w, l(3.141593)
  93: max r0.w, r0.w, l(0.000100)
  94: sqrt r0.w, r0.w
  95: mul r0.w, r2.w, r0.w
  96: dp3 r1.w, r0.xyzx, r0.xyzx
  97: ne r1.w, r1.w, l(0.000000)
  98: and r1.w, r1.w, l(0x3f800000)
  99: mul r0.w, r0.w, r1.w
 100: mul r2.xzw, r2.zzzz, r6.xxyz
 101: mul r3.xyz, r6.xyzx, r0.wwww
 102: add r0.w, -r2.y, l(1.000000)
 103: mul r1.w, r0.w, r0.w
 104: mul r1.w, r1.w, r1.w
 105: mul r0.w, r0.w, r1.w
 106: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 107: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 108: mul r0.xyz, r0.xyzx, r3.xyzx
 109: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 110: mov o0.w, l(1.000000)
 111: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  32: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  33: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  34: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 93 math, 7 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 3
Set CUBE Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texturecube (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyz, v6.yyyy, cb0[12].xyzx
  13: mad r4.xyz, cb0[11].xyzx, v6.xxxx, r4.xyzx
  14: mad r4.xyz, cb0[13].xyzx, v6.zzzz, r4.xyzx
  15: add r4.xyz, r4.xyzx, cb0[14].xyzx
  16: eq r0.w, cb2[0].x, l(1.000000)
  17: if_nz r0.w
  18:   eq r0.w, cb2[0].y, l(1.000000)
  19:   mul r5.xyz, v6.yyyy, cb2[2].xyzx
  20:   mad r5.xyz, cb2[1].xyzx, v6.xxxx, r5.xyzx
  21:   mad r5.xyz, cb2[3].xyzx, v6.zzzz, r5.xyzx
  22:   add r5.xyz, r5.xyzx, cb2[4].xyzx
  23:   movc r5.xyz, r0.wwww, r5.xyzx, v6.xyzx
  24:   add r5.xyz, r5.xyzx, -cb2[6].xyzx
  25:   mul r5.yzw, r5.xxyz, cb2[5].xxyz
  26:   mad r0.w, r5.y, l(0.250000), l(0.750000)
  27:   mad r1.w, cb2[0].z, l(0.500000), l(0.750000)
  28:   max r5.x, r0.w, r1.w
  29:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  30: else 
  31:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  32: endif 
  33: dp4_sat r0.w, r5.xyzw, cb1[46].xyzw
  34: dp3 r1.w, r4.xyzx, r4.xyzx
  35: sample r5.xyzw, r1.wwww, t1.xyzw, s3
  36: sample r4.xyzw, r4.xyzx, t2.xyzw, s2
  37: mul r1.w, r4.w, r5.x
  38: mul r0.w, r0.w, r1.w
  39: mov r4.x, v3.w
  40: mov r4.y, v4.w
  41: mov r4.z, v5.w
  42: dp3 r1.w, r4.xyzx, r4.xyzx
  43: rsq r1.w, r1.w
  44: mul r5.xyz, r1.wwww, r4.xyzx
  45: mul r6.xyz, r0.wwww, cb0[2].xyzx
  46: add r0.w, -cb0[8].w, l(1.000000)
  47: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  48: dp3 r1.w, r4.xyzx, r4.xyzx
  49: max r1.w, r1.w, l(0.001000)
  50: rsq r1.w, r1.w
  51: mul r4.xyz, r1.wwww, r4.xyzx
  52: dp3 r1.w, r2.xyzx, -r3.xyzx
  53: dp3_sat r2.w, r2.xyzx, r5.xyzx
  54: dp3_sat r2.x, r2.xyzx, r4.xyzx
  55: dp3_sat r2.y, r5.xyzx, r4.xyzx
  56: mul r2.z, r2.y, r2.y
  57: dp2 r2.z, r2.zzzz, r0.wwww
  58: add r2.z, r2.z, l(-0.500000)
  59: add r3.x, -r2.w, l(1.000000)
  60: mul r3.y, r3.x, r3.x
  61: mul r3.y, r3.y, r3.y
  62: mul r3.x, r3.x, r3.y
  63: mad r3.x, r2.z, r3.x, l(1.000000)
  64: add r3.y, -|r1.w|, l(1.000000)
  65: mul r3.z, r3.y, r3.y
  66: mul r3.z, r3.z, r3.z
  67: mul r3.y, r3.y, r3.z
  68: mad r2.z, r2.z, r3.y, l(1.000000)
  69: mul r2.z, r2.z, r3.x
  70: mul r2.z, r2.w, r2.z
  71: mul r0.w, r0.w, r0.w
  72: max r0.w, r0.w, l(0.002000)
  73: add r3.x, -r0.w, l(1.000000)
  74: mad r3.y, |r1.w|, r3.x, r0.w
  75: mad r3.x, r2.w, r3.x, r0.w
  76: mul r1.w, |r1.w|, r3.x
  77: mad r1.w, r2.w, r3.y, r1.w
  78: add r1.w, r1.w, l(0.000010)
  79: div r1.w, l(0.500000), r1.w
  80: mul r0.w, r0.w, r0.w
  81: mad r3.x, r2.x, r0.w, -r2.x
  82: mad r2.x, r3.x, r2.x, l(1.000000)
  83: mul r0.w, r0.w, l(0.318310)
  84: mad r2.x, r2.x, r2.x, l(0.000000)
  85: div r0.w, r0.w, r2.x
  86: mul r0.w, r0.w, r1.w
  87: mul r0.w, r0.w, l(3.141593)
  88: max r0.w, r0.w, l(0.000100)
  89: sqrt r0.w, r0.w
  90: mul r0.w, r2.w, r0.w
  91: dp3 r1.w, r0.xyzx, r0.xyzx
  92: ne r1.w, r1.w, l(0.000000)
  93: and r1.w, r1.w, l(0x3f800000)
  94: mul r0.w, r0.w, r1.w
  95: mul r2.xzw, r2.zzzz, r6.xxyz
  96: mul r3.xyz, r6.xyzx, r0.wwww
  97: add r0.w, -r2.y, l(1.000000)
  98: mul r1.w, r0.w, r0.w
  99: mul r1.w, r1.w, r1.w
 100: mul r0.w, r0.w, r1.w
 101: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 102: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 103: mul r0.xyz, r0.xyzx, r3.xyzx
 104: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 105: mov o0.w, l(1.000000)
 106: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float   xy  
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xy
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xy, r0.yyyy, cb0[12].xyxx
  32: mad r0.xy, cb0[11].xyxx, r0.xxxx, r1.xyxx
  33: mad r0.xy, cb0[13].xyxx, r0.zzzz, r0.xyxx
  34: mad o7.xy, cb0[14].xyxx, r0.wwww, r0.xyxx
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 88 math, 7 temp registers, 3 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xy, v6.yyyy, cb0[12].xyxx
  13: mad r4.xy, cb0[11].xyxx, v6.xxxx, r4.xyxx
  14: mad r4.xy, cb0[13].xyxx, v6.zzzz, r4.xyxx
  15: add r4.xy, r4.xyxx, cb0[14].xyxx
  16: eq r1.w, cb2[0].x, l(1.000000)
  17: if_nz r1.w
  18:   eq r1.w, cb2[0].y, l(1.000000)
  19:   mul r5.xyz, v6.yyyy, cb2[2].xyzx
  20:   mad r5.xyz, cb2[1].xyzx, v6.xxxx, r5.xyzx
  21:   mad r5.xyz, cb2[3].xyzx, v6.zzzz, r5.xyzx
  22:   add r5.xyz, r5.xyzx, cb2[4].xyzx
  23:   movc r5.xyz, r1.wwww, r5.xyzx, v6.xyzx
  24:   add r5.xyz, r5.xyzx, -cb2[6].xyzx
  25:   mul r5.yzw, r5.xxyz, cb2[5].xxyz
  26:   mad r1.w, r5.y, l(0.250000), l(0.750000)
  27:   mad r2.w, cb2[0].z, l(0.500000), l(0.750000)
  28:   max r5.x, r1.w, r2.w
  29:   sample r5.xyzw, r5.xzwx, t2.xyzw, s0
  30: else 
  31:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  32: endif 
  33: dp4_sat r1.w, r5.xyzw, cb1[46].xyzw
  34: sample r4.xyzw, r4.xyxx, t1.xyzw, s2
  35: mul r1.w, r1.w, r4.w
  36: mul r4.xyz, r1.wwww, cb0[2].xyzx
  37: add r1.w, -cb0[8].w, l(1.000000)
  38: mov r5.x, v3.w
  39: mov r5.y, v4.w
  40: mov r5.z, v5.w
  41: mad r6.xyz, -v2.xyzx, r0.wwww, r5.xyzx
  42: dp3 r0.w, r6.xyzx, r6.xyzx
  43: max r0.w, r0.w, l(0.001000)
  44: rsq r0.w, r0.w
  45: mul r6.xyz, r0.wwww, r6.xyzx
  46: dp3 r0.w, r2.xyzx, -r3.xyzx
  47: dp3_sat r2.w, r2.xyzx, r5.xyzx
  48: dp3_sat r2.x, r2.xyzx, r6.xyzx
  49: dp3_sat r2.y, r5.xyzx, r6.xyzx
  50: mul r2.z, r2.y, r2.y
  51: dp2 r2.z, r2.zzzz, r1.wwww
  52: add r2.z, r2.z, l(-0.500000)
  53: add r3.x, -r2.w, l(1.000000)
  54: mul r3.y, r3.x, r3.x
  55: mul r3.y, r3.y, r3.y
  56: mul r3.x, r3.x, r3.y
  57: mad r3.x, r2.z, r3.x, l(1.000000)
  58: add r3.y, -|r0.w|, l(1.000000)
  59: mul r3.z, r3.y, r3.y
  60: mul r3.z, r3.z, r3.z
  61: mul r3.y, r3.y, r3.z
  62: mad r2.z, r2.z, r3.y, l(1.000000)
  63: mul r2.z, r2.z, r3.x
  64: mul r2.z, r2.w, r2.z
  65: mul r1.w, r1.w, r1.w
  66: max r1.w, r1.w, l(0.002000)
  67: add r3.x, -r1.w, l(1.000000)
  68: mad r3.y, |r0.w|, r3.x, r1.w
  69: mad r3.x, r2.w, r3.x, r1.w
  70: mul r0.w, |r0.w|, r3.x
  71: mad r0.w, r2.w, r3.y, r0.w
  72: add r0.w, r0.w, l(0.000010)
  73: div r0.w, l(0.500000), r0.w
  74: mul r1.w, r1.w, r1.w
  75: mad r3.x, r2.x, r1.w, -r2.x
  76: mad r2.x, r3.x, r2.x, l(1.000000)
  77: mul r1.w, r1.w, l(0.318310)
  78: mad r2.x, r2.x, r2.x, l(0.000000)
  79: div r1.w, r1.w, r2.x
  80: mul r0.w, r0.w, r1.w
  81: mul r0.w, r0.w, l(3.141593)
  82: max r0.w, r0.w, l(0.000100)
  83: sqrt r0.w, r0.w
  84: mul r0.w, r2.w, r0.w
  85: dp3 r1.w, r0.xyzx, r0.xyzx
  86: ne r1.w, r1.w, l(0.000000)
  87: and r1.w, r1.w, l(0x3f800000)
  88: mul r0.w, r0.w, r1.w
  89: mul r2.xzw, r2.zzzz, r4.xxyz
  90: mul r3.xyz, r4.xyzx, r0.wwww
  91: add r0.w, -r2.y, l(1.000000)
  92: mul r1.w, r0.w, r0.w
  93: mul r1.w, r1.w, r1.w
  94: mul r0.w, r0.w, r1.w
  95: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  96: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
  97: mul r0.xyz, r0.xyzx, r3.xyzx
  98: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
  99: mov o0.w, l(1.000000)
 100: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float   xyzw
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyzw, r0.yyyy, cb0[12].xyzw
  32: mad r1.xyzw, cb0[11].xyzw, r0.xxxx, r1.xyzw
  33: mad r1.xyzw, cb0[13].xyzw, r0.zzzz, r1.xyzw
  34: mad o7.xyzw, cb0[14].xyzw, r0.wwww, r1.xyzw
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 115 math, 7 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Matrix4x4 unity_WorldToShadow[4] at 128
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_resource_texture2d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyzw, v6.yyyy, cb0[12].xyzw
  13: mad r4.xyzw, cb0[11].xyzw, v6.xxxx, r4.xyzw
  14: mad r4.xyzw, cb0[13].xyzw, v6.zzzz, r4.xyzw
  15: add r4.xyzw, r4.xyzw, cb0[14].xyzw
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r0.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r1.w, r5.xyzx, r5.xyzx
  23: sqrt r1.w, r1.w
  24: add r1.w, -r0.w, r1.w
  25: mad r0.w, cb3[25].w, r1.w, r0.w
  26: mad_sat r0.w, r0.w, cb3[24].z, cb3[24].w
  27: eq r1.w, cb5[0].x, l(1.000000)
  28: if_nz r1.w
  29:   eq r1.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r1.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r1.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r2.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r1.w, r2.w
  40:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r1.w, r5.xyzw, cb2[46].xyzw
  45: mul r5.xyzw, v6.yyyy, cb3[9].xyzw
  46: mad r5.xyzw, cb3[8].xyzw, v6.xxxx, r5.xyzw
  47: mad r5.xyzw, cb3[10].xyzw, v6.zzzz, r5.xyzw
  48: add r5.xyzw, r5.xyzw, cb3[11].xyzw
  49: div r5.xyz, r5.xyzx, r5.wwww
  50: sample_c_lz r2.w, r5.xyxx, t4.xxxx, s1, r5.z
  51: add r3.w, -cb3[24].x, l(1.000000)
  52: mad r2.w, r2.w, r3.w, cb3[24].x
  53: add r1.w, r1.w, -r2.w
  54: mad r0.w, r0.w, r1.w, r2.w
  55: lt r1.w, l(0.000000), r4.z
  56: and r1.w, r1.w, l(0x3f800000)
  57: div r5.xy, r4.xyxx, r4.wwww
  58: add r5.xy, r5.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  59: sample r5.xyzw, r5.xyxx, t1.xyzw, s3
  60: mul r1.w, r1.w, r5.w
  61: dp3 r2.w, r4.xyzx, r4.xyzx
  62: sample r4.xyzw, r2.wwww, t2.xyzw, s4
  63: mul r1.w, r1.w, r4.x
  64: mul r0.w, r0.w, r1.w
  65: mov r4.x, v3.w
  66: mov r4.y, v4.w
  67: mov r4.z, v5.w
  68: dp3 r1.w, r4.xyzx, r4.xyzx
  69: rsq r1.w, r1.w
  70: mul r5.xyz, r1.wwww, r4.xyzx
  71: mul r6.xyz, r0.wwww, cb0[2].xyzx
  72: add r0.w, -cb0[8].w, l(1.000000)
  73: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  74: dp3 r1.w, r4.xyzx, r4.xyzx
  75: max r1.w, r1.w, l(0.001000)
  76: rsq r1.w, r1.w
  77: mul r4.xyz, r1.wwww, r4.xyzx
  78: dp3 r1.w, r2.xyzx, -r3.xyzx
  79: dp3_sat r2.w, r2.xyzx, r5.xyzx
  80: dp3_sat r2.x, r2.xyzx, r4.xyzx
  81: dp3_sat r2.y, r5.xyzx, r4.xyzx
  82: mul r2.z, r2.y, r2.y
  83: dp2 r2.z, r2.zzzz, r0.wwww
  84: add r2.z, r2.z, l(-0.500000)
  85: add r3.x, -r2.w, l(1.000000)
  86: mul r3.y, r3.x, r3.x
  87: mul r3.y, r3.y, r3.y
  88: mul r3.x, r3.x, r3.y
  89: mad r3.x, r2.z, r3.x, l(1.000000)
  90: add r3.y, -|r1.w|, l(1.000000)
  91: mul r3.z, r3.y, r3.y
  92: mul r3.z, r3.z, r3.z
  93: mul r3.y, r3.y, r3.z
  94: mad r2.z, r2.z, r3.y, l(1.000000)
  95: mul r2.z, r2.z, r3.x
  96: mul r2.z, r2.w, r2.z
  97: mul r0.w, r0.w, r0.w
  98: max r0.w, r0.w, l(0.002000)
  99: add r3.x, -r0.w, l(1.000000)
 100: mad r3.y, |r1.w|, r3.x, r0.w
 101: mad r3.x, r2.w, r3.x, r0.w
 102: mul r1.w, |r1.w|, r3.x
 103: mad r1.w, r2.w, r3.y, r1.w
 104: add r1.w, r1.w, l(0.000010)
 105: div r1.w, l(0.500000), r1.w
 106: mul r0.w, r0.w, r0.w
 107: mad r3.x, r2.x, r0.w, -r2.x
 108: mad r2.x, r3.x, r2.x, l(1.000000)
 109: mul r0.w, r0.w, l(0.318310)
 110: mad r2.x, r2.x, r2.x, l(0.000000)
 111: div r0.w, r0.w, r2.x
 112: mul r0.w, r0.w, r1.w
 113: mul r0.w, r0.w, l(3.141593)
 114: max r0.w, r0.w, l(0.000100)
 115: sqrt r0.w, r0.w
 116: mul r0.w, r2.w, r0.w
 117: dp3 r1.w, r0.xyzx, r0.xyzx
 118: ne r1.w, r1.w, l(0.000000)
 119: and r1.w, r1.w, l(0x3f800000)
 120: mul r0.w, r0.w, r1.w
 121: mul r2.xzw, r2.zzzz, r6.xxyz
 122: mul r3.xyz, r6.xyzx, r0.wwww
 123: add r0.w, -r2.y, l(1.000000)
 124: mul r1.w, r0.w, r0.w
 125: mul r1.w, r1.w, r1.w
 126: mul r0.w, r0.w, r1.w
 127: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 128: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 129: mul r0.xyz, r0.xyzx, r3.xyzx
 130: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 131: mov o0.w, l(1.000000)
 132: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH SHADOWS_SOFT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (320 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 256
  Vector4 _MainTex_ST at 176
  Vector4 _DetailAlbedoMap_ST at 192
  Float _UVSec at 236
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float   xyzw
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[20], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[14].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[12].xxxy, cb0[12].zzzw
  12: mad o1.xy, v2.xyxx, cb0[11].xyxx, cb0[11].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyzw, r0.yyyy, cb0[17].xyzw
  32: mad r1.xyzw, cb0[16].xyzw, r0.xxxx, r1.xyzw
  33: mad r1.xyzw, cb0[18].xyzw, r0.zzzz, r1.xyzw
  34: mad o7.xyzw, cb0[19].xyzw, r0.wwww, r1.xyzw
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 144 math, 11 temp registers, 4 textures, 4 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "$Globals" (320 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 256
  Vector4 _LightColor0 at 32
  Vector4 _ShadowMapTexture_TexelSize at 128
  Vector4 _Color at 144
  Float _Metallic at 216
  Float _Glossiness at 220
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Matrix4x4 unity_WorldToShadow[4] at 128
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[20], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_resource_texture2d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 11
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[9].xyzx
   2: mad r0.xyz, cb0[9].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[13].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[13].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyzw, v6.yyyy, cb0[17].xyzw
  13: mad r4.xyzw, cb0[16].xyzw, v6.xxxx, r4.xyzw
  14: mad r4.xyzw, cb0[18].xyzw, v6.zzzz, r4.xyzw
  15: add r4.xyzw, r4.xyzw, cb0[19].xyzw
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r0.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r1.w, r5.xyzx, r5.xyzx
  23: sqrt r1.w, r1.w
  24: add r1.w, -r0.w, r1.w
  25: mad r0.w, cb3[25].w, r1.w, r0.w
  26: mad_sat r0.w, r0.w, cb3[24].z, cb3[24].w
  27: eq r1.w, cb5[0].x, l(1.000000)
  28: if_nz r1.w
  29:   eq r1.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r1.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r1.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r2.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r1.w, r2.w
  40:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r1.w, r5.xyzw, cb2[46].xyzw
  45: lt r2.w, r0.w, l(0.990000)
  46: if_nz r2.w
  47:   mul r5.xyzw, v6.yyyy, cb3[9].xyzw
  48:   mad r5.xyzw, cb3[8].xyzw, v6.xxxx, r5.xyzw
  49:   mad r5.xyzw, cb3[10].xyzw, v6.zzzz, r5.xyzw
  50:   add r5.xyzw, r5.xyzw, cb3[11].xyzw
  51:   div r5.xyz, r5.xyzx, r5.wwww
  52:   mad r6.xy, r5.xyxx, cb0[8].zwzz, l(0.500000, 0.500000, 0.000000, 0.000000)
  53:   round_ni r6.xy, r6.xyxx
  54:   mad r5.xy, r5.xyxx, cb0[8].zwzz, -r6.xyxx
  55:   add r7.xyzw, r5.xxyy, l(0.500000, 1.000000, 0.500000, 1.000000)
  56:   mul r8.xw, r7.xxxz, r7.xxxz
  57:   mad r6.zw, r8.xxxw, l(0.000000, 0.000000, 0.500000, 0.500000), -r5.xxxy
  58:   add r7.xz, -r5.xxyx, l(1.000000, 0.000000, 1.000000, 0.000000)
  59:   min r9.xy, r5.xyxx, l(0.000000, 0.000000, 0.000000, 0.000000)
  60:   mad r7.xz, -r9.xxyx, r9.xxyx, r7.xxzx
  61:   max r5.xy, r5.xyxx, l(0.000000, 0.000000, 0.000000, 0.000000)
  62:   mad r5.xy, -r5.xyxx, r5.xyxx, r7.ywyy
  63:   mov r9.x, r6.z
  64:   mov r9.y, r7.x
  65:   mov r9.z, r5.x
  66:   mov r9.w, r8.x
  67:   mul r9.xyzw, r9.xyzw, l(0.444440, 0.444440, 0.444440, 0.222220)
  68:   mov r8.x, r6.w
  69:   mov r8.y, r7.z
  70:   mov r8.z, r5.y
  71:   mul r7.xyzw, r8.xyzw, l(0.444440, 0.444440, 0.444440, 0.222220)
  72:   add r8.xyzw, r9.ywyw, r9.xzxz
  73:   add r10.xyzw, r7.yyww, r7.xxzz
  74:   div r5.xy, r9.ywyy, r8.zwzz
  75:   add r5.xy, r5.xyxx, l(-1.500000, 0.500000, 0.000000, 0.000000)
  76:   div r6.zw, r7.yyyw, r10.yyyw
  77:   add r6.zw, r6.zzzw, l(0.000000, 0.000000, -1.500000, 0.500000)
  78:   mul r7.xy, r5.xyxx, cb0[8].xxxx
  79:   mul r7.zw, r6.zzzw, cb0[8].yyyy
  80:   mul r8.xyzw, r8.xyzw, r10.xyzw
  81:   mad r9.xyzw, r6.xyxy, cb0[8].xyxy, r7.xzyz
  82:   sample_c_lz r2.w, r9.xyxx, t4.xxxx, s1, r5.z
  83:   sample_c_lz r3.w, r9.zwzz, t4.xxxx, s1, r5.z
  84:   mul r3.w, r3.w, r8.y
  85:   mad r2.w, r8.x, r2.w, r3.w
  86:   mad r6.xyzw, r6.xyxy, cb0[8].xyxy, r7.xwyw
  87:   sample_c_lz r3.w, r6.xyxx, t4.xxxx, s1, r5.z
  88:   mad r2.w, r8.z, r3.w, r2.w
  89:   sample_c_lz r3.w, r6.zwzz, t4.xxxx, s1, r5.z
  90:   mad r2.w, r8.w, r3.w, r2.w
  91:   add r3.w, -cb3[24].x, l(1.000000)
  92:   mad r2.w, r2.w, r3.w, cb3[24].x
  93: else 
  94:   mov r2.w, l(1.000000)
  95: endif 
  96: add r1.w, r1.w, -r2.w
  97: mad r0.w, r0.w, r1.w, r2.w
  98: lt r1.w, l(0.000000), r4.z
  99: and r1.w, r1.w, l(0x3f800000)
 100: div r5.xy, r4.xyxx, r4.wwww
 101: add r5.xy, r5.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
 102: sample r5.xyzw, r5.xyxx, t1.xyzw, s3
 103: mul r1.w, r1.w, r5.w
 104: dp3 r2.w, r4.xyzx, r4.xyzx
 105: sample r4.xyzw, r2.wwww, t2.xyzw, s4
 106: mul r1.w, r1.w, r4.x
 107: mul r0.w, r0.w, r1.w
 108: mov r4.x, v3.w
 109: mov r4.y, v4.w
 110: mov r4.z, v5.w
 111: dp3 r1.w, r4.xyzx, r4.xyzx
 112: rsq r1.w, r1.w
 113: mul r5.xyz, r1.wwww, r4.xyzx
 114: mul r6.xyz, r0.wwww, cb0[2].xyzx
 115: add r0.w, -cb0[13].w, l(1.000000)
 116: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
 117: dp3 r1.w, r4.xyzx, r4.xyzx
 118: max r1.w, r1.w, l(0.001000)
 119: rsq r1.w, r1.w
 120: mul r4.xyz, r1.wwww, r4.xyzx
 121: dp3 r1.w, r2.xyzx, -r3.xyzx
 122: dp3_sat r2.w, r2.xyzx, r5.xyzx
 123: dp3_sat r2.x, r2.xyzx, r4.xyzx
 124: dp3_sat r2.y, r5.xyzx, r4.xyzx
 125: mul r2.z, r2.y, r2.y
 126: dp2 r2.z, r2.zzzz, r0.wwww
 127: add r2.z, r2.z, l(-0.500000)
 128: add r3.x, -r2.w, l(1.000000)
 129: mul r3.y, r3.x, r3.x
 130: mul r3.y, r3.y, r3.y
 131: mul r3.x, r3.x, r3.y
 132: mad r3.x, r2.z, r3.x, l(1.000000)
 133: add r3.y, -|r1.w|, l(1.000000)
 134: mul r3.z, r3.y, r3.y
 135: mul r3.z, r3.z, r3.z
 136: mul r3.y, r3.y, r3.z
 137: mad r2.z, r2.z, r3.y, l(1.000000)
 138: mul r2.z, r2.z, r3.x
 139: mul r2.z, r2.w, r2.z
 140: mul r0.w, r0.w, r0.w
 141: max r0.w, r0.w, l(0.002000)
 142: add r3.x, -r0.w, l(1.000000)
 143: mad r3.y, |r1.w|, r3.x, r0.w
 144: mad r3.x, r2.w, r3.x, r0.w
 145: mul r1.w, |r1.w|, r3.x
 146: mad r1.w, r2.w, r3.y, r1.w
 147: add r1.w, r1.w, l(0.000010)
 148: div r1.w, l(0.500000), r1.w
 149: mul r0.w, r0.w, r0.w
 150: mad r3.x, r2.x, r0.w, -r2.x
 151: mad r2.x, r3.x, r2.x, l(1.000000)
 152: mul r0.w, r0.w, l(0.318310)
 153: mad r2.x, r2.x, r2.x, l(0.000000)
 154: div r0.w, r0.w, r2.x
 155: mul r0.w, r0.w, r1.w
 156: mul r0.w, r0.w, l(3.141593)
 157: max r0.w, r0.w, l(0.000100)
 158: sqrt r0.w, r0.w
 159: mul r0.w, r2.w, r0.w
 160: dp3 r1.w, r0.xyzx, r0.xyzx
 161: ne r1.w, r1.w, l(0.000000)
 162: and r1.w, r1.w, l(0x3f800000)
 163: mul r0.w, r0.w, r1.w
 164: mul r2.xzw, r2.zzzz, r6.xxyz
 165: mul r3.xyz, r6.xyzx, r0.wwww
 166: add r0.w, -r2.y, l(1.000000)
 167: mul r1.w, r0.w, r0.w
 168: mul r1.w, r1.w, r1.w
 169: mul r0.w, r0.w, r1.w
 170: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 171: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 172: mul r0.xyz, r0.xyzx, r3.xyzx
 173: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 174: mov o0.w, l(1.000000)
 175: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 26 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r0.y, r0.y, cb1[5].x
  32: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  33: mov o7.zw, r0.zzzw
  34: add o7.xy, r1.zzzz, r1.xwxx
  35: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 94 math, 7 temp registers, 3 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[9], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: add r4.xyz, -v6.xyzx, cb1[4].xyzx
  13: mov r5.x, cb4[9].z
  14: mov r5.y, cb4[10].z
  15: mov r5.z, cb4[11].z
  16: dp3 r1.w, r4.xyzx, r5.xyzx
  17: add r4.xyz, v6.xyzx, -cb3[25].xyzx
  18: dp3 r2.w, r4.xyzx, r4.xyzx
  19: sqrt r2.w, r2.w
  20: add r2.w, -r1.w, r2.w
  21: mad r1.w, cb3[25].w, r2.w, r1.w
  22: mad_sat r1.w, r1.w, cb3[24].z, cb3[24].w
  23: eq r2.w, cb5[0].x, l(1.000000)
  24: if_nz r2.w
  25:   eq r2.w, cb5[0].y, l(1.000000)
  26:   mul r4.xyz, v6.yyyy, cb5[2].xyzx
  27:   mad r4.xyz, cb5[1].xyzx, v6.xxxx, r4.xyzx
  28:   mad r4.xyz, cb5[3].xyzx, v6.zzzz, r4.xyzx
  29:   add r4.xyz, r4.xyzx, cb5[4].xyzx
  30:   movc r4.xyz, r2.wwww, r4.xyzx, v6.xyzx
  31:   add r4.xyz, r4.xyzx, -cb5[6].xyzx
  32:   mul r4.yzw, r4.xxyz, cb5[5].xxyz
  33:   mad r2.w, r4.y, l(0.250000), l(0.750000)
  34:   mad r3.w, cb5[0].z, l(0.500000), l(0.750000)
  35:   max r4.x, r2.w, r3.w
  36:   sample r4.xyzw, r4.xzwx, t2.xyzw, s0
  37: else 
  38:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  39: endif 
  40: dp4_sat r2.w, r4.xyzw, cb2[46].xyzw
  41: div r4.xy, v7.xyxx, v7.wwww
  42: sample r4.xyzw, r4.xyxx, t1.xyzw, s2
  43: add r2.w, r2.w, -r4.x
  44: mad r1.w, r1.w, r2.w, r4.x
  45: mul r4.xyz, r1.wwww, cb0[2].xyzx
  46: add r1.w, -cb0[8].w, l(1.000000)
  47: mov r5.x, v3.w
  48: mov r5.y, v4.w
  49: mov r5.z, v5.w
  50: mad r6.xyz, -v2.xyzx, r0.wwww, r5.xyzx
  51: dp3 r0.w, r6.xyzx, r6.xyzx
  52: max r0.w, r0.w, l(0.001000)
  53: rsq r0.w, r0.w
  54: mul r6.xyz, r0.wwww, r6.xyzx
  55: dp3 r0.w, r2.xyzx, -r3.xyzx
  56: dp3_sat r2.w, r2.xyzx, r5.xyzx
  57: dp3_sat r2.x, r2.xyzx, r6.xyzx
  58: dp3_sat r2.y, r5.xyzx, r6.xyzx
  59: mul r2.z, r2.y, r2.y
  60: dp2 r2.z, r2.zzzz, r1.wwww
  61: add r2.z, r2.z, l(-0.500000)
  62: add r3.x, -r2.w, l(1.000000)
  63: mul r3.y, r3.x, r3.x
  64: mul r3.y, r3.y, r3.y
  65: mul r3.x, r3.x, r3.y
  66: mad r3.x, r2.z, r3.x, l(1.000000)
  67: add r3.y, -|r0.w|, l(1.000000)
  68: mul r3.z, r3.y, r3.y
  69: mul r3.z, r3.z, r3.z
  70: mul r3.y, r3.y, r3.z
  71: mad r2.z, r2.z, r3.y, l(1.000000)
  72: mul r2.z, r2.z, r3.x
  73: mul r2.z, r2.w, r2.z
  74: mul r1.w, r1.w, r1.w
  75: max r1.w, r1.w, l(0.002000)
  76: add r3.x, -r1.w, l(1.000000)
  77: mad r3.y, |r0.w|, r3.x, r1.w
  78: mad r3.x, r2.w, r3.x, r1.w
  79: mul r0.w, |r0.w|, r3.x
  80: mad r0.w, r2.w, r3.y, r0.w
  81: add r0.w, r0.w, l(0.000010)
  82: div r0.w, l(0.500000), r0.w
  83: mul r1.w, r1.w, r1.w
  84: mad r3.x, r2.x, r1.w, -r2.x
  85: mad r2.x, r3.x, r2.x, l(1.000000)
  86: mul r1.w, r1.w, l(0.318310)
  87: mad r2.x, r2.x, r2.x, l(0.000000)
  88: div r1.w, r1.w, r2.x
  89: mul r0.w, r0.w, r1.w
  90: mul r0.w, r0.w, l(3.141593)
  91: max r0.w, r0.w, l(0.000100)
  92: sqrt r0.w, r0.w
  93: mul r0.w, r2.w, r0.w
  94: dp3 r1.w, r0.xyzx, r0.xyzx
  95: ne r1.w, r1.w, l(0.000000)
  96: and r1.w, r1.w, l(0x3f800000)
  97: mul r0.w, r0.w, r1.w
  98: mul r2.xzw, r2.zzzz, r4.xxyz
  99: mul r3.xyz, r4.xyzx, r0.wwww
 100: add r0.w, -r2.y, l(1.000000)
 101: mul r1.w, r0.w, r0.w
 102: mul r1.w, r1.w, r1.w
 103: mul r0.w, r0.w, r1.w
 104: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 105: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 106: mul r0.xyz, r0.xyzx, r3.xyzx
 107: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 108: mov o0.w, l(1.000000)
 109: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 32 math, 4 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float   xy  
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xy
      dcl_output o8.xyzw
      dcl_temps 4
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad r1.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: mov o0.xyzw, r1.xyzw
  10: eq r2.x, cb0[9].w, l(0.000000)
  11: movc r2.xy, r2.xxxx, v2.xyxx, v3.xyxx
  12: mad o1.zw, r2.xxxy, cb0[7].xxxy, cb0[7].zzzw
  13: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  14: mul r2.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r2.xyz, cb3[0].xyzx, v0.xxxx, r2.xyzx
  16: mad r2.xyz, cb3[2].xyzx, v0.zzzz, r2.xyzx
  17: mad r2.xyz, cb3[3].xyzx, v0.wwww, r2.xyzx
  18: add o2.xyz, r2.xyzx, -cb1[4].xyzx
  19: mov o2.w, l(0)
  20: mad r3.xyz, -r2.xyzx, cb2[0].wwww, cb2[0].xyzx
  21: mov o6.xyz, r2.xyzx
  22: mov r3.w, l(0)
  23: mov o3.xyzw, r3.wwwx
  24: mov o4.xyzw, r3.wwwy
  25: mov o5.w, r3.z
  26: dp3 r2.x, v1.xyzx, cb3[4].xyzx
  27: dp3 r2.y, v1.xyzx, cb3[5].xyzx
  28: dp3 r2.z, v1.xyzx, cb3[6].xyzx
  29: dp3 r2.w, r2.xyzx, r2.xyzx
  30: rsq r2.w, r2.w
  31: mul o5.xyz, r2.wwww, r2.xyzx
  32: mul r2.xy, r0.yyyy, cb0[12].xyxx
  33: mad r0.xy, cb0[11].xyxx, r0.xxxx, r2.xyxx
  34: mad r0.xy, cb0[13].xyxx, r0.zzzz, r0.xyxx
  35: mad o7.xy, cb0[14].xyxx, r0.wwww, r0.xyxx
  36: mul r0.x, r1.y, cb1[5].x
  37: mul r0.w, r0.x, l(0.500000)
  38: mul r0.xz, r1.xxwx, l(0.500000, 0.000000, 0.500000, 0.000000)
  39: mov o8.zw, r1.zzzw
  40: add o8.xy, r0.zzzz, r0.xwxx
  41: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 99 math, 7 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v8.xyw
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xy, v6.yyyy, cb0[12].xyxx
  13: mad r4.xy, cb0[11].xyxx, v6.xxxx, r4.xyxx
  14: mad r4.xy, cb0[13].xyxx, v6.zzzz, r4.xyxx
  15: add r4.xy, r4.xyxx, cb0[14].xyxx
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r1.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r2.w, r5.xyzx, r5.xyzx
  23: sqrt r2.w, r2.w
  24: add r2.w, -r1.w, r2.w
  25: mad r1.w, cb3[25].w, r2.w, r1.w
  26: mad_sat r1.w, r1.w, cb3[24].z, cb3[24].w
  27: eq r2.w, cb5[0].x, l(1.000000)
  28: if_nz r2.w
  29:   eq r2.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r2.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r2.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r3.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r2.w, r3.w
  40:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r2.w, r5.xyzw, cb2[46].xyzw
  45: div r4.zw, v8.xxxy, v8.wwww
  46: sample r5.xyzw, r4.zwzz, t1.xyzw, s2
  47: add r2.w, r2.w, -r5.x
  48: mad r1.w, r1.w, r2.w, r5.x
  49: sample r4.xyzw, r4.xyxx, t2.xyzw, s3
  50: mul r1.w, r1.w, r4.w
  51: mul r4.xyz, r1.wwww, cb0[2].xyzx
  52: add r1.w, -cb0[8].w, l(1.000000)
  53: mov r5.x, v3.w
  54: mov r5.y, v4.w
  55: mov r5.z, v5.w
  56: mad r6.xyz, -v2.xyzx, r0.wwww, r5.xyzx
  57: dp3 r0.w, r6.xyzx, r6.xyzx
  58: max r0.w, r0.w, l(0.001000)
  59: rsq r0.w, r0.w
  60: mul r6.xyz, r0.wwww, r6.xyzx
  61: dp3 r0.w, r2.xyzx, -r3.xyzx
  62: dp3_sat r2.w, r2.xyzx, r5.xyzx
  63: dp3_sat r2.x, r2.xyzx, r6.xyzx
  64: dp3_sat r2.y, r5.xyzx, r6.xyzx
  65: mul r2.z, r2.y, r2.y
  66: dp2 r2.z, r2.zzzz, r1.wwww
  67: add r2.z, r2.z, l(-0.500000)
  68: add r3.x, -r2.w, l(1.000000)
  69: mul r3.y, r3.x, r3.x
  70: mul r3.y, r3.y, r3.y
  71: mul r3.x, r3.x, r3.y
  72: mad r3.x, r2.z, r3.x, l(1.000000)
  73: add r3.y, -|r0.w|, l(1.000000)
  74: mul r3.z, r3.y, r3.y
  75: mul r3.z, r3.z, r3.z
  76: mul r3.y, r3.y, r3.z
  77: mad r2.z, r2.z, r3.y, l(1.000000)
  78: mul r2.z, r2.z, r3.x
  79: mul r2.z, r2.w, r2.z
  80: mul r1.w, r1.w, r1.w
  81: max r1.w, r1.w, l(0.002000)
  82: add r3.x, -r1.w, l(1.000000)
  83: mad r3.y, |r0.w|, r3.x, r1.w
  84: mad r3.x, r2.w, r3.x, r1.w
  85: mul r0.w, |r0.w|, r3.x
  86: mad r0.w, r2.w, r3.y, r0.w
  87: add r0.w, r0.w, l(0.000010)
  88: div r0.w, l(0.500000), r0.w
  89: mul r1.w, r1.w, r1.w
  90: mad r3.x, r2.x, r1.w, -r2.x
  91: mad r2.x, r3.x, r2.x, l(1.000000)
  92: mul r1.w, r1.w, l(0.318310)
  93: mad r2.x, r2.x, r2.x, l(0.000000)
  94: div r1.w, r1.w, r2.x
  95: mul r0.w, r0.w, r1.w
  96: mul r0.w, r0.w, l(3.141593)
  97: max r0.w, r0.w, l(0.000100)
  98: sqrt r0.w, r0.w
  99: mul r0.w, r2.w, r0.w
 100: dp3 r1.w, r0.xyzx, r0.xyzx
 101: ne r1.w, r1.w, l(0.000000)
 102: and r1.w, r1.w, l(0x3f800000)
 103: mul r0.w, r0.w, r1.w
 104: mul r2.xzw, r2.zzzz, r4.xxyz
 105: mul r3.xyz, r4.xyzx, r0.wwww
 106: add r0.w, -r2.y, l(1.000000)
 107: mul r1.w, r0.w, r0.w
 108: mul r1.w, r1.w, r1.w
 109: mul r0.w, r0.w, r1.w
 110: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 111: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 112: mul r0.xyz, r0.xyzx, r3.xyzx
 113: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 114: mov o0.w, l(1.000000)
 115: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  32: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  33: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  34: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 113 math, 7 temp registers, 3 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 3 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyz, v6.yyyy, cb0[12].xyzx
  13: mad r4.xyz, cb0[11].xyzx, v6.xxxx, r4.xyzx
  14: mad r4.xyz, cb0[13].xyzx, v6.zzzz, r4.xyzx
  15: add r4.xyz, r4.xyzx, cb0[14].xyzx
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r0.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r1.w, r5.xyzx, r5.xyzx
  23: sqrt r1.w, r1.w
  24: add r1.w, -r0.w, r1.w
  25: mad r0.w, cb3[25].w, r1.w, r0.w
  26: mad_sat r0.w, r0.w, cb3[24].z, cb3[24].w
  27: eq r1.w, cb5[0].x, l(1.000000)
  28: if_nz r1.w
  29:   eq r1.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r1.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r1.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r2.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r1.w, r2.w
  40:   sample r5.xyzw, r5.xzwx, t2.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r1.w, r5.xyzw, cb2[46].xyzw
  45: add r5.xyz, v6.xyzx, -cb2[1].xyzx
  46: max r2.w, |r5.y|, |r5.x|
  47: max r2.w, |r5.z|, r2.w
  48: add r2.w, r2.w, -cb2[2].z
  49: max r2.w, r2.w, l(0.000010)
  50: mul r2.w, r2.w, cb2[2].w
  51: div r2.w, cb2[2].y, r2.w
  52: add r2.w, r2.w, -cb2[2].x
  53: add r2.w, -r2.w, l(1.000000)
  54: sample_c_lz r2.w, r5.xyzx, t3.xxxx, s1, r2.w
  55: add r3.w, -cb3[24].x, l(1.000000)
  56: mad r2.w, r2.w, r3.w, cb3[24].x
  57: add r1.w, r1.w, -r2.w
  58: mad r0.w, r0.w, r1.w, r2.w
  59: dp3 r1.w, r4.xyzx, r4.xyzx
  60: sample r4.xyzw, r1.wwww, t1.xyzw, s3
  61: mul r0.w, r0.w, r4.x
  62: mov r4.x, v3.w
  63: mov r4.y, v4.w
  64: mov r4.z, v5.w
  65: dp3 r1.w, r4.xyzx, r4.xyzx
  66: rsq r1.w, r1.w
  67: mul r5.xyz, r1.wwww, r4.xyzx
  68: mul r6.xyz, r0.wwww, cb0[2].xyzx
  69: add r0.w, -cb0[8].w, l(1.000000)
  70: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  71: dp3 r1.w, r4.xyzx, r4.xyzx
  72: max r1.w, r1.w, l(0.001000)
  73: rsq r1.w, r1.w
  74: mul r4.xyz, r1.wwww, r4.xyzx
  75: dp3 r1.w, r2.xyzx, -r3.xyzx
  76: dp3_sat r2.w, r2.xyzx, r5.xyzx
  77: dp3_sat r2.x, r2.xyzx, r4.xyzx
  78: dp3_sat r2.y, r5.xyzx, r4.xyzx
  79: mul r2.z, r2.y, r2.y
  80: dp2 r2.z, r2.zzzz, r0.wwww
  81: add r2.z, r2.z, l(-0.500000)
  82: add r3.x, -r2.w, l(1.000000)
  83: mul r3.y, r3.x, r3.x
  84: mul r3.y, r3.y, r3.y
  85: mul r3.x, r3.x, r3.y
  86: mad r3.x, r2.z, r3.x, l(1.000000)
  87: add r3.y, -|r1.w|, l(1.000000)
  88: mul r3.z, r3.y, r3.y
  89: mul r3.z, r3.z, r3.z
  90: mul r3.y, r3.y, r3.z
  91: mad r2.z, r2.z, r3.y, l(1.000000)
  92: mul r2.z, r2.z, r3.x
  93: mul r2.z, r2.w, r2.z
  94: mul r0.w, r0.w, r0.w
  95: max r0.w, r0.w, l(0.002000)
  96: add r3.x, -r0.w, l(1.000000)
  97: mad r3.y, |r1.w|, r3.x, r0.w
  98: mad r3.x, r2.w, r3.x, r0.w
  99: mul r1.w, |r1.w|, r3.x
 100: mad r1.w, r2.w, r3.y, r1.w
 101: add r1.w, r1.w, l(0.000010)
 102: div r1.w, l(0.500000), r1.w
 103: mul r0.w, r0.w, r0.w
 104: mad r3.x, r2.x, r0.w, -r2.x
 105: mad r2.x, r3.x, r2.x, l(1.000000)
 106: mul r0.w, r0.w, l(0.318310)
 107: mad r2.x, r2.x, r2.x, l(0.000000)
 108: div r0.w, r0.w, r2.x
 109: mul r0.w, r0.w, r1.w
 110: mul r0.w, r0.w, l(3.141593)
 111: max r0.w, r0.w, l(0.000100)
 112: sqrt r0.w, r0.w
 113: mul r0.w, r2.w, r0.w
 114: dp3 r1.w, r0.xyzx, r0.xyzx
 115: ne r1.w, r1.w, l(0.000000)
 116: and r1.w, r1.w, l(0x3f800000)
 117: mul r0.w, r0.w, r1.w
 118: mul r2.xzw, r2.zzzz, r6.xxyz
 119: mul r3.xyz, r6.xyzx, r0.wwww
 120: add r0.w, -r2.y, l(1.000000)
 121: mul r1.w, r0.w, r0.w
 122: mul r1.w, r1.w, r1.w
 123: mul r0.w, r0.w, r1.w
 124: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 125: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 126: mul r0.xyz, r0.xyzx, r3.xyzx
 127: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 128: mov o0.w, l(1.000000)
 129: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE SHADOWS_SOFT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  32: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  33: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  34: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 119 math, 8 temp registers, 3 textures, 4 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 3 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 8
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyz, v6.yyyy, cb0[12].xyzx
  13: mad r4.xyz, cb0[11].xyzx, v6.xxxx, r4.xyzx
  14: mad r4.xyz, cb0[13].xyzx, v6.zzzz, r4.xyzx
  15: add r4.xyz, r4.xyzx, cb0[14].xyzx
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r0.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r1.w, r5.xyzx, r5.xyzx
  23: sqrt r1.w, r1.w
  24: add r1.w, -r0.w, r1.w
  25: mad r0.w, cb3[25].w, r1.w, r0.w
  26: mad_sat r0.w, r0.w, cb3[24].z, cb3[24].w
  27: eq r1.w, cb5[0].x, l(1.000000)
  28: if_nz r1.w
  29:   eq r1.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r1.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r1.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r2.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r1.w, r2.w
  40:   sample r5.xyzw, r5.xzwx, t2.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r1.w, r5.xyzw, cb2[46].xyzw
  45: lt r2.w, r0.w, l(0.990000)
  46: if_nz r2.w
  47:   add r5.xyz, v6.xyzx, -cb2[1].xyzx
  48:   max r2.w, |r5.y|, |r5.x|
  49:   max r2.w, |r5.z|, r2.w
  50:   add r2.w, r2.w, -cb2[2].z
  51:   max r2.w, r2.w, l(0.000010)
  52:   mul r2.w, r2.w, cb2[2].w
  53:   div r2.w, cb2[2].y, r2.w
  54:   add r2.w, r2.w, -cb2[2].x
  55:   add r2.w, -r2.w, l(1.000000)
  56:   add r6.xyz, r5.xyzx, l(0.007813, 0.007813, 0.007813, 0.000000)
  57:   sample_c_lz r6.x, r6.xyzx, t3.xxxx, s1, r2.w
  58:   add r7.xyz, r5.xyzx, l(-0.007813, -0.007813, 0.007813, 0.000000)
  59:   sample_c_lz r6.y, r7.xyzx, t3.xxxx, s1, r2.w
  60:   add r7.xyz, r5.xyzx, l(-0.007813, 0.007813, -0.007813, 0.000000)
  61:   sample_c_lz r6.z, r7.xyzx, t3.xxxx, s1, r2.w
  62:   add r5.xyz, r5.xyzx, l(0.007813, -0.007813, -0.007813, 0.000000)
  63:   sample_c_lz r6.w, r5.xyzx, t3.xxxx, s1, r2.w
  64:   dp4 r2.w, r6.xyzw, l(0.250000, 0.250000, 0.250000, 0.250000)
  65:   add r3.w, -cb3[24].x, l(1.000000)
  66:   mad r2.w, r2.w, r3.w, cb3[24].x
  67: else 
  68:   mov r2.w, l(1.000000)
  69: endif 
  70: add r1.w, r1.w, -r2.w
  71: mad r0.w, r0.w, r1.w, r2.w
  72: dp3 r1.w, r4.xyzx, r4.xyzx
  73: sample r4.xyzw, r1.wwww, t1.xyzw, s3
  74: mul r0.w, r0.w, r4.x
  75: mov r4.x, v3.w
  76: mov r4.y, v4.w
  77: mov r4.z, v5.w
  78: dp3 r1.w, r4.xyzx, r4.xyzx
  79: rsq r1.w, r1.w
  80: mul r5.xyz, r1.wwww, r4.xyzx
  81: mul r6.xyz, r0.wwww, cb0[2].xyzx
  82: add r0.w, -cb0[8].w, l(1.000000)
  83: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  84: dp3 r1.w, r4.xyzx, r4.xyzx
  85: max r1.w, r1.w, l(0.001000)
  86: rsq r1.w, r1.w
  87: mul r4.xyz, r1.wwww, r4.xyzx
  88: dp3 r1.w, r2.xyzx, -r3.xyzx
  89: dp3_sat r2.w, r2.xyzx, r5.xyzx
  90: dp3_sat r2.x, r2.xyzx, r4.xyzx
  91: dp3_sat r2.y, r5.xyzx, r4.xyzx
  92: mul r2.z, r2.y, r2.y
  93: dp2 r2.z, r2.zzzz, r0.wwww
  94: add r2.z, r2.z, l(-0.500000)
  95: add r3.x, -r2.w, l(1.000000)
  96: mul r3.y, r3.x, r3.x
  97: mul r3.y, r3.y, r3.y
  98: mul r3.x, r3.x, r3.y
  99: mad r3.x, r2.z, r3.x, l(1.000000)
 100: add r3.y, -|r1.w|, l(1.000000)
 101: mul r3.z, r3.y, r3.y
 102: mul r3.z, r3.z, r3.z
 103: mul r3.y, r3.y, r3.z
 104: mad r2.z, r2.z, r3.y, l(1.000000)
 105: mul r2.z, r2.z, r3.x
 106: mul r2.z, r2.w, r2.z
 107: mul r0.w, r0.w, r0.w
 108: max r0.w, r0.w, l(0.002000)
 109: add r3.x, -r0.w, l(1.000000)
 110: mad r3.y, |r1.w|, r3.x, r0.w
 111: mad r3.x, r2.w, r3.x, r0.w
 112: mul r1.w, |r1.w|, r3.x
 113: mad r1.w, r2.w, r3.y, r1.w
 114: add r1.w, r1.w, l(0.000010)
 115: div r1.w, l(0.500000), r1.w
 116: mul r0.w, r0.w, r0.w
 117: mad r3.x, r2.x, r0.w, -r2.x
 118: mad r2.x, r3.x, r2.x, l(1.000000)
 119: mul r0.w, r0.w, l(0.318310)
 120: mad r2.x, r2.x, r2.x, l(0.000000)
 121: div r0.w, r0.w, r2.x
 122: mul r0.w, r0.w, r1.w
 123: mul r0.w, r0.w, l(3.141593)
 124: max r0.w, r0.w, l(0.000100)
 125: sqrt r0.w, r0.w
 126: mul r0.w, r2.w, r0.w
 127: dp3 r1.w, r0.xyzx, r0.xyzx
 128: ne r1.w, r1.w, l(0.000000)
 129: and r1.w, r1.w, l(0x3f800000)
 130: mul r0.w, r0.w, r1.w
 131: mul r2.xzw, r2.zzzz, r6.xxyz
 132: mul r3.xyz, r6.xyzx, r0.wwww
 133: add r0.w, -r2.y, l(1.000000)
 134: mul r1.w, r0.w, r0.w
 135: mul r1.w, r1.w, r1.w
 136: mul r0.w, r0.w, r1.w
 137: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 138: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 139: mul r0.xyz, r0.xyzx, r3.xyzx
 140: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 141: mov o0.w, l(1.000000)
 142: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  32: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  33: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  34: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 114 math, 7 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texturecube (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyz, v6.yyyy, cb0[12].xyzx
  13: mad r4.xyz, cb0[11].xyzx, v6.xxxx, r4.xyzx
  14: mad r4.xyz, cb0[13].xyzx, v6.zzzz, r4.xyzx
  15: add r4.xyz, r4.xyzx, cb0[14].xyzx
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r0.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r1.w, r5.xyzx, r5.xyzx
  23: sqrt r1.w, r1.w
  24: add r1.w, -r0.w, r1.w
  25: mad r0.w, cb3[25].w, r1.w, r0.w
  26: mad_sat r0.w, r0.w, cb3[24].z, cb3[24].w
  27: eq r1.w, cb5[0].x, l(1.000000)
  28: if_nz r1.w
  29:   eq r1.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r1.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r1.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r2.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r1.w, r2.w
  40:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r1.w, r5.xyzw, cb2[46].xyzw
  45: add r5.xyz, v6.xyzx, -cb2[1].xyzx
  46: max r2.w, |r5.y|, |r5.x|
  47: max r2.w, |r5.z|, r2.w
  48: add r2.w, r2.w, -cb2[2].z
  49: max r2.w, r2.w, l(0.000010)
  50: mul r2.w, r2.w, cb2[2].w
  51: div r2.w, cb2[2].y, r2.w
  52: add r2.w, r2.w, -cb2[2].x
  53: add r2.w, -r2.w, l(1.000000)
  54: sample_c_lz r2.w, r5.xyzx, t4.xxxx, s1, r2.w
  55: add r3.w, -cb3[24].x, l(1.000000)
  56: mad r2.w, r2.w, r3.w, cb3[24].x
  57: add r1.w, r1.w, -r2.w
  58: mad r0.w, r0.w, r1.w, r2.w
  59: dp3 r1.w, r4.xyzx, r4.xyzx
  60: sample r5.xyzw, r1.wwww, t1.xyzw, s4
  61: sample r4.xyzw, r4.xyzx, t2.xyzw, s3
  62: mul r1.w, r4.w, r5.x
  63: mul r0.w, r0.w, r1.w
  64: mov r4.x, v3.w
  65: mov r4.y, v4.w
  66: mov r4.z, v5.w
  67: dp3 r1.w, r4.xyzx, r4.xyzx
  68: rsq r1.w, r1.w
  69: mul r5.xyz, r1.wwww, r4.xyzx
  70: mul r6.xyz, r0.wwww, cb0[2].xyzx
  71: add r0.w, -cb0[8].w, l(1.000000)
  72: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  73: dp3 r1.w, r4.xyzx, r4.xyzx
  74: max r1.w, r1.w, l(0.001000)
  75: rsq r1.w, r1.w
  76: mul r4.xyz, r1.wwww, r4.xyzx
  77: dp3 r1.w, r2.xyzx, -r3.xyzx
  78: dp3_sat r2.w, r2.xyzx, r5.xyzx
  79: dp3_sat r2.x, r2.xyzx, r4.xyzx
  80: dp3_sat r2.y, r5.xyzx, r4.xyzx
  81: mul r2.z, r2.y, r2.y
  82: dp2 r2.z, r2.zzzz, r0.wwww
  83: add r2.z, r2.z, l(-0.500000)
  84: add r3.x, -r2.w, l(1.000000)
  85: mul r3.y, r3.x, r3.x
  86: mul r3.y, r3.y, r3.y
  87: mul r3.x, r3.x, r3.y
  88: mad r3.x, r2.z, r3.x, l(1.000000)
  89: add r3.y, -|r1.w|, l(1.000000)
  90: mul r3.z, r3.y, r3.y
  91: mul r3.z, r3.z, r3.z
  92: mul r3.y, r3.y, r3.z
  93: mad r2.z, r2.z, r3.y, l(1.000000)
  94: mul r2.z, r2.z, r3.x
  95: mul r2.z, r2.w, r2.z
  96: mul r0.w, r0.w, r0.w
  97: max r0.w, r0.w, l(0.002000)
  98: add r3.x, -r0.w, l(1.000000)
  99: mad r3.y, |r1.w|, r3.x, r0.w
 100: mad r3.x, r2.w, r3.x, r0.w
 101: mul r1.w, |r1.w|, r3.x
 102: mad r1.w, r2.w, r3.y, r1.w
 103: add r1.w, r1.w, l(0.000010)
 104: div r1.w, l(0.500000), r1.w
 105: mul r0.w, r0.w, r0.w
 106: mad r3.x, r2.x, r0.w, -r2.x
 107: mad r2.x, r3.x, r2.x, l(1.000000)
 108: mul r0.w, r0.w, l(0.318310)
 109: mad r2.x, r2.x, r2.x, l(0.000000)
 110: div r0.w, r0.w, r2.x
 111: mul r0.w, r0.w, r1.w
 112: mul r0.w, r0.w, l(3.141593)
 113: max r0.w, r0.w, l(0.000100)
 114: sqrt r0.w, r0.w
 115: mul r0.w, r2.w, r0.w
 116: dp3 r1.w, r0.xyzx, r0.xyzx
 117: ne r1.w, r1.w, l(0.000000)
 118: and r1.w, r1.w, l(0x3f800000)
 119: mul r0.w, r0.w, r1.w
 120: mul r2.xzw, r2.zzzz, r6.xxyz
 121: mul r3.xyz, r6.xyzx, r0.wwww
 122: add r0.w, -r2.y, l(1.000000)
 123: mul r1.w, r0.w, r0.w
 124: mul r1.w, r1.w, r1.w
 125: mul r0.w, r0.w, r1.w
 126: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 127: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 128: mul r0.xyz, r0.xyzx, r3.xyzx
 129: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 130: mov o0.w, l(1.000000)
 131: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE SHADOWS_SOFT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 28 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  32: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  33: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  34: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  35: mov o8.xyzw, l(0,0,0,0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 120 math, 8 temp registers, 4 textures, 4 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texturecube (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 8
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xyz, v6.yyyy, cb0[12].xyzx
  13: mad r4.xyz, cb0[11].xyzx, v6.xxxx, r4.xyzx
  14: mad r4.xyz, cb0[13].xyzx, v6.zzzz, r4.xyzx
  15: add r4.xyz, r4.xyzx, cb0[14].xyzx
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r0.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r1.w, r5.xyzx, r5.xyzx
  23: sqrt r1.w, r1.w
  24: add r1.w, -r0.w, r1.w
  25: mad r0.w, cb3[25].w, r1.w, r0.w
  26: mad_sat r0.w, r0.w, cb3[24].z, cb3[24].w
  27: eq r1.w, cb5[0].x, l(1.000000)
  28: if_nz r1.w
  29:   eq r1.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r1.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r1.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r2.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r1.w, r2.w
  40:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r1.w, r5.xyzw, cb2[46].xyzw
  45: lt r2.w, r0.w, l(0.990000)
  46: if_nz r2.w
  47:   add r5.xyz, v6.xyzx, -cb2[1].xyzx
  48:   max r2.w, |r5.y|, |r5.x|
  49:   max r2.w, |r5.z|, r2.w
  50:   add r2.w, r2.w, -cb2[2].z
  51:   max r2.w, r2.w, l(0.000010)
  52:   mul r2.w, r2.w, cb2[2].w
  53:   div r2.w, cb2[2].y, r2.w
  54:   add r2.w, r2.w, -cb2[2].x
  55:   add r2.w, -r2.w, l(1.000000)
  56:   add r6.xyz, r5.xyzx, l(0.007813, 0.007813, 0.007813, 0.000000)
  57:   sample_c_lz r6.x, r6.xyzx, t4.xxxx, s1, r2.w
  58:   add r7.xyz, r5.xyzx, l(-0.007813, -0.007813, 0.007813, 0.000000)
  59:   sample_c_lz r6.y, r7.xyzx, t4.xxxx, s1, r2.w
  60:   add r7.xyz, r5.xyzx, l(-0.007813, 0.007813, -0.007813, 0.000000)
  61:   sample_c_lz r6.z, r7.xyzx, t4.xxxx, s1, r2.w
  62:   add r5.xyz, r5.xyzx, l(0.007813, -0.007813, -0.007813, 0.000000)
  63:   sample_c_lz r6.w, r5.xyzx, t4.xxxx, s1, r2.w
  64:   dp4 r2.w, r6.xyzw, l(0.250000, 0.250000, 0.250000, 0.250000)
  65:   add r3.w, -cb3[24].x, l(1.000000)
  66:   mad r2.w, r2.w, r3.w, cb3[24].x
  67: else 
  68:   mov r2.w, l(1.000000)
  69: endif 
  70: add r1.w, r1.w, -r2.w
  71: mad r0.w, r0.w, r1.w, r2.w
  72: dp3 r1.w, r4.xyzx, r4.xyzx
  73: sample r5.xyzw, r1.wwww, t1.xyzw, s4
  74: sample r4.xyzw, r4.xyzx, t2.xyzw, s3
  75: mul r1.w, r4.w, r5.x
  76: mul r0.w, r0.w, r1.w
  77: mov r4.x, v3.w
  78: mov r4.y, v4.w
  79: mov r4.z, v5.w
  80: dp3 r1.w, r4.xyzx, r4.xyzx
  81: rsq r1.w, r1.w
  82: mul r5.xyz, r1.wwww, r4.xyzx
  83: mul r6.xyz, r0.wwww, cb0[2].xyzx
  84: add r0.w, -cb0[8].w, l(1.000000)
  85: mad r4.xyz, r4.xyzx, r1.wwww, -r3.xyzx
  86: dp3 r1.w, r4.xyzx, r4.xyzx
  87: max r1.w, r1.w, l(0.001000)
  88: rsq r1.w, r1.w
  89: mul r4.xyz, r1.wwww, r4.xyzx
  90: dp3 r1.w, r2.xyzx, -r3.xyzx
  91: dp3_sat r2.w, r2.xyzx, r5.xyzx
  92: dp3_sat r2.x, r2.xyzx, r4.xyzx
  93: dp3_sat r2.y, r5.xyzx, r4.xyzx
  94: mul r2.z, r2.y, r2.y
  95: dp2 r2.z, r2.zzzz, r0.wwww
  96: add r2.z, r2.z, l(-0.500000)
  97: add r3.x, -r2.w, l(1.000000)
  98: mul r3.y, r3.x, r3.x
  99: mul r3.y, r3.y, r3.y
 100: mul r3.x, r3.x, r3.y
 101: mad r3.x, r2.z, r3.x, l(1.000000)
 102: add r3.y, -|r1.w|, l(1.000000)
 103: mul r3.z, r3.y, r3.y
 104: mul r3.z, r3.z, r3.z
 105: mul r3.y, r3.y, r3.z
 106: mad r2.z, r2.z, r3.y, l(1.000000)
 107: mul r2.z, r2.z, r3.x
 108: mul r2.z, r2.w, r2.z
 109: mul r0.w, r0.w, r0.w
 110: max r0.w, r0.w, l(0.002000)
 111: add r3.x, -r0.w, l(1.000000)
 112: mad r3.y, |r1.w|, r3.x, r0.w
 113: mad r3.x, r2.w, r3.x, r0.w
 114: mul r1.w, |r1.w|, r3.x
 115: mad r1.w, r2.w, r3.y, r1.w
 116: add r1.w, r1.w, l(0.000010)
 117: div r1.w, l(0.500000), r1.w
 118: mul r0.w, r0.w, r0.w
 119: mad r3.x, r2.x, r0.w, -r2.x
 120: mad r2.x, r3.x, r2.x, l(1.000000)
 121: mul r0.w, r0.w, l(0.318310)
 122: mad r2.x, r2.x, r2.x, l(0.000000)
 123: div r0.w, r0.w, r2.x
 124: mul r0.w, r0.w, r1.w
 125: mul r0.w, r0.w, l(3.141593)
 126: max r0.w, r0.w, l(0.000100)
 127: sqrt r0.w, r0.w
 128: mul r0.w, r2.w, r0.w
 129: dp3 r1.w, r0.xyzx, r0.xyzx
 130: ne r1.w, r1.w, l(0.000000)
 131: and r1.w, r1.w, l(0x3f800000)
 132: mul r0.w, r0.w, r1.w
 133: mul r2.xzw, r2.zzzz, r6.xxyz
 134: mul r3.xyz, r6.xyzx, r0.wwww
 135: add r0.w, -r2.y, l(1.000000)
 136: mul r1.w, r0.w, r0.w
 137: mul r1.w, r1.w, r1.w
 138: mul r0.w, r0.w, r1.w
 139: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 140: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 141: mul r0.xyz, r0.xyzx, r3.xyzx
 142: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 143: mov o0.w, l(1.000000)
 144: ret 
// Approximately 0 instruction slots used


 }


 // Stats for Vertex shader:
 //        d3d11: 29 avg math (27..31)
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 31 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"

Constant Buffer "UnityLighting" (768 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityShadows" (416 bytes) on slot 1 {
  Vector4 unity_LightShadowBias at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[1], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_output_siv o0.xyzw, position
      dcl_temps 3
   0: dp3 r0.x, v1.xyzx, cb2[4].xyzx
   1: dp3 r0.y, v1.xyzx, cb2[5].xyzx
   2: dp3 r0.z, v1.xyzx, cb2[6].xyzx
   3: dp3 r0.w, r0.xyzx, r0.xyzx
   4: rsq r0.w, r0.w
   5: mul r0.xyz, r0.wwww, r0.xyzx
   6: mul r1.xyzw, v0.yyyy, cb2[1].xyzw
   7: mad r1.xyzw, cb2[0].xyzw, v0.xxxx, r1.xyzw
   8: mad r1.xyzw, cb2[2].xyzw, v0.zzzz, r1.xyzw
   9: mad r1.xyzw, cb2[3].xyzw, v0.wwww, r1.xyzw
  10: mad r2.xyz, -r1.xyzx, cb0[0].wwww, cb0[0].xyzx
  11: dp3 r0.w, r2.xyzx, r2.xyzx
  12: rsq r0.w, r0.w
  13: mul r2.xyz, r0.wwww, r2.xyzx
  14: dp3 r0.w, r0.xyzx, r2.xyzx
  15: mad r0.w, -r0.w, r0.w, l(1.000000)
  16: sqrt r0.w, r0.w
  17: mul r0.w, r0.w, cb1[5].z
  18: mad r0.xyz, -r0.xyzx, r0.wwww, r1.xyzx
  19: ne r0.w, cb1[5].z, l(0.000000)
  20: movc r0.xyz, r0.wwww, r0.xyzx, r1.xyzx
  21: mul r2.xyzw, r0.yyyy, cb3[18].xyzw
  22: mad r2.xyzw, cb3[17].xyzw, r0.xxxx, r2.xyzw
  23: mad r0.xyzw, cb3[19].xyzw, r0.zzzz, r2.xyzw
  24: mad r0.xyzw, cb3[20].xyzw, r1.wwww, r0.xyzw
  25: div r1.x, cb1[5].x, r0.w
  26: min r1.x, r1.x, l(0.000000)
  27: max r1.x, r1.x, l(-1.000000)
  28: add r0.z, r0.z, r1.x
  29: min r1.x, r0.w, r0.z
  30: mov o0.xyw, r0.xyxw
  31: add r0.x, -r0.z, r1.x
  32: mad o0.z, cb1[5].y, r0.x, r0.z
  33: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_output o0.xyzw
   0: mov o0.xyzw, l(0,0,0,0)
   1: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 27 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"

Constant Buffer "UnityLighting" (768 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityShadows" (416 bytes) on slot 1 {
  Vector4 unity_LightShadowBias at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[1], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_output_siv o0.xyzw, position
      dcl_temps 3
   0: dp3 r0.x, v1.xyzx, cb2[4].xyzx
   1: dp3 r0.y, v1.xyzx, cb2[5].xyzx
   2: dp3 r0.z, v1.xyzx, cb2[6].xyzx
   3: dp3 r0.w, r0.xyzx, r0.xyzx
   4: rsq r0.w, r0.w
   5: mul r0.xyz, r0.wwww, r0.xyzx
   6: mul r1.xyzw, v0.yyyy, cb2[1].xyzw
   7: mad r1.xyzw, cb2[0].xyzw, v0.xxxx, r1.xyzw
   8: mad r1.xyzw, cb2[2].xyzw, v0.zzzz, r1.xyzw
   9: mad r1.xyzw, cb2[3].xyzw, v0.wwww, r1.xyzw
  10: mad r2.xyz, -r1.xyzx, cb0[0].wwww, cb0[0].xyzx
  11: dp3 r0.w, r2.xyzx, r2.xyzx
  12: rsq r0.w, r0.w
  13: mul r2.xyz, r0.wwww, r2.xyzx
  14: dp3 r0.w, r0.xyzx, r2.xyzx
  15: mad r0.w, -r0.w, r0.w, l(1.000000)
  16: sqrt r0.w, r0.w
  17: mul r0.w, r0.w, cb1[5].z
  18: mad r0.xyz, -r0.xyzx, r0.wwww, r1.xyzx
  19: ne r0.w, cb1[5].z, l(0.000000)
  20: movc r0.xyz, r0.wwww, r0.xyzx, r1.xyzx
  21: mul r2.xyzw, r0.yyyy, cb3[18].xyzw
  22: mad r2.xyzw, cb3[17].xyzw, r0.xxxx, r2.xyzw
  23: mad r0.xyzw, cb3[19].xyzw, r0.zzzz, r2.xyzw
  24: mad r0.xyzw, cb3[20].xyzw, r1.wwww, r0.xyzw
  25: min r1.x, r0.w, r0.z
  26: add r1.x, -r0.z, r1.x
  27: mad o0.z, cb1[5].y, r1.x, r0.z
  28: mov o0.xyw, r0.xyxw
  29: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_output o0.xyzw
   0: mov o0.xyzw, l(0,0,0,0)
   1: ret 
// Approximately 0 instruction slots used


 }


 // Stats for Vertex shader:
 //        d3d11: 25 avg math (22..29)
 // Stats for Fragment shader:
 //        d3d11: 26 avg math (11..43), 4 avg texture (2..6), 1 avg branch (0..2)
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="DEFERRED" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul o5.xyz, r0.wwww, r0.xyzx
  27: mov o6.xyzw, l(0,0,0,0)
  28: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 11 math, 2 temp registers, 2 textures
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float       
// TEXCOORD                 3   xyzw        4     NONE   float       
// TEXCOORD                 4   xyzw        5     NONE   float   xyz 
// TEXCOORD                 5   xyzw        6     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v5.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 2
   0: sample r0.xyzw, v1.xyxx, t1.xyzw, s1
   1: add r0.x, -cb0[9].y, l(1.000000)
   2: mad o0.w, r0.y, cb0[9].y, r0.x
   3: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   4: sample r1.xyzw, v1.xyxx, t0.xyzw, s0
   5: mul r0.yzw, r1.xxyz, cb0[4].xxyz
   6: mad r1.xyz, cb0[4].xyzx, r1.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   7: mad o1.xyz, cb0[8].zzzz, r1.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   8: mul o0.xyz, r0.xxxx, r0.yzwy
   9: mov o1.w, cb0[8].w
  10: dp3 r0.x, v5.xyzx, v5.xyzx
  11: rsq r0.x, r0.x
  12: mul r0.xyz, r0.xxxx, v5.xyzx
  13: mad o2.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  14: mov o2.w, l(1.000000)
  15: mov o3.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  16: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 29 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul r0.xyz, r0.wwww, r0.xyzx
  27: mov o5.xyz, r0.xyzx
  28: mul r0.w, r0.y, r0.y
  29: mad r0.w, r0.x, r0.x, -r0.w
  30: mul r1.xyzw, r0.yzzx, r0.xyzz
  31: dp4 r0.x, cb2[42].xyzw, r1.xyzw
  32: dp4 r0.y, cb2[43].xyzw, r1.xyzw
  33: dp4 r0.z, cb2[44].xyzw, r1.xyzw
  34: mad o6.xyz, cb2[45].xyzx, r0.wwww, r0.xyzx
  35: mov o6.w, l(0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 43 math, 5 temp registers, 6 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[42], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 5
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad o1.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r0.xyz, r0.xxxx, r1.xyzx
   6: dp3 r1.x, v5.xyzx, v5.xyzx
   7: rsq r1.x, r1.x
   8: mul r1.xyz, r1.xxxx, v5.xyzx
   9: sample r2.xyzw, v1.xyxx, t1.xyzw, s2
  10: add r2.x, -cb0[9].y, l(1.000000)
  11: mad r0.w, r2.y, cb0[9].y, r2.x
  12: eq r2.x, cb2[0].x, l(1.000000)
  13: if_nz r2.x
  14:   eq r2.x, cb2[0].y, l(1.000000)
  15:   mul r2.yzw, v4.wwww, cb2[2].xxyz
  16:   mad r2.yzw, cb2[1].xxyz, v3.wwww, r2.yyzw
  17:   mad r2.yzw, cb2[3].xxyz, v5.wwww, r2.yyzw
  18:   add r2.yzw, r2.yyzw, cb2[4].xxyz
  19:   mov r3.y, v3.w
  20:   mov r3.z, v4.w
  21:   mov r3.w, v5.w
  22:   movc r2.xyz, r2.xxxx, r2.yzwy, r3.yzwy
  23:   add r2.xyz, r2.xyzx, -cb2[6].xyzx
  24:   mul r2.yzw, r2.xxyz, cb2[5].xxyz
  25:   mul r2.y, r2.y, l(0.250000)
  26:   mul r3.x, cb2[0].z, l(0.500000)
  27:   mad r3.y, -cb2[0].z, l(0.500000), l(0.250000)
  28:   max r2.y, r2.y, r3.x
  29:   min r2.x, r3.y, r2.y
  30:   sample r3.xyzw, r2.xzwx, t3.xyzw, s0
  31:   add r4.xyz, r2.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  32:   sample r4.xyzw, r4.xyzx, t3.xyzw, s0
  33:   add r2.xyz, r2.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  34:   sample r2.xyzw, r2.xyzx, t3.xyzw, s0
  35:   mov r1.w, l(1.000000)
  36:   dp4 r3.x, r3.xyzw, r1.xyzw
  37:   dp4 r3.y, r4.xyzw, r1.xyzw
  38:   dp4 r3.z, r2.xyzw, r1.xyzw
  39: else 
  40:   mov r1.w, l(1.000000)
  41:   dp4 r3.x, cb1[39].xyzw, r1.xyzw
  42:   dp4 r3.y, cb1[40].xyzw, r1.xyzw
  43:   dp4 r3.z, cb1[41].xyzw, r1.xyzw
  44: endif 
  45: add r2.xyz, r3.xyzx, v6.xyzx
  46: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  47: log r2.xyz, r2.xyzx
  48: mul r2.xyz, r2.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  49: exp r2.xyz, r2.xyzx
  50: mad r2.xyz, r2.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  51: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  52: mul r2.xyz, r0.wwww, r2.xyzx
  53: sample r3.xyzw, v1.xyxx, t2.xyzw, s3
  54: mul r3.xyz, r3.xyzx, cb0[10].xyzx
  55: mad r2.xyz, r0.xyzx, r2.xyzx, r3.xyzx
  56: exp o3.xyz, -r2.xyzx
  57: mad o2.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  58: mov o0.xyzw, r0.xyzw
  59: mov o1.w, cb0[8].w
  60: mov o2.w, l(1.000000)
  61: mov o3.w, l(1.000000)
  62: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 29 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul r0.xyz, r0.wwww, r0.xyzx
  27: mov o5.xyz, r0.xyzx
  28: mul r0.w, r0.y, r0.y
  29: mad r0.w, r0.x, r0.x, -r0.w
  30: mul r1.xyzw, r0.yzzx, r0.xyzz
  31: dp4 r0.x, cb2[42].xyzw, r1.xyzw
  32: dp4 r0.y, cb2[43].xyzw, r1.xyzw
  33: dp4 r0.z, cb2[44].xyzw, r1.xyzw
  34: mad o6.xyz, cb2[45].xyzx, r0.wwww, r0.xyzx
  35: mov o6.w, l(0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 42 math, 5 temp registers, 5 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[42], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 5
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad o1.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r0.xyz, r0.xxxx, r1.xyzx
   6: dp3 r1.x, v5.xyzx, v5.xyzx
   7: rsq r1.x, r1.x
   8: mul r1.xyz, r1.xxxx, v5.xyzx
   9: sample r2.xyzw, v1.xyxx, t1.xyzw, s2
  10: add r2.x, -cb0[9].y, l(1.000000)
  11: mad r0.w, r2.y, cb0[9].y, r2.x
  12: eq r2.x, cb2[0].x, l(1.000000)
  13: if_nz r2.x
  14:   eq r2.x, cb2[0].y, l(1.000000)
  15:   mul r2.yzw, v4.wwww, cb2[2].xxyz
  16:   mad r2.yzw, cb2[1].xxyz, v3.wwww, r2.yyzw
  17:   mad r2.yzw, cb2[3].xxyz, v5.wwww, r2.yyzw
  18:   add r2.yzw, r2.yyzw, cb2[4].xxyz
  19:   mov r3.y, v3.w
  20:   mov r3.z, v4.w
  21:   mov r3.w, v5.w
  22:   movc r2.xyz, r2.xxxx, r2.yzwy, r3.yzwy
  23:   add r2.xyz, r2.xyzx, -cb2[6].xyzx
  24:   mul r2.yzw, r2.xxyz, cb2[5].xxyz
  25:   mul r2.y, r2.y, l(0.250000)
  26:   mul r3.x, cb2[0].z, l(0.500000)
  27:   mad r3.y, -cb2[0].z, l(0.500000), l(0.250000)
  28:   max r2.y, r2.y, r3.x
  29:   min r2.x, r3.y, r2.y
  30:   sample r3.xyzw, r2.xzwx, t2.xyzw, s0
  31:   add r4.xyz, r2.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  32:   sample r4.xyzw, r4.xyzx, t2.xyzw, s0
  33:   add r2.xyz, r2.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  34:   sample r2.xyzw, r2.xyzx, t2.xyzw, s0
  35:   mov r1.w, l(1.000000)
  36:   dp4 r3.x, r3.xyzw, r1.xyzw
  37:   dp4 r3.y, r4.xyzw, r1.xyzw
  38:   dp4 r3.z, r2.xyzw, r1.xyzw
  39: else 
  40:   mov r1.w, l(1.000000)
  41:   dp4 r3.x, cb1[39].xyzw, r1.xyzw
  42:   dp4 r3.y, cb1[40].xyzw, r1.xyzw
  43:   dp4 r3.z, cb1[41].xyzw, r1.xyzw
  44: endif 
  45: add r2.xyz, r3.xyzx, v6.xyzx
  46: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  47: log r2.xyz, r2.xyzx
  48: mul r2.xyz, r2.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  49: exp r2.xyz, r2.xyzx
  50: mad r2.xyz, r2.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  51: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  52: mul r2.xyz, r0.wwww, r2.xyzx
  53: mul r2.xyz, r0.xyzx, r2.xyzx
  54: exp o3.xyz, -r2.xyzx
  55: mad o2.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  56: mov o0.xyzw, r0.xyzw
  57: mov o1.w, cb0[8].w
  58: mov o2.w, l(1.000000)
  59: mov o3.w, l(1.000000)
  60: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: _EMISSION UNITY_HDR_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul o5.xyz, r0.wwww, r0.xyzx
  27: mov o6.xyzw, l(0,0,0,0)
  28: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 12 math, 2 temp registers, 3 textures
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_EmissionMap" to slot 2

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float       
// TEXCOORD                 3   xyzw        4     NONE   float       
// TEXCOORD                 4   xyzw        5     NONE   float   xyz 
// TEXCOORD                 5   xyzw        6     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v5.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 2
   0: sample r0.xyzw, v1.xyxx, t1.xyzw, s1
   1: add r0.x, -cb0[9].y, l(1.000000)
   2: mad o0.w, r0.y, cb0[9].y, r0.x
   3: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   4: sample r1.xyzw, v1.xyxx, t0.xyzw, s0
   5: mul r0.yzw, r1.xxyz, cb0[4].xxyz
   6: mad r1.xyz, cb0[4].xyzx, r1.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   7: mad o1.xyz, cb0[8].zzzz, r1.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   8: mul o0.xyz, r0.xxxx, r0.yzwy
   9: mov o1.w, cb0[8].w
  10: dp3 r0.x, v5.xyzx, v5.xyzx
  11: rsq r0.x, r0.x
  12: mul r0.xyz, r0.xxxx, v5.xyzx
  13: mad o2.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  14: mov o2.w, l(1.000000)
  15: sample r0.xyzw, v1.xyxx, t2.xyzw, s2
  16: mul o3.xyz, r0.xyzx, cb0[10].xyzx
  17: mov o3.w, l(1.000000)
  18: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: UNITY_HDR_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul o5.xyz, r0.wwww, r0.xyzx
  27: mov o6.xyzw, l(0,0,0,0)
  28: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 11 math, 2 temp registers, 2 textures
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float       
// TEXCOORD                 3   xyzw        4     NONE   float       
// TEXCOORD                 4   xyzw        5     NONE   float   xyz 
// TEXCOORD                 5   xyzw        6     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v5.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 2
   0: sample r0.xyzw, v1.xyxx, t1.xyzw, s1
   1: add r0.x, -cb0[9].y, l(1.000000)
   2: mad o0.w, r0.y, cb0[9].y, r0.x
   3: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   4: sample r1.xyzw, v1.xyxx, t0.xyzw, s0
   5: mul r0.yzw, r1.xxyz, cb0[4].xxyz
   6: mad r1.xyz, cb0[4].xyzx, r1.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   7: mad o1.xyz, cb0[8].zzzz, r1.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   8: mul o0.xyz, r0.xxxx, r0.yzwy
   9: mov o1.w, cb0[8].w
  10: dp3 r0.x, v5.xyzx, v5.xyzx
  11: rsq r0.x, r0.x
  12: mul r0.xyz, r0.xxxx, v5.xyzx
  13: mad o2.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  14: mov o2.w, l(1.000000)
  15: mov o3.xyzw, l(0,0,0,1.000000)
  16: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH _EMISSION UNITY_HDR_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 29 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul r0.xyz, r0.wwww, r0.xyzx
  27: mov o5.xyz, r0.xyzx
  28: mul r0.w, r0.y, r0.y
  29: mad r0.w, r0.x, r0.x, -r0.w
  30: mul r1.xyzw, r0.yzzx, r0.xyzz
  31: dp4 r0.x, cb2[42].xyzw, r1.xyzw
  32: dp4 r0.y, cb2[43].xyzw, r1.xyzw
  33: dp4 r0.z, cb2[44].xyzw, r1.xyzw
  34: mad o6.xyz, cb2[45].xyzx, r0.wwww, r0.xyzx
  35: mov o6.w, l(0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 42 math, 5 temp registers, 6 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[42], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 5
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad o1.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r0.xyz, r0.xxxx, r1.xyzx
   6: dp3 r1.x, v5.xyzx, v5.xyzx
   7: rsq r1.x, r1.x
   8: mul r1.xyz, r1.xxxx, v5.xyzx
   9: sample r2.xyzw, v1.xyxx, t1.xyzw, s2
  10: add r2.x, -cb0[9].y, l(1.000000)
  11: mad r0.w, r2.y, cb0[9].y, r2.x
  12: eq r2.x, cb2[0].x, l(1.000000)
  13: if_nz r2.x
  14:   eq r2.x, cb2[0].y, l(1.000000)
  15:   mul r2.yzw, v4.wwww, cb2[2].xxyz
  16:   mad r2.yzw, cb2[1].xxyz, v3.wwww, r2.yyzw
  17:   mad r2.yzw, cb2[3].xxyz, v5.wwww, r2.yyzw
  18:   add r2.yzw, r2.yyzw, cb2[4].xxyz
  19:   mov r3.y, v3.w
  20:   mov r3.z, v4.w
  21:   mov r3.w, v5.w
  22:   movc r2.xyz, r2.xxxx, r2.yzwy, r3.yzwy
  23:   add r2.xyz, r2.xyzx, -cb2[6].xyzx
  24:   mul r2.yzw, r2.xxyz, cb2[5].xxyz
  25:   mul r2.y, r2.y, l(0.250000)
  26:   mul r3.x, cb2[0].z, l(0.500000)
  27:   mad r3.y, -cb2[0].z, l(0.500000), l(0.250000)
  28:   max r2.y, r2.y, r3.x
  29:   min r2.x, r3.y, r2.y
  30:   sample r3.xyzw, r2.xzwx, t3.xyzw, s0
  31:   add r4.xyz, r2.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  32:   sample r4.xyzw, r4.xyzx, t3.xyzw, s0
  33:   add r2.xyz, r2.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  34:   sample r2.xyzw, r2.xyzx, t3.xyzw, s0
  35:   mov r1.w, l(1.000000)
  36:   dp4 r3.x, r3.xyzw, r1.xyzw
  37:   dp4 r3.y, r4.xyzw, r1.xyzw
  38:   dp4 r3.z, r2.xyzw, r1.xyzw
  39: else 
  40:   mov r1.w, l(1.000000)
  41:   dp4 r3.x, cb1[39].xyzw, r1.xyzw
  42:   dp4 r3.y, cb1[40].xyzw, r1.xyzw
  43:   dp4 r3.z, cb1[41].xyzw, r1.xyzw
  44: endif 
  45: add r2.xyz, r3.xyzx, v6.xyzx
  46: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  47: log r2.xyz, r2.xyzx
  48: mul r2.xyz, r2.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  49: exp r2.xyz, r2.xyzx
  50: mad r2.xyz, r2.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  51: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  52: mul r2.xyz, r0.wwww, r2.xyzx
  53: sample r3.xyzw, v1.xyxx, t2.xyzw, s3
  54: mul r3.xyz, r3.xyzx, cb0[10].xyzx
  55: mad o3.xyz, r0.xyzx, r2.xyzx, r3.xyzx
  56: mad o2.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  57: mov o0.xyzw, r0.xyzw
  58: mov o1.w, cb0[8].w
  59: mov o2.w, l(1.000000)
  60: mov o3.w, l(1.000000)
  61: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: LIGHTPROBE_SH UNITY_HDR_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 29 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul r0.xyz, r0.wwww, r0.xyzx
  27: mov o5.xyz, r0.xyzx
  28: mul r0.w, r0.y, r0.y
  29: mad r0.w, r0.x, r0.x, -r0.w
  30: mul r1.xyzw, r0.yzzx, r0.xyzz
  31: dp4 r0.x, cb2[42].xyzw, r1.xyzw
  32: dp4 r0.y, cb2[43].xyzw, r1.xyzw
  33: dp4 r0.z, cb2[44].xyzw, r1.xyzw
  34: mad o6.xyz, cb2[45].xyzx, r0.wwww, r0.xyzx
  35: mov o6.w, l(0)
  36: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 41 math, 5 temp registers, 5 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[42], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 5
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad o1.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r0.xyz, r0.xxxx, r1.xyzx
   6: dp3 r1.x, v5.xyzx, v5.xyzx
   7: rsq r1.x, r1.x
   8: mul r1.xyz, r1.xxxx, v5.xyzx
   9: sample r2.xyzw, v1.xyxx, t1.xyzw, s2
  10: add r2.x, -cb0[9].y, l(1.000000)
  11: mad r0.w, r2.y, cb0[9].y, r2.x
  12: eq r2.x, cb2[0].x, l(1.000000)
  13: if_nz r2.x
  14:   eq r2.x, cb2[0].y, l(1.000000)
  15:   mul r2.yzw, v4.wwww, cb2[2].xxyz
  16:   mad r2.yzw, cb2[1].xxyz, v3.wwww, r2.yyzw
  17:   mad r2.yzw, cb2[3].xxyz, v5.wwww, r2.yyzw
  18:   add r2.yzw, r2.yyzw, cb2[4].xxyz
  19:   mov r3.y, v3.w
  20:   mov r3.z, v4.w
  21:   mov r3.w, v5.w
  22:   movc r2.xyz, r2.xxxx, r2.yzwy, r3.yzwy
  23:   add r2.xyz, r2.xyzx, -cb2[6].xyzx
  24:   mul r2.yzw, r2.xxyz, cb2[5].xxyz
  25:   mul r2.y, r2.y, l(0.250000)
  26:   mul r3.x, cb2[0].z, l(0.500000)
  27:   mad r3.y, -cb2[0].z, l(0.500000), l(0.250000)
  28:   max r2.y, r2.y, r3.x
  29:   min r2.x, r3.y, r2.y
  30:   sample r3.xyzw, r2.xzwx, t2.xyzw, s0
  31:   add r4.xyz, r2.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  32:   sample r4.xyzw, r4.xyzx, t2.xyzw, s0
  33:   add r2.xyz, r2.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  34:   sample r2.xyzw, r2.xyzx, t2.xyzw, s0
  35:   mov r1.w, l(1.000000)
  36:   dp4 r3.x, r3.xyzw, r1.xyzw
  37:   dp4 r3.y, r4.xyzw, r1.xyzw
  38:   dp4 r3.z, r2.xyzw, r1.xyzw
  39: else 
  40:   mov r1.w, l(1.000000)
  41:   dp4 r3.x, cb1[39].xyzw, r1.xyzw
  42:   dp4 r3.y, cb1[40].xyzw, r1.xyzw
  43:   dp4 r3.z, cb1[41].xyzw, r1.xyzw
  44: endif 
  45: add r2.xyz, r3.xyzx, v6.xyzx
  46: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  47: log r2.xyz, r2.xyzx
  48: mul r2.xyz, r2.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  49: exp r2.xyz, r2.xyzx
  50: mad r2.xyz, r2.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  51: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  52: mul r2.xyz, r0.wwww, r2.xyzx
  53: mul o3.xyz, r0.xyzx, r2.xyzx
  54: mad o2.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  55: mov o0.xyzw, r0.xyzw
  56: mov o1.w, cb0[8].w
  57: mov o2.w, l(1.000000)
  58: mov o3.w, l(1.000000)
  59: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 22 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyz         2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyz
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add o2.xyz, r0.xyzx, -cb1[4].xyzx
  17: mov r0.w, l(0)
  18: mov o3.xyzw, r0.wwwx
  19: mov o4.xyzw, r0.wwwy
  20: mov o5.w, r0.z
  21: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  22: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  23: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  24: dp3 r0.w, r0.xyzx, r0.xyzx
  25: rsq r0.w, r0.w
  26: mul o5.xyz, r0.wwww, r0.xyzx
  27: mov o6.xyzw, l(0,0,0,0)
  28: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 13 math, 2 temp registers, 3 textures
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_EmissionMap" to slot 2

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyz         2     NONE   float       
// TEXCOORD                 2   xyzw        3     NONE   float       
// TEXCOORD                 3   xyzw        4     NONE   float       
// TEXCOORD                 4   xyzw        5     NONE   float   xyz 
// TEXCOORD                 5   xyzw        6     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
// SV_Target                1   xyzw        1   TARGET   float   xyzw
// SV_Target                2   xyzw        2   TARGET   float   xyzw
// SV_Target                3   xyzw        3   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v5.xyz
      dcl_output o0.xyzw
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_temps 2
   0: sample r0.xyzw, v1.xyxx, t1.xyzw, s1
   1: add r0.x, -cb0[9].y, l(1.000000)
   2: mad o0.w, r0.y, cb0[9].y, r0.x
   3: mad r0.x, -cb0[8].z, l(0.779084), l(0.779084)
   4: sample r1.xyzw, v1.xyxx, t0.xyzw, s0
   5: mul r0.yzw, r1.xxyz, cb0[4].xxyz
   6: mad r1.xyz, cb0[4].xyzx, r1.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   7: mad o1.xyz, cb0[8].zzzz, r1.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   8: mul o0.xyz, r0.xxxx, r0.yzwy
   9: mov o1.w, cb0[8].w
  10: dp3 r0.x, v5.xyzx, v5.xyzx
  11: rsq r0.x, r0.x
  12: mul r0.xyz, r0.xxxx, v5.xyzx
  13: mad o2.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
  14: mov o2.w, l(1.000000)
  15: sample r0.xyzw, v1.xyxx, t2.xyzw, s2
  16: mul r0.xyz, r0.xyzx, cb0[10].xyzx
  17: exp o3.xyz, -r0.xyzx
  18: mov o3.w, l(1.000000)
  19: ret 
// Approximately 0 instruction slots used


 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //        d3d11: 36 avg math (25..63)
 // Stats for Fragment shader:
 //        d3d11: 107 avg math (51..177), 5 avg texture (4..8), 4 avg branch (2..8)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  17: dp3 r1.w, r1.xyzx, r1.xyzx
  18: rsq r1.w, r1.w
  19: mul o2.xyz, r1.wwww, r1.xyzx
  20: mov o2.w, l(0)
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  26: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  27: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  28: dp3 r0.w, r0.xyzx, r0.xyzx
  29: rsq r0.w, r0.w
  30: mul o5.xyz, r0.wwww, r0.xyzx
  31: mov o6.xyzw, l(0,0,0,0)
  32: mov o7.xyzw, l(0,0,0,0)
  33: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 51 math, 7 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_HDR at 48
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[9], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[4], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texture3d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s3
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: dp3 r1.w, v5.xyzx, v5.xyzx
   6: rsq r1.w, r1.w
   7: mul r2.xyz, r1.wwww, v5.xyzx
   8: eq r1.w, cb3[0].x, l(1.000000)
   9: if_nz r1.w
  10:   eq r1.w, cb3[0].y, l(1.000000)
  11:   mul r3.xyz, v4.wwww, cb3[2].xyzx
  12:   mad r3.xyz, cb3[1].xyzx, v3.wwww, r3.xyzx
  13:   mad r3.xyz, cb3[3].xyzx, v5.wwww, r3.xyzx
  14:   add r3.xyz, r3.xyzx, cb3[4].xyzx
  15:   mov r4.y, v3.w
  16:   mov r4.z, v4.w
  17:   mov r4.w, v5.w
  18:   movc r3.xyz, r1.wwww, r3.xyzx, r4.yzwy
  19:   add r3.xyz, r3.xyzx, -cb3[6].xyzx
  20:   mul r3.yzw, r3.xxyz, cb3[5].xxyz
  21:   mad r1.w, r3.y, l(0.250000), l(0.750000)
  22:   mad r2.w, cb3[0].z, l(0.500000), l(0.750000)
  23:   max r3.x, r1.w, r2.w
  24:   sample r3.xyzw, r3.xzwx, t4.xyzw, s1
  25: else 
  26:   mov r3.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  27: endif 
  28: dp4_sat r1.w, r3.xyzw, cb1[46].xyzw
  29: sample r3.xyzw, v1.xyxx, t1.xyzw, s4
  30: add r4.xw, -cb0[8].wwww, l(1.000000, 0.000000, 0.000000, 1.000000)
  31: dp3 r2.w, v2.xyzx, r2.xyzx
  32: add r2.w, r2.w, r2.w
  33: mad r3.xzw, r2.xxyz, -r2.wwww, v2.xxyz
  34: mul r5.xyz, r1.wwww, cb0[2].xyzx
  35: mad r1.w, -r4.x, l(0.700000), l(1.700000)
  36: mul r1.w, r1.w, r4.x
  37: mul r1.w, r1.w, l(6.000000)
  38: sample_l r6.xyzw, r3.xzwx, t3.xyzw, s0, r1.w
  39: add r1.w, r6.w, l(-1.000000)
  40: mad r1.w, cb2[3].w, r1.w, l(1.000000)
  41: mul r1.w, r1.w, cb2[3].x
  42: mul r3.xzw, r6.xxyz, r1.wwww
  43: mul r3.xyz, r3.yyyy, r3.xzwx
  44: dp3 r1.w, -v2.xyzx, r2.xyzx
  45: add r2.w, r1.w, r1.w
  46: mad r6.xyz, r2.xyzx, -r2.wwww, -v2.xyzx
  47: dp3_sat r2.x, r2.xyzx, cb1[0].xyzx
  48: mov_sat r1.w, r1.w
  49: dp3 r6.x, r6.xyzx, cb1[0].xyzx
  50: add r6.y, -r1.w, l(1.000000)
  51: mul r6.zw, r6.xxxy, r6.xxxy
  52: mul r2.yz, r6.xxyx, r6.xxwx
  53: mul r4.yz, r6.zzyz, r2.yyzy
  54: add r1.w, -r0.w, l(1.000000)
  55: add_sat r1.w, r1.w, cb0[8].w
  56: sample r6.xyzw, r4.ywyy, t2.xyzw, s2
  57: mul r2.y, r6.x, l(16.000000)
  58: mul r2.yzw, r0.xxyz, r2.yyyy
  59: mad r1.xyz, r1.xyzx, r0.wwww, r2.yzwy
  60: mul r2.xyz, r2.xxxx, r5.xyzx
  61: add r4.xyw, -r0.xyxz, r1.wwww
  62: mad r0.xyz, r4.zzzz, r4.xywx, r0.xyzx
  63: mul r0.xyz, r0.xyzx, r3.xyzx
  64: mad o0.xyz, r1.xyzx, r2.xyzx, r0.xyzx
  65: mov o0.w, l(1.000000)
  66: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 42 math, 4 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 4
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  17: dp3 r1.w, r1.xyzx, r1.xyzx
  18: rsq r1.w, r1.w
  19: mul o2.xyz, r1.wwww, r1.xyzx
  20: mov o2.w, l(0)
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r0.w, r0.xyzx, r0.xyzx
  29: rsq r0.w, r0.w
  30: mul r0.xyz, r0.wwww, r0.xyzx
  31: mov o5.xyz, r0.xyzx
  32: mul r1.x, r0.y, r0.y
  33: mad r1.x, r0.x, r0.x, -r1.x
  34: mul r2.xyzw, r0.yzzx, r0.xyzz
  35: dp4 r3.x, cb2[42].xyzw, r2.xyzw
  36: dp4 r3.y, cb2[43].xyzw, r2.xyzw
  37: dp4 r3.z, cb2[44].xyzw, r2.xyzw
  38: mad r1.xyz, cb2[45].xyzx, r1.xxxx, r3.xyzx
  39: mov r0.w, l(1.000000)
  40: dp4 r2.x, cb2[39].xyzw, r0.xyzw
  41: dp4 r2.y, cb2[40].xyzw, r0.xyzw
  42: dp4 r2.z, cb2[41].xyzw, r0.xyzw
  43: add r0.xyz, r1.xyzx, r2.xyzx
  44: max r0.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: log r0.xyz, r0.xyzx
  46: mul r0.xyz, r0.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  47: exp r0.xyz, r0.xyzx
  48: mad r0.xyz, r0.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  49: max o6.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  50: mov o6.w, l(0)
  51: mov o7.xyzw, l(0,0,0,0)
  52: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 54 math, 8 temp registers, 5 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 5
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_HDR at 48
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[4], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_sampler s5, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 8
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s3
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: eq r1.w, cb3[0].x, l(1.000000)
  10: if_nz r1.w
  11:   eq r1.w, cb3[0].y, l(1.000000)
  12:   mul r3.xyz, v4.wwww, cb3[2].xyzx
  13:   mad r3.xyz, cb3[1].xyzx, v3.wwww, r3.xyzx
  14:   mad r3.xyz, cb3[3].xyzx, v5.wwww, r3.xyzx
  15:   add r3.xyz, r3.xyzx, cb3[4].xyzx
  16:   mov r4.y, v3.w
  17:   mov r4.z, v4.w
  18:   mov r4.w, v5.w
  19:   movc r3.xyz, r1.wwww, r3.xyzx, r4.yzwy
  20:   add r3.xyz, r3.xyzx, -cb3[6].xyzx
  21:   mul r3.yzw, r3.xxyz, cb3[5].xxyz
  22:   mad r1.w, r3.y, l(0.250000), l(0.750000)
  23:   mad r2.w, cb3[0].z, l(0.500000), l(0.750000)
  24:   max r3.x, r1.w, r2.w
  25:   sample r3.xyzw, r3.xzwx, t5.xyzw, s1
  26: else 
  27:   mov r3.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  28: endif 
  29: dp4_sat r1.w, r3.xyzw, cb1[46].xyzw
  30: sample r3.xyzw, v1.xyxx, t1.xyzw, s4
  31: add r4.xw, -cb0[8].wwww, l(1.000000, 0.000000, 0.000000, 1.000000)
  32: dp3 r2.w, v2.xyzx, r2.xyzx
  33: add r2.w, r2.w, r2.w
  34: mad r3.xzw, r2.xxyz, -r2.wwww, v2.xxyz
  35: mul r5.xyz, r1.wwww, cb0[2].xyzx
  36: mul r6.xyz, r3.yyyy, v6.xyzx
  37: mad r1.w, -r4.x, l(0.700000), l(1.700000)
  38: mul r1.w, r1.w, r4.x
  39: mul r1.w, r1.w, l(6.000000)
  40: sample_l r7.xyzw, r3.xzwx, t4.xyzw, s0, r1.w
  41: add r1.w, r7.w, l(-1.000000)
  42: mad r1.w, cb2[3].w, r1.w, l(1.000000)
  43: mul r1.w, r1.w, cb2[3].x
  44: mul r3.xzw, r7.xxyz, r1.wwww
  45: mul r3.xyz, r3.yyyy, r3.xzwx
  46: dp3 r1.w, -v2.xyzx, r2.xyzx
  47: add r2.w, r1.w, r1.w
  48: mad r7.xyz, r2.xyzx, -r2.wwww, -v2.xyzx
  49: dp3_sat r2.x, r2.xyzx, cb1[0].xyzx
  50: mov_sat r1.w, r1.w
  51: dp3 r7.x, r7.xyzx, cb1[0].xyzx
  52: add r7.y, -r1.w, l(1.000000)
  53: mul r7.zw, r7.xxxy, r7.xxxy
  54: mul r2.yz, r7.xxyx, r7.xxwx
  55: mul r4.yz, r7.zzyz, r2.yyzy
  56: add r0.w, -r0.w, l(1.000000)
  57: add_sat r0.w, r0.w, cb0[8].w
  58: sample r7.xyzw, r4.ywyy, t2.xyzw, s2
  59: mul r1.w, r7.x, l(16.000000)
  60: mad r2.yzw, r1.wwww, r0.xxyz, r1.xxyz
  61: mul r4.xyw, r2.xxxx, r5.xyxz
  62: add r5.xyz, -r0.xyzx, r0.wwww
  63: mad r0.xyz, r4.zzzz, r5.xyzx, r0.xyzx
  64: mul r0.xyz, r0.xyzx, r3.xyzx
  65: mad r0.xyz, r6.xyzx, r1.xyzx, r0.xyzx
  66: mad r0.xyz, r2.yzwy, r4.xywx, r0.xyzx
  67: sample r1.xyzw, v1.xyxx, t3.xyzw, s5
  68: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
  69: mov o0.w, l(1.000000)
  70: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 42 math, 4 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 4
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  17: dp3 r1.w, r1.xyzx, r1.xyzx
  18: rsq r1.w, r1.w
  19: mul o2.xyz, r1.wwww, r1.xyzx
  20: mov o2.w, l(0)
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r0.w, r0.xyzx, r0.xyzx
  29: rsq r0.w, r0.w
  30: mul r0.xyz, r0.wwww, r0.xyzx
  31: mov o5.xyz, r0.xyzx
  32: mul r1.x, r0.y, r0.y
  33: mad r1.x, r0.x, r0.x, -r1.x
  34: mul r2.xyzw, r0.yzzx, r0.xyzz
  35: dp4 r3.x, cb2[42].xyzw, r2.xyzw
  36: dp4 r3.y, cb2[43].xyzw, r2.xyzw
  37: dp4 r3.z, cb2[44].xyzw, r2.xyzw
  38: mad r1.xyz, cb2[45].xyzx, r1.xxxx, r3.xyzx
  39: mov r0.w, l(1.000000)
  40: dp4 r2.x, cb2[39].xyzw, r0.xyzw
  41: dp4 r2.y, cb2[40].xyzw, r0.xyzw
  42: dp4 r2.z, cb2[41].xyzw, r0.xyzw
  43: add r0.xyz, r1.xyzx, r2.xyzx
  44: max r0.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: log r0.xyz, r0.xyzx
  46: mul r0.xyz, r0.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  47: exp r0.xyz, r0.xyzx
  48: mad r0.xyz, r0.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  49: max o6.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  50: mov o6.w, l(0)
  51: mov o7.xyzw, l(0,0,0,0)
  52: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 53 math, 8 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_HDR at 48
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[9], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[4], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texture3d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 8
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s3
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: eq r1.w, cb3[0].x, l(1.000000)
  10: if_nz r1.w
  11:   eq r1.w, cb3[0].y, l(1.000000)
  12:   mul r3.xyz, v4.wwww, cb3[2].xyzx
  13:   mad r3.xyz, cb3[1].xyzx, v3.wwww, r3.xyzx
  14:   mad r3.xyz, cb3[3].xyzx, v5.wwww, r3.xyzx
  15:   add r3.xyz, r3.xyzx, cb3[4].xyzx
  16:   mov r4.y, v3.w
  17:   mov r4.z, v4.w
  18:   mov r4.w, v5.w
  19:   movc r3.xyz, r1.wwww, r3.xyzx, r4.yzwy
  20:   add r3.xyz, r3.xyzx, -cb3[6].xyzx
  21:   mul r3.yzw, r3.xxyz, cb3[5].xxyz
  22:   mad r1.w, r3.y, l(0.250000), l(0.750000)
  23:   mad r2.w, cb3[0].z, l(0.500000), l(0.750000)
  24:   max r3.x, r1.w, r2.w
  25:   sample r3.xyzw, r3.xzwx, t4.xyzw, s1
  26: else 
  27:   mov r3.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  28: endif 
  29: dp4_sat r1.w, r3.xyzw, cb1[46].xyzw
  30: sample r3.xyzw, v1.xyxx, t1.xyzw, s4
  31: add r4.xw, -cb0[8].wwww, l(1.000000, 0.000000, 0.000000, 1.000000)
  32: dp3 r2.w, v2.xyzx, r2.xyzx
  33: add r2.w, r2.w, r2.w
  34: mad r3.xzw, r2.xxyz, -r2.wwww, v2.xxyz
  35: mul r5.xyz, r1.wwww, cb0[2].xyzx
  36: mul r6.xyz, r3.yyyy, v6.xyzx
  37: mad r1.w, -r4.x, l(0.700000), l(1.700000)
  38: mul r1.w, r1.w, r4.x
  39: mul r1.w, r1.w, l(6.000000)
  40: sample_l r7.xyzw, r3.xzwx, t3.xyzw, s0, r1.w
  41: add r1.w, r7.w, l(-1.000000)
  42: mad r1.w, cb2[3].w, r1.w, l(1.000000)
  43: mul r1.w, r1.w, cb2[3].x
  44: mul r3.xzw, r7.xxyz, r1.wwww
  45: mul r3.xyz, r3.yyyy, r3.xzwx
  46: dp3 r1.w, -v2.xyzx, r2.xyzx
  47: add r2.w, r1.w, r1.w
  48: mad r7.xyz, r2.xyzx, -r2.wwww, -v2.xyzx
  49: dp3_sat r2.x, r2.xyzx, cb1[0].xyzx
  50: mov_sat r1.w, r1.w
  51: dp3 r7.x, r7.xyzx, cb1[0].xyzx
  52: add r7.y, -r1.w, l(1.000000)
  53: mul r7.zw, r7.xxxy, r7.xxxy
  54: mul r2.yz, r7.xxyx, r7.xxwx
  55: mul r4.yz, r7.zzyz, r2.yyzy
  56: add r0.w, -r0.w, l(1.000000)
  57: add_sat r0.w, r0.w, cb0[8].w
  58: sample r7.xyzw, r4.ywyy, t2.xyzw, s2
  59: mul r1.w, r7.x, l(16.000000)
  60: mad r2.yzw, r1.wwww, r0.xxyz, r1.xxyz
  61: mul r4.xyw, r2.xxxx, r5.xyxz
  62: add r5.xyz, -r0.xyzx, r0.wwww
  63: mad r0.xyz, r4.zzzz, r5.xyzx, r0.xyzx
  64: mul r0.xyz, r0.xyzx, r3.xyzx
  65: mad r0.xyz, r6.xyzx, r1.xyzx, r0.xyzx
  66: mad o0.xyz, r2.yzwy, r4.xywx, r0.xyzx
  67: mov o0.w, l(1.000000)
  68: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 149 math, 13 temp registers, 5 textures, 6 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_sampler s5, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texturecube (float,float,float,float) t5
      dcl_resource_texture3d (float,float,float,float) t6
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 13
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r2.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r3.w, r5.xyzx, r5.xyzx
  22: sqrt r3.w, r3.w
  23: add r3.w, -r2.w, r3.w
  24: mad r2.w, cb3[25].w, r3.w, r2.w
  25: mad_sat r2.w, r2.w, cb3[24].z, cb3[24].w
  26: eq r3.w, cb6[0].x, l(1.000000)
  27: if_nz r3.w
  28:   eq r3.w, cb6[0].y, l(1.000000)
  29:   mul r5.xyz, v4.wwww, cb6[2].xyzx
  30:   mad r5.xyz, cb6[1].xyzx, v3.wwww, r5.xyzx
  31:   mad r5.xyz, cb6[3].xyzx, v5.wwww, r5.xyzx
  32:   add r5.xyz, r5.xyzx, cb6[4].xyzx
  33:   movc r5.xyz, r3.wwww, r5.xyzx, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r3.w, r5.y, l(0.250000), l(0.750000)
  37:   mad r4.w, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r3.w, r4.w
  39:   sample r5.xyzw, r5.xzwx, t6.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r3.w, r5.xyzw, cb2[46].xyzw
  44: div r5.xy, v7.xyxx, v7.wwww
  45: sample r5.xyzw, r5.xyxx, t1.xyzw, s5
  46: add r3.w, r3.w, -r5.x
  47: mad r2.w, r2.w, r3.w, r5.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r3.w, -cb0[9].y, l(1.000000)
  50: mad r3.w, r5.y, cb0[9].y, r3.w
  51: add r4.w, -cb0[8].w, l(1.000000)
  52: dp3 r5.x, r3.xyzx, r2.xyzx
  53: add r5.x, r5.x, r5.x
  54: mad r5.xyz, r2.xyzx, -r5.xxxx, r3.xyzx
  55: mul r6.xyz, r2.wwww, cb0[2].xyzx
  56: lt r2.w, l(0.000000), cb5[2].w
  57: if_nz r2.w
  58:   dp3 r2.w, r5.xyzx, r5.xyzx
  59:   rsq r2.w, r2.w
  60:   mul r7.xyz, r2.wwww, r5.xyzx
  61:   add r8.xyz, -r4.xyzx, cb5[0].xyzx
  62:   div r8.xyz, r8.xyzx, r7.xyzx
  63:   add r9.xyz, -r4.xyzx, cb5[1].xyzx
  64:   div r9.xyz, r9.xyzx, r7.xyzx
  65:   lt r10.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r7.xyzx
  66:   movc r8.xyz, r10.xyzx, r8.xyzx, r9.xyzx
  67:   min r2.w, r8.y, r8.x
  68:   min r2.w, r8.z, r2.w
  69:   add r8.xyz, r4.xyzx, -cb5[2].xyzx
  70:   mad r7.xyz, r7.xyzx, r2.wwww, r8.xyzx
  71: else 
  72:   mov r7.xyz, r5.xyzx
  73: endif 
  74: mad r2.w, -r4.w, l(0.700000), l(1.700000)
  75: mul r2.w, r2.w, r4.w
  76: mul r2.w, r2.w, l(6.000000)
  77: sample_l r7.xyzw, r7.xyzx, t4.xyzw, s0, r2.w
  78: add r5.w, r7.w, l(-1.000000)
  79: mad r5.w, cb5[3].w, r5.w, l(1.000000)
  80: mul r5.w, r5.w, cb5[3].x
  81: mul r8.xyz, r7.xyzx, r5.wwww
  82: lt r6.w, cb5[1].w, l(0.999990)
  83: if_nz r6.w
  84:   lt r6.w, l(0.000000), cb5[6].w
  85:   if_nz r6.w
  86:     dp3 r6.w, r5.xyzx, r5.xyzx
  87:     rsq r6.w, r6.w
  88:     mul r9.xyz, r5.xyzx, r6.wwww
  89:     add r10.xyz, -r4.xyzx, cb5[4].xyzx
  90:     div r10.xyz, r10.xyzx, r9.xyzx
  91:     add r11.xyz, -r4.xyzx, cb5[5].xyzx
  92:     div r11.xyz, r11.xyzx, r9.xyzx
  93:     lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
  94:     movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  95:     min r6.w, r10.y, r10.x
  96:     min r6.w, r10.z, r6.w
  97:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
  98:     mad r5.xyz, r9.xyzx, r6.wwww, r4.xyzx
  99:   endif 
 100:   sample_l r9.xyzw, r5.xyzx, t5.xyzw, s0, r2.w
 101:   add r2.w, r9.w, l(-1.000000)
 102:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 103:   mul r2.w, r2.w, cb5[7].x
 104:   mul r4.xyz, r9.xyzx, r2.wwww
 105:   mad r5.xyz, r5.wwww, r7.xyzx, -r4.xyzx
 106:   mad r8.xyz, cb5[1].wwww, r5.xyzx, r4.xyzx
 107: endif 
 108: mul r4.xyz, r3.wwww, r8.xyzx
 109: mad r5.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 110: dp3 r1.w, r5.xyzx, r5.xyzx
 111: max r1.w, r1.w, l(0.001000)
 112: rsq r1.w, r1.w
 113: mul r5.xyz, r1.wwww, r5.xyzx
 114: dp3 r1.w, r2.xyzx, -r3.xyzx
 115: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 116: dp3_sat r2.x, r2.xyzx, r5.xyzx
 117: dp3_sat r2.y, cb2[0].xyzx, r5.xyzx
 118: mul r2.z, r2.y, r2.y
 119: dp2 r2.z, r2.zzzz, r4.wwww
 120: add r2.z, r2.z, l(-0.500000)
 121: add r3.x, -r2.w, l(1.000000)
 122: mul r3.y, r3.x, r3.x
 123: mul r3.y, r3.y, r3.y
 124: mul r3.x, r3.x, r3.y
 125: mad r3.x, r2.z, r3.x, l(1.000000)
 126: add r3.y, -|r1.w|, l(1.000000)
 127: mul r3.z, r3.y, r3.y
 128: mul r3.z, r3.z, r3.z
 129: mul r3.y, r3.y, r3.z
 130: mad r2.z, r2.z, r3.y, l(1.000000)
 131: mul r2.z, r2.z, r3.x
 132: mul r2.z, r2.w, r2.z
 133: mul r3.x, r4.w, r4.w
 134: max r3.x, r3.x, l(0.002000)
 135: add r3.z, -r3.x, l(1.000000)
 136: mad r3.w, |r1.w|, r3.z, r3.x
 137: mad r3.z, r2.w, r3.z, r3.x
 138: mul r1.w, |r1.w|, r3.z
 139: mad r1.w, r2.w, r3.w, r1.w
 140: add r1.w, r1.w, l(0.000010)
 141: div r1.w, l(0.500000), r1.w
 142: mul r3.z, r3.x, r3.x
 143: mad r3.w, r2.x, r3.z, -r2.x
 144: mad r2.x, r3.w, r2.x, l(1.000000)
 145: mul r3.z, r3.z, l(0.318310)
 146: mad r2.x, r2.x, r2.x, l(0.000000)
 147: div r2.x, r3.z, r2.x
 148: mul r1.w, r1.w, r2.x
 149: mul r1.w, r1.w, l(3.141593)
 150: max r1.w, r1.w, l(0.000100)
 151: sqrt r1.w, r1.w
 152: mul r1.w, r2.w, r1.w
 153: mul r2.x, r3.x, l(0.280000)
 154: mad r2.x, -r2.x, r4.w, l(1.000000)
 155: dp3 r2.w, r0.xyzx, r0.xyzx
 156: ne r2.w, r2.w, l(0.000000)
 157: and r2.w, r2.w, l(0x3f800000)
 158: mul r1.w, r1.w, r2.w
 159: add r0.w, -r0.w, l(1.000000)
 160: add_sat r0.w, r0.w, cb0[8].w
 161: mul r3.xzw, r2.zzzz, r6.xxyz
 162: mul r5.xyz, r6.xyzx, r1.wwww
 163: add r1.w, -r2.y, l(1.000000)
 164: mul r2.y, r1.w, r1.w
 165: mul r2.y, r2.y, r2.y
 166: mul r1.w, r1.w, r2.y
 167: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 168: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 169: mul r2.yzw, r2.yyzw, r5.xxyz
 170: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 171: mul r2.xyz, r4.xyzx, r2.xxxx
 172: add r3.xzw, -r0.xxyz, r0.wwww
 173: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 174: mad r0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 175: sample r1.xyzw, v1.xyxx, t3.xyzw, s4
 176: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
 177: mov o0.w, l(1.000000)
 178: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 148 math, 13 temp registers, 4 textures, 6 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 13
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r2.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r3.w, r5.xyzx, r5.xyzx
  22: sqrt r3.w, r3.w
  23: add r3.w, -r2.w, r3.w
  24: mad r2.w, cb3[25].w, r3.w, r2.w
  25: mad_sat r2.w, r2.w, cb3[24].z, cb3[24].w
  26: eq r3.w, cb6[0].x, l(1.000000)
  27: if_nz r3.w
  28:   eq r3.w, cb6[0].y, l(1.000000)
  29:   mul r5.xyz, v4.wwww, cb6[2].xyzx
  30:   mad r5.xyz, cb6[1].xyzx, v3.wwww, r5.xyzx
  31:   mad r5.xyz, cb6[3].xyzx, v5.wwww, r5.xyzx
  32:   add r5.xyz, r5.xyzx, cb6[4].xyzx
  33:   movc r5.xyz, r3.wwww, r5.xyzx, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r3.w, r5.y, l(0.250000), l(0.750000)
  37:   mad r4.w, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r3.w, r4.w
  39:   sample r5.xyzw, r5.xzwx, t5.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r3.w, r5.xyzw, cb2[46].xyzw
  44: div r5.xy, v7.xyxx, v7.wwww
  45: sample r5.xyzw, r5.xyxx, t1.xyzw, s4
  46: add r3.w, r3.w, -r5.x
  47: mad r2.w, r2.w, r3.w, r5.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r3.w, -cb0[9].y, l(1.000000)
  50: mad r3.w, r5.y, cb0[9].y, r3.w
  51: add r4.w, -cb0[8].w, l(1.000000)
  52: dp3 r5.x, r3.xyzx, r2.xyzx
  53: add r5.x, r5.x, r5.x
  54: mad r5.xyz, r2.xyzx, -r5.xxxx, r3.xyzx
  55: mul r6.xyz, r2.wwww, cb0[2].xyzx
  56: lt r2.w, l(0.000000), cb5[2].w
  57: if_nz r2.w
  58:   dp3 r2.w, r5.xyzx, r5.xyzx
  59:   rsq r2.w, r2.w
  60:   mul r7.xyz, r2.wwww, r5.xyzx
  61:   add r8.xyz, -r4.xyzx, cb5[0].xyzx
  62:   div r8.xyz, r8.xyzx, r7.xyzx
  63:   add r9.xyz, -r4.xyzx, cb5[1].xyzx
  64:   div r9.xyz, r9.xyzx, r7.xyzx
  65:   lt r10.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r7.xyzx
  66:   movc r8.xyz, r10.xyzx, r8.xyzx, r9.xyzx
  67:   min r2.w, r8.y, r8.x
  68:   min r2.w, r8.z, r2.w
  69:   add r8.xyz, r4.xyzx, -cb5[2].xyzx
  70:   mad r7.xyz, r7.xyzx, r2.wwww, r8.xyzx
  71: else 
  72:   mov r7.xyz, r5.xyzx
  73: endif 
  74: mad r2.w, -r4.w, l(0.700000), l(1.700000)
  75: mul r2.w, r2.w, r4.w
  76: mul r2.w, r2.w, l(6.000000)
  77: sample_l r7.xyzw, r7.xyzx, t3.xyzw, s0, r2.w
  78: add r5.w, r7.w, l(-1.000000)
  79: mad r5.w, cb5[3].w, r5.w, l(1.000000)
  80: mul r5.w, r5.w, cb5[3].x
  81: mul r8.xyz, r7.xyzx, r5.wwww
  82: lt r6.w, cb5[1].w, l(0.999990)
  83: if_nz r6.w
  84:   lt r6.w, l(0.000000), cb5[6].w
  85:   if_nz r6.w
  86:     dp3 r6.w, r5.xyzx, r5.xyzx
  87:     rsq r6.w, r6.w
  88:     mul r9.xyz, r5.xyzx, r6.wwww
  89:     add r10.xyz, -r4.xyzx, cb5[4].xyzx
  90:     div r10.xyz, r10.xyzx, r9.xyzx
  91:     add r11.xyz, -r4.xyzx, cb5[5].xyzx
  92:     div r11.xyz, r11.xyzx, r9.xyzx
  93:     lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
  94:     movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
  95:     min r6.w, r10.y, r10.x
  96:     min r6.w, r10.z, r6.w
  97:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
  98:     mad r5.xyz, r9.xyzx, r6.wwww, r4.xyzx
  99:   endif 
 100:   sample_l r9.xyzw, r5.xyzx, t4.xyzw, s0, r2.w
 101:   add r2.w, r9.w, l(-1.000000)
 102:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 103:   mul r2.w, r2.w, cb5[7].x
 104:   mul r4.xyz, r9.xyzx, r2.wwww
 105:   mad r5.xyz, r5.wwww, r7.xyzx, -r4.xyzx
 106:   mad r8.xyz, cb5[1].wwww, r5.xyzx, r4.xyzx
 107: endif 
 108: mul r4.xyz, r3.wwww, r8.xyzx
 109: mad r5.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 110: dp3 r1.w, r5.xyzx, r5.xyzx
 111: max r1.w, r1.w, l(0.001000)
 112: rsq r1.w, r1.w
 113: mul r5.xyz, r1.wwww, r5.xyzx
 114: dp3 r1.w, r2.xyzx, -r3.xyzx
 115: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 116: dp3_sat r2.x, r2.xyzx, r5.xyzx
 117: dp3_sat r2.y, cb2[0].xyzx, r5.xyzx
 118: mul r2.z, r2.y, r2.y
 119: dp2 r2.z, r2.zzzz, r4.wwww
 120: add r2.z, r2.z, l(-0.500000)
 121: add r3.x, -r2.w, l(1.000000)
 122: mul r3.y, r3.x, r3.x
 123: mul r3.y, r3.y, r3.y
 124: mul r3.x, r3.x, r3.y
 125: mad r3.x, r2.z, r3.x, l(1.000000)
 126: add r3.y, -|r1.w|, l(1.000000)
 127: mul r3.z, r3.y, r3.y
 128: mul r3.z, r3.z, r3.z
 129: mul r3.y, r3.y, r3.z
 130: mad r2.z, r2.z, r3.y, l(1.000000)
 131: mul r2.z, r2.z, r3.x
 132: mul r2.z, r2.w, r2.z
 133: mul r3.x, r4.w, r4.w
 134: max r3.x, r3.x, l(0.002000)
 135: add r3.z, -r3.x, l(1.000000)
 136: mad r3.w, |r1.w|, r3.z, r3.x
 137: mad r3.z, r2.w, r3.z, r3.x
 138: mul r1.w, |r1.w|, r3.z
 139: mad r1.w, r2.w, r3.w, r1.w
 140: add r1.w, r1.w, l(0.000010)
 141: div r1.w, l(0.500000), r1.w
 142: mul r3.z, r3.x, r3.x
 143: mad r3.w, r2.x, r3.z, -r2.x
 144: mad r2.x, r3.w, r2.x, l(1.000000)
 145: mul r3.z, r3.z, l(0.318310)
 146: mad r2.x, r2.x, r2.x, l(0.000000)
 147: div r2.x, r3.z, r2.x
 148: mul r1.w, r1.w, r2.x
 149: mul r1.w, r1.w, l(3.141593)
 150: max r1.w, r1.w, l(0.000100)
 151: sqrt r1.w, r1.w
 152: mul r1.w, r2.w, r1.w
 153: mul r2.x, r3.x, l(0.280000)
 154: mad r2.x, -r2.x, r4.w, l(1.000000)
 155: dp3 r2.w, r0.xyzx, r0.xyzx
 156: ne r2.w, r2.w, l(0.000000)
 157: and r2.w, r2.w, l(0x3f800000)
 158: mul r1.w, r1.w, r2.w
 159: add r0.w, -r0.w, l(1.000000)
 160: add_sat r0.w, r0.w, cb0[8].w
 161: mul r3.xzw, r2.zzzz, r6.xxyz
 162: mul r5.xyz, r6.xyzx, r1.wwww
 163: add r1.w, -r2.y, l(1.000000)
 164: mul r2.y, r1.w, r1.w
 165: mul r2.y, r2.y, r2.y
 166: mul r1.w, r1.w, r2.y
 167: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 168: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 169: mul r2.yzw, r2.yyzw, r5.xxyz
 170: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 171: mul r2.xyz, r4.xyzx, r2.xxxx
 172: add r3.xzw, -r0.xxyz, r0.wwww
 173: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 174: mad o0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 175: mov o0.w, l(1.000000)
 176: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 32 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul r1.xyz, r1.wwww, r1.xyzx
  29: mov o5.xyz, r1.xyzx
  30: mul r1.w, r1.y, r1.y
  31: mad r1.w, r1.x, r1.x, -r1.w
  32: mul r2.xyzw, r1.yzzx, r1.xyzz
  33: dp4 r1.x, cb2[42].xyzw, r2.xyzw
  34: dp4 r1.y, cb2[43].xyzw, r2.xyzw
  35: dp4 r1.z, cb2[44].xyzw, r2.xyzw
  36: mad o6.xyz, cb2[45].xyzx, r1.wwww, r1.xyzx
  37: mov o6.w, l(0)
  38: mul r0.y, r0.y, cb1[5].x
  39: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  40: mov o7.zw, r0.zzzw
  41: add o7.xy, r1.zzzz, r1.xwxx
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 177 math, 15 temp registers, 8 textures, 8 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_sampler s5, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texturecube (float,float,float,float) t5
      dcl_resource_texture3d (float,float,float,float) t6
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 15
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r3.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r4.w, r5.xyzx, r5.xyzx
  22: sqrt r4.w, r4.w
  23: add r4.w, -r3.w, r4.w
  24: mad r3.w, cb3[25].w, r4.w, r3.w
  25: mad_sat r3.w, r3.w, cb3[24].z, cb3[24].w
  26: eq r4.w, cb6[0].x, l(1.000000)
  27: if_nz r4.w
  28:   eq r5.x, cb6[0].y, l(1.000000)
  29:   mul r5.yzw, v4.wwww, cb6[2].xxyz
  30:   mad r5.yzw, cb6[1].xxyz, v3.wwww, r5.yyzw
  31:   mad r5.yzw, cb6[3].xxyz, v5.wwww, r5.yyzw
  32:   add r5.yzw, r5.yyzw, cb6[4].xxyz
  33:   movc r5.xyz, r5.xxxx, r5.yzwy, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r5.y, r5.y, l(0.250000), l(0.750000)
  37:   mad r6.x, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r5.y, r6.x
  39:   sample r5.xyzw, r5.xzwx, t6.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r5.x, r5.xyzw, cb2[46].xyzw
  44: div r5.yz, v7.xxyx, v7.wwww
  45: sample r6.xyzw, r5.yzyy, t1.xyzw, s5
  46: add r5.x, r5.x, -r6.x
  47: mad r3.w, r3.w, r5.x, r6.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r5.x, -cb0[9].y, l(1.000000)
  50: mad r5.x, r5.y, cb0[9].y, r5.x
  51: add r5.y, -cb0[8].w, l(1.000000)
  52: dp3 r5.z, r3.xyzx, r2.xyzx
  53: add r5.z, r5.z, r5.z
  54: mad r6.xyz, r2.xyzx, -r5.zzzz, r3.xyzx
  55: mul r7.xyz, r3.wwww, cb0[2].xyzx
  56: if_nz r4.w
  57:   eq r3.w, cb6[0].y, l(1.000000)
  58:   mul r8.xyz, v4.wwww, cb6[2].xyzx
  59:   mad r8.xyz, cb6[1].xyzx, v3.wwww, r8.xyzx
  60:   mad r8.xyz, cb6[3].xyzx, v5.wwww, r8.xyzx
  61:   add r8.xyz, r8.xyzx, cb6[4].xyzx
  62:   movc r8.xyz, r3.wwww, r8.xyzx, r4.xyzx
  63:   add r8.xyz, r8.xyzx, -cb6[6].xyzx
  64:   mul r8.yzw, r8.xxyz, cb6[5].xxyz
  65:   mul r3.w, r8.y, l(0.250000)
  66:   mul r4.w, cb6[0].z, l(0.500000)
  67:   mad r5.z, -cb6[0].z, l(0.500000), l(0.250000)
  68:   max r3.w, r3.w, r4.w
  69:   min r8.x, r5.z, r3.w
  70:   sample r9.xyzw, r8.xzwx, t6.xyzw, s1
  71:   add r10.xyz, r8.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  72:   sample r10.xyzw, r10.xyzx, t6.xyzw, s1
  73:   add r8.xyz, r8.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  74:   sample r8.xyzw, r8.xyzx, t6.xyzw, s1
  75:   mov r2.w, l(1.000000)
  76:   dp4 r9.x, r9.xyzw, r2.xyzw
  77:   dp4 r9.y, r10.xyzw, r2.xyzw
  78:   dp4 r9.z, r8.xyzw, r2.xyzw
  79: else 
  80:   mov r2.w, l(1.000000)
  81:   dp4 r9.x, cb2[39].xyzw, r2.xyzw
  82:   dp4 r9.y, cb2[40].xyzw, r2.xyzw
  83:   dp4 r9.z, cb2[41].xyzw, r2.xyzw
  84: endif 
  85: add r8.xyz, r9.xyzx, v6.xyzx
  86: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  87: log r8.xyz, r8.xyzx
  88: mul r8.xyz, r8.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  89: exp r8.xyz, r8.xyzx
  90: mad r8.xyz, r8.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  91: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  92: lt r2.w, l(0.000000), cb5[2].w
  93: if_nz r2.w
  94:   dp3 r2.w, r6.xyzx, r6.xyzx
  95:   rsq r2.w, r2.w
  96:   mul r9.xyz, r2.wwww, r6.xyzx
  97:   add r10.xyz, -r4.xyzx, cb5[0].xyzx
  98:   div r10.xyz, r10.xyzx, r9.xyzx
  99:   add r11.xyz, -r4.xyzx, cb5[1].xyzx
 100:   div r11.xyz, r11.xyzx, r9.xyzx
 101:   lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
 102:   movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
 103:   min r2.w, r10.y, r10.x
 104:   min r2.w, r10.z, r2.w
 105:   add r10.xyz, r4.xyzx, -cb5[2].xyzx
 106:   mad r9.xyz, r9.xyzx, r2.wwww, r10.xyzx
 107: else 
 108:   mov r9.xyz, r6.xyzx
 109: endif 
 110: mad r2.w, -r5.y, l(0.700000), l(1.700000)
 111: mul r2.w, r2.w, r5.y
 112: mul r2.w, r2.w, l(6.000000)
 113: sample_l r9.xyzw, r9.xyzx, t4.xyzw, s0, r2.w
 114: add r3.w, r9.w, l(-1.000000)
 115: mad r3.w, cb5[3].w, r3.w, l(1.000000)
 116: mul r3.w, r3.w, cb5[3].x
 117: mul r10.xyz, r9.xyzx, r3.wwww
 118: lt r4.w, cb5[1].w, l(0.999990)
 119: if_nz r4.w
 120:   lt r4.w, l(0.000000), cb5[6].w
 121:   if_nz r4.w
 122:     dp3 r4.w, r6.xyzx, r6.xyzx
 123:     rsq r4.w, r4.w
 124:     mul r11.xyz, r4.wwww, r6.xyzx
 125:     add r12.xyz, -r4.xyzx, cb5[4].xyzx
 126:     div r12.xyz, r12.xyzx, r11.xyzx
 127:     add r13.xyz, -r4.xyzx, cb5[5].xyzx
 128:     div r13.xyz, r13.xyzx, r11.xyzx
 129:     lt r14.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r11.xyzx
 130:     movc r12.xyz, r14.xyzx, r12.xyzx, r13.xyzx
 131:     min r4.w, r12.y, r12.x
 132:     min r4.w, r12.z, r4.w
 133:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
 134:     mad r6.xyz, r11.xyzx, r4.wwww, r4.xyzx
 135:   endif 
 136:   sample_l r4.xyzw, r6.xyzx, t5.xyzw, s0, r2.w
 137:   add r2.w, r4.w, l(-1.000000)
 138:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 139:   mul r2.w, r2.w, cb5[7].x
 140:   mul r4.xyz, r4.xyzx, r2.wwww
 141:   mad r6.xyz, r3.wwww, r9.xyzx, -r4.xyzx
 142:   mad r10.xyz, cb5[1].wwww, r6.xyzx, r4.xyzx
 143: endif 
 144: mul r4.xyz, r5.xxxx, r10.xyzx
 145: mad r6.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 146: dp3 r1.w, r6.xyzx, r6.xyzx
 147: max r1.w, r1.w, l(0.001000)
 148: rsq r1.w, r1.w
 149: mul r6.xyz, r1.wwww, r6.xyzx
 150: dp3 r1.w, r2.xyzx, -r3.xyzx
 151: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 152: dp3_sat r2.x, r2.xyzx, r6.xyzx
 153: dp3_sat r2.y, cb2[0].xyzx, r6.xyzx
 154: mul r2.z, r2.y, r2.y
 155: dp2 r2.z, r2.zzzz, r5.yyyy
 156: add r2.z, r2.z, l(-0.500000)
 157: add r3.x, -r2.w, l(1.000000)
 158: mul r3.y, r3.x, r3.x
 159: mul r3.y, r3.y, r3.y
 160: mul r3.x, r3.x, r3.y
 161: mad r3.x, r2.z, r3.x, l(1.000000)
 162: add r3.y, -|r1.w|, l(1.000000)
 163: mul r3.z, r3.y, r3.y
 164: mul r3.z, r3.z, r3.z
 165: mul r3.y, r3.y, r3.z
 166: mad r2.z, r2.z, r3.y, l(1.000000)
 167: mul r2.z, r2.z, r3.x
 168: mul r2.z, r2.w, r2.z
 169: mul r3.x, r5.y, r5.y
 170: max r3.x, r3.x, l(0.002000)
 171: add r3.z, -r3.x, l(1.000000)
 172: mad r3.w, |r1.w|, r3.z, r3.x
 173: mad r3.z, r2.w, r3.z, r3.x
 174: mul r1.w, |r1.w|, r3.z
 175: mad r1.w, r2.w, r3.w, r1.w
 176: add r1.w, r1.w, l(0.000010)
 177: div r1.w, l(0.500000), r1.w
 178: mul r3.z, r3.x, r3.x
 179: mad r3.w, r2.x, r3.z, -r2.x
 180: mad r2.x, r3.w, r2.x, l(1.000000)
 181: mul r3.z, r3.z, l(0.318310)
 182: mad r2.x, r2.x, r2.x, l(0.000000)
 183: div r2.x, r3.z, r2.x
 184: mul r1.w, r1.w, r2.x
 185: mul r1.w, r1.w, l(3.141593)
 186: max r1.w, r1.w, l(0.000100)
 187: sqrt r1.w, r1.w
 188: mul r1.w, r2.w, r1.w
 189: mul r2.x, r3.x, l(0.280000)
 190: mad r2.x, -r2.x, r5.y, l(1.000000)
 191: dp3 r2.w, r0.xyzx, r0.xyzx
 192: ne r2.w, r2.w, l(0.000000)
 193: and r2.w, r2.w, l(0x3f800000)
 194: mul r1.w, r1.w, r2.w
 195: add r0.w, -r0.w, l(1.000000)
 196: add_sat r0.w, r0.w, cb0[8].w
 197: mul r3.xzw, r2.zzzz, r7.xxyz
 198: mad r3.xzw, r8.xxyz, r5.xxxx, r3.xxzw
 199: mul r5.xyz, r7.xyzx, r1.wwww
 200: add r1.w, -r2.y, l(1.000000)
 201: mul r2.y, r1.w, r1.w
 202: mul r2.y, r2.y, r2.y
 203: mul r1.w, r1.w, r2.y
 204: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 205: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 206: mul r2.yzw, r2.yyzw, r5.xxyz
 207: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 208: mul r2.xyz, r4.xyzx, r2.xxxx
 209: add r3.xzw, -r0.xxyz, r0.wwww
 210: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 211: mad r0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 212: sample r1.xyzw, v1.xyxx, t3.xyzw, s4
 213: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
 214: mov o0.w, l(1.000000)
 215: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 32 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul r1.xyz, r1.wwww, r1.xyzx
  29: mov o5.xyz, r1.xyzx
  30: mul r1.w, r1.y, r1.y
  31: mad r1.w, r1.x, r1.x, -r1.w
  32: mul r2.xyzw, r1.yzzx, r1.xyzz
  33: dp4 r1.x, cb2[42].xyzw, r2.xyzw
  34: dp4 r1.y, cb2[43].xyzw, r2.xyzw
  35: dp4 r1.z, cb2[44].xyzw, r2.xyzw
  36: mad o6.xyz, cb2[45].xyzx, r1.wwww, r1.xyzx
  37: mov o6.w, l(0)
  38: mul r0.y, r0.y, cb1[5].x
  39: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  40: mov o7.zw, r0.zzzw
  41: add o7.xy, r1.zzzz, r1.xwxx
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 176 math, 15 temp registers, 7 textures, 8 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Float _OcclusionStrength at 148
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 5 {
  Vector4 unity_SpecCube0_BoxMax at 0
  Vector4 unity_SpecCube0_BoxMin at 16
  Vector4 unity_SpecCube0_ProbePosition at 32
  Vector4 unity_SpecCube0_HDR at 48
  Vector4 unity_SpecCube1_BoxMax at 64
  Vector4 unity_SpecCube1_BoxMin at 80
  Vector4 unity_SpecCube1_ProbePosition at 96
  Vector4 unity_SpecCube1_HDR at 112
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 6 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[8], immediateIndexed
      dcl_constantbuffer CB6[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 15
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r1.w, v5.xyzx, v5.xyzx
   7: rsq r1.w, r1.w
   8: mul r2.xyz, r1.wwww, v5.xyzx
   9: dp3 r1.w, v2.xyzx, v2.xyzx
  10: rsq r1.w, r1.w
  11: mul r3.xyz, r1.wwww, v2.xyzx
  12: mov r4.x, v3.w
  13: mov r4.y, v4.w
  14: mov r4.z, v5.w
  15: add r5.xyz, -r4.xyzx, cb1[4].xyzx
  16: mov r6.x, cb4[9].z
  17: mov r6.y, cb4[10].z
  18: mov r6.z, cb4[11].z
  19: dp3 r3.w, r5.xyzx, r6.xyzx
  20: add r5.xyz, r4.xyzx, -cb3[25].xyzx
  21: dp3 r4.w, r5.xyzx, r5.xyzx
  22: sqrt r4.w, r4.w
  23: add r4.w, -r3.w, r4.w
  24: mad r3.w, cb3[25].w, r4.w, r3.w
  25: mad_sat r3.w, r3.w, cb3[24].z, cb3[24].w
  26: eq r4.w, cb6[0].x, l(1.000000)
  27: if_nz r4.w
  28:   eq r5.x, cb6[0].y, l(1.000000)
  29:   mul r5.yzw, v4.wwww, cb6[2].xxyz
  30:   mad r5.yzw, cb6[1].xxyz, v3.wwww, r5.yyzw
  31:   mad r5.yzw, cb6[3].xxyz, v5.wwww, r5.yyzw
  32:   add r5.yzw, r5.yyzw, cb6[4].xxyz
  33:   movc r5.xyz, r5.xxxx, r5.yzwy, r4.xyzx
  34:   add r5.xyz, r5.xyzx, -cb6[6].xyzx
  35:   mul r5.yzw, r5.xxyz, cb6[5].xxyz
  36:   mad r5.y, r5.y, l(0.250000), l(0.750000)
  37:   mad r6.x, cb6[0].z, l(0.500000), l(0.750000)
  38:   max r5.x, r5.y, r6.x
  39:   sample r5.xyzw, r5.xzwx, t5.xyzw, s1
  40: else 
  41:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  42: endif 
  43: dp4_sat r5.x, r5.xyzw, cb2[46].xyzw
  44: div r5.yz, v7.xxyx, v7.wwww
  45: sample r6.xyzw, r5.yzyy, t1.xyzw, s4
  46: add r5.x, r5.x, -r6.x
  47: mad r3.w, r3.w, r5.x, r6.x
  48: sample r5.xyzw, v1.xyxx, t2.xyzw, s3
  49: add r5.x, -cb0[9].y, l(1.000000)
  50: mad r5.x, r5.y, cb0[9].y, r5.x
  51: add r5.y, -cb0[8].w, l(1.000000)
  52: dp3 r5.z, r3.xyzx, r2.xyzx
  53: add r5.z, r5.z, r5.z
  54: mad r6.xyz, r2.xyzx, -r5.zzzz, r3.xyzx
  55: mul r7.xyz, r3.wwww, cb0[2].xyzx
  56: if_nz r4.w
  57:   eq r3.w, cb6[0].y, l(1.000000)
  58:   mul r8.xyz, v4.wwww, cb6[2].xyzx
  59:   mad r8.xyz, cb6[1].xyzx, v3.wwww, r8.xyzx
  60:   mad r8.xyz, cb6[3].xyzx, v5.wwww, r8.xyzx
  61:   add r8.xyz, r8.xyzx, cb6[4].xyzx
  62:   movc r8.xyz, r3.wwww, r8.xyzx, r4.xyzx
  63:   add r8.xyz, r8.xyzx, -cb6[6].xyzx
  64:   mul r8.yzw, r8.xxyz, cb6[5].xxyz
  65:   mul r3.w, r8.y, l(0.250000)
  66:   mul r4.w, cb6[0].z, l(0.500000)
  67:   mad r5.z, -cb6[0].z, l(0.500000), l(0.250000)
  68:   max r3.w, r3.w, r4.w
  69:   min r8.x, r5.z, r3.w
  70:   sample r9.xyzw, r8.xzwx, t5.xyzw, s1
  71:   add r10.xyz, r8.xzwx, l(0.250000, 0.000000, 0.000000, 0.000000)
  72:   sample r10.xyzw, r10.xyzx, t5.xyzw, s1
  73:   add r8.xyz, r8.xzwx, l(0.500000, 0.000000, 0.000000, 0.000000)
  74:   sample r8.xyzw, r8.xyzx, t5.xyzw, s1
  75:   mov r2.w, l(1.000000)
  76:   dp4 r9.x, r9.xyzw, r2.xyzw
  77:   dp4 r9.y, r10.xyzw, r2.xyzw
  78:   dp4 r9.z, r8.xyzw, r2.xyzw
  79: else 
  80:   mov r2.w, l(1.000000)
  81:   dp4 r9.x, cb2[39].xyzw, r2.xyzw
  82:   dp4 r9.y, cb2[40].xyzw, r2.xyzw
  83:   dp4 r9.z, cb2[41].xyzw, r2.xyzw
  84: endif 
  85: add r8.xyz, r9.xyzx, v6.xyzx
  86: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  87: log r8.xyz, r8.xyzx
  88: mul r8.xyz, r8.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  89: exp r8.xyz, r8.xyzx
  90: mad r8.xyz, r8.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  91: max r8.xyz, r8.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  92: lt r2.w, l(0.000000), cb5[2].w
  93: if_nz r2.w
  94:   dp3 r2.w, r6.xyzx, r6.xyzx
  95:   rsq r2.w, r2.w
  96:   mul r9.xyz, r2.wwww, r6.xyzx
  97:   add r10.xyz, -r4.xyzx, cb5[0].xyzx
  98:   div r10.xyz, r10.xyzx, r9.xyzx
  99:   add r11.xyz, -r4.xyzx, cb5[1].xyzx
 100:   div r11.xyz, r11.xyzx, r9.xyzx
 101:   lt r12.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r9.xyzx
 102:   movc r10.xyz, r12.xyzx, r10.xyzx, r11.xyzx
 103:   min r2.w, r10.y, r10.x
 104:   min r2.w, r10.z, r2.w
 105:   add r10.xyz, r4.xyzx, -cb5[2].xyzx
 106:   mad r9.xyz, r9.xyzx, r2.wwww, r10.xyzx
 107: else 
 108:   mov r9.xyz, r6.xyzx
 109: endif 
 110: mad r2.w, -r5.y, l(0.700000), l(1.700000)
 111: mul r2.w, r2.w, r5.y
 112: mul r2.w, r2.w, l(6.000000)
 113: sample_l r9.xyzw, r9.xyzx, t3.xyzw, s0, r2.w
 114: add r3.w, r9.w, l(-1.000000)
 115: mad r3.w, cb5[3].w, r3.w, l(1.000000)
 116: mul r3.w, r3.w, cb5[3].x
 117: mul r10.xyz, r9.xyzx, r3.wwww
 118: lt r4.w, cb5[1].w, l(0.999990)
 119: if_nz r4.w
 120:   lt r4.w, l(0.000000), cb5[6].w
 121:   if_nz r4.w
 122:     dp3 r4.w, r6.xyzx, r6.xyzx
 123:     rsq r4.w, r4.w
 124:     mul r11.xyz, r4.wwww, r6.xyzx
 125:     add r12.xyz, -r4.xyzx, cb5[4].xyzx
 126:     div r12.xyz, r12.xyzx, r11.xyzx
 127:     add r13.xyz, -r4.xyzx, cb5[5].xyzx
 128:     div r13.xyz, r13.xyzx, r11.xyzx
 129:     lt r14.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r11.xyzx
 130:     movc r12.xyz, r14.xyzx, r12.xyzx, r13.xyzx
 131:     min r4.w, r12.y, r12.x
 132:     min r4.w, r12.z, r4.w
 133:     add r4.xyz, r4.xyzx, -cb5[6].xyzx
 134:     mad r6.xyz, r11.xyzx, r4.wwww, r4.xyzx
 135:   endif 
 136:   sample_l r4.xyzw, r6.xyzx, t4.xyzw, s0, r2.w
 137:   add r2.w, r4.w, l(-1.000000)
 138:   mad r2.w, cb5[7].w, r2.w, l(1.000000)
 139:   mul r2.w, r2.w, cb5[7].x
 140:   mul r4.xyz, r4.xyzx, r2.wwww
 141:   mad r6.xyz, r3.wwww, r9.xyzx, -r4.xyzx
 142:   mad r10.xyz, cb5[1].wwww, r6.xyzx, r4.xyzx
 143: endif 
 144: mul r4.xyz, r5.xxxx, r10.xyzx
 145: mad r6.xyz, -v2.xyzx, r1.wwww, cb2[0].xyzx
 146: dp3 r1.w, r6.xyzx, r6.xyzx
 147: max r1.w, r1.w, l(0.001000)
 148: rsq r1.w, r1.w
 149: mul r6.xyz, r1.wwww, r6.xyzx
 150: dp3 r1.w, r2.xyzx, -r3.xyzx
 151: dp3_sat r2.w, r2.xyzx, cb2[0].xyzx
 152: dp3_sat r2.x, r2.xyzx, r6.xyzx
 153: dp3_sat r2.y, cb2[0].xyzx, r6.xyzx
 154: mul r2.z, r2.y, r2.y
 155: dp2 r2.z, r2.zzzz, r5.yyyy
 156: add r2.z, r2.z, l(-0.500000)
 157: add r3.x, -r2.w, l(1.000000)
 158: mul r3.y, r3.x, r3.x
 159: mul r3.y, r3.y, r3.y
 160: mul r3.x, r3.x, r3.y
 161: mad r3.x, r2.z, r3.x, l(1.000000)
 162: add r3.y, -|r1.w|, l(1.000000)
 163: mul r3.z, r3.y, r3.y
 164: mul r3.z, r3.z, r3.z
 165: mul r3.y, r3.y, r3.z
 166: mad r2.z, r2.z, r3.y, l(1.000000)
 167: mul r2.z, r2.z, r3.x
 168: mul r2.z, r2.w, r2.z
 169: mul r3.x, r5.y, r5.y
 170: max r3.x, r3.x, l(0.002000)
 171: add r3.z, -r3.x, l(1.000000)
 172: mad r3.w, |r1.w|, r3.z, r3.x
 173: mad r3.z, r2.w, r3.z, r3.x
 174: mul r1.w, |r1.w|, r3.z
 175: mad r1.w, r2.w, r3.w, r1.w
 176: add r1.w, r1.w, l(0.000010)
 177: div r1.w, l(0.500000), r1.w
 178: mul r3.z, r3.x, r3.x
 179: mad r3.w, r2.x, r3.z, -r2.x
 180: mad r2.x, r3.w, r2.x, l(1.000000)
 181: mul r3.z, r3.z, l(0.318310)
 182: mad r2.x, r2.x, r2.x, l(0.000000)
 183: div r2.x, r3.z, r2.x
 184: mul r1.w, r1.w, r2.x
 185: mul r1.w, r1.w, l(3.141593)
 186: max r1.w, r1.w, l(0.000100)
 187: sqrt r1.w, r1.w
 188: mul r1.w, r2.w, r1.w
 189: mul r2.x, r3.x, l(0.280000)
 190: mad r2.x, -r2.x, r5.y, l(1.000000)
 191: dp3 r2.w, r0.xyzx, r0.xyzx
 192: ne r2.w, r2.w, l(0.000000)
 193: and r2.w, r2.w, l(0x3f800000)
 194: mul r1.w, r1.w, r2.w
 195: add r0.w, -r0.w, l(1.000000)
 196: add_sat r0.w, r0.w, cb0[8].w
 197: mul r3.xzw, r2.zzzz, r7.xxyz
 198: mad r3.xzw, r8.xxyz, r5.xxxx, r3.xxzw
 199: mul r5.xyz, r7.xyzx, r1.wwww
 200: add r1.w, -r2.y, l(1.000000)
 201: mul r2.y, r1.w, r1.w
 202: mul r2.y, r2.y, r2.y
 203: mul r1.w, r1.w, r2.y
 204: add r2.yzw, -r0.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
 205: mad r2.yzw, r2.yyzw, r1.wwww, r0.xxyz
 206: mul r2.yzw, r2.yyzw, r5.xxyz
 207: mad r1.xyz, r1.xyzx, r3.xzwx, r2.yzwy
 208: mul r2.xyz, r4.xyzx, r2.xxxx
 209: add r3.xzw, -r0.xxyz, r0.wwww
 210: mad r0.xyz, r3.yyyy, r3.xzwx, r0.xyzx
 211: mad o0.xyz, r2.xyzx, r0.xyzx, r1.xyzx
 212: mov o0.w, l(1.000000)
 213: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION 
-- Vertex shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 52 math, 7 temp registers, 5 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 5
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
  Vector4 _EmissionColor at 160
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityReflectionProbes" (128 bytes) on slot 2 {
  Vector4 unity_SpecCube0_HDR at 48
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 3 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float       
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[11], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[4], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_sampler s5, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_resource_texture3d (float,float,float,float) t5
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s3
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: dp3 r1.w, v5.xyzx, v5.xyzx
   6: rsq r1.w, r1.w
   7: mul r2.xyz, r1.wwww, v5.xyzx
   8: eq r1.w, cb3[0].x, l(1.000000)
   9: if_nz r1.w
  10:   eq r1.w, cb3[0].y, l(1.000000)
  11:   mul r3.xyz, v4.wwww, cb3[2].xyzx
  12:   mad r3.xyz, cb3[1].xyzx, v3.wwww, r3.xyzx
  13:   mad r3.xyz, cb3[3].xyzx, v5.wwww, r3.xyzx
  14:   add r3.xyz, r3.xyzx, cb3[4].xyzx
  15:   mov r4.y, v3.w
  16:   mov r4.z, v4.w
  17:   mov r4.w, v5.w
  18:   movc r3.xyz, r1.wwww, r3.xyzx, r4.yzwy
  19:   add r3.xyz, r3.xyzx, -cb3[6].xyzx
  20:   mul r3.yzw, r3.xxyz, cb3[5].xxyz
  21:   mad r1.w, r3.y, l(0.250000), l(0.750000)
  22:   mad r2.w, cb3[0].z, l(0.500000), l(0.750000)
  23:   max r3.x, r1.w, r2.w
  24:   sample r3.xyzw, r3.xzwx, t5.xyzw, s1
  25: else 
  26:   mov r3.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  27: endif 
  28: dp4_sat r1.w, r3.xyzw, cb1[46].xyzw
  29: sample r3.xyzw, v1.xyxx, t1.xyzw, s4
  30: add r4.xw, -cb0[8].wwww, l(1.000000, 0.000000, 0.000000, 1.000000)
  31: dp3 r2.w, v2.xyzx, r2.xyzx
  32: add r2.w, r2.w, r2.w
  33: mad r3.xzw, r2.xxyz, -r2.wwww, v2.xxyz
  34: mul r5.xyz, r1.wwww, cb0[2].xyzx
  35: mad r1.w, -r4.x, l(0.700000), l(1.700000)
  36: mul r1.w, r1.w, r4.x
  37: mul r1.w, r1.w, l(6.000000)
  38: sample_l r6.xyzw, r3.xzwx, t4.xyzw, s0, r1.w
  39: add r1.w, r6.w, l(-1.000000)
  40: mad r1.w, cb2[3].w, r1.w, l(1.000000)
  41: mul r1.w, r1.w, cb2[3].x
  42: mul r3.xzw, r6.xxyz, r1.wwww
  43: mul r3.xyz, r3.yyyy, r3.xzwx
  44: dp3 r1.w, -v2.xyzx, r2.xyzx
  45: add r2.w, r1.w, r1.w
  46: mad r6.xyz, r2.xyzx, -r2.wwww, -v2.xyzx
  47: dp3_sat r2.x, r2.xyzx, cb1[0].xyzx
  48: mov_sat r1.w, r1.w
  49: dp3 r6.x, r6.xyzx, cb1[0].xyzx
  50: add r6.y, -r1.w, l(1.000000)
  51: mul r6.zw, r6.xxxy, r6.xxxy
  52: mul r2.yz, r6.xxyx, r6.xxwx
  53: mul r4.yz, r6.zzyz, r2.yyzy
  54: add r1.w, -r0.w, l(1.000000)
  55: add_sat r1.w, r1.w, cb0[8].w
  56: sample r6.xyzw, r4.ywyy, t2.xyzw, s2
  57: mul r2.y, r6.x, l(16.000000)
  58: mul r2.yzw, r0.xxyz, r2.yyyy
  59: mad r1.xyz, r1.xyzx, r0.wwww, r2.yzwy
  60: mul r2.xyz, r2.xxxx, r5.xyzx
  61: add r4.xyw, -r0.xyxz, r1.wwww
  62: mad r0.xyz, r4.zzzz, r4.xywx, r0.xyzx
  63: mul r0.xyz, r0.xyzx, r3.xyzx
  64: mad r0.xyz, r1.xyzx, r2.xyzx, r0.xyzx
  65: sample r1.xyzw, v1.xyxx, t3.xyzw, s5
  66: mad o0.xyz, r1.xyzx, cb0[10].xyzx, r0.xyzx
  67: mov o0.w, l(1.000000)
  68: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  17: dp3 r1.w, r1.xyzx, r1.xyzx
  18: rsq r1.w, r1.w
  19: mul o2.xyz, r1.wwww, r1.xyzx
  20: mov o2.w, l(0)
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  26: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  27: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  28: dp3 r0.w, r0.xyzx, r0.xyzx
  29: rsq r0.w, r0.w
  30: mul o5.xyz, r0.wwww, r0.xyzx
  31: mov o6.xyzw, l(0,0,0,0)
  32: mov o7.xyzw, l(0,0,0,0)
  33: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  17: dp3 r1.w, r1.xyzx, r1.xyzx
  18: rsq r1.w, r1.w
  19: mul o2.xyz, r1.wwww, r1.xyzx
  20: mov o2.w, l(0)
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  26: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  27: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  28: dp3 r0.w, r0.xyzx, r0.xyzx
  29: rsq r0.w, r0.w
  30: mul o5.xyz, r0.wwww, r0.xyzx
  31: mov o6.xyzw, l(0,0,0,0)
  32: mov o7.xyzw, l(0,0,0,0)
  33: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 63 math, 6 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 6
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  17: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r1.xyzx, r1.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r1.xyzx
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r0.w, r1.xyzx, r1.xyzx
  29: rsq r0.w, r0.w
  30: mul r1.xyz, r0.wwww, r1.xyzx
  31: mov o5.xyz, r1.xyzx
  32: mul r0.w, r1.y, r1.y
  33: mad r0.w, r1.x, r1.x, -r0.w
  34: mul r2.xyzw, r1.yzzx, r1.xyzz
  35: dp4 r3.x, cb2[42].xyzw, r2.xyzw
  36: dp4 r3.y, cb2[43].xyzw, r2.xyzw
  37: dp4 r3.z, cb2[44].xyzw, r2.xyzw
  38: mad r2.xyz, cb2[45].xyzx, r0.wwww, r3.xyzx
  39: mov r1.w, l(1.000000)
  40: dp4 r3.x, cb2[39].xyzw, r1.xyzw
  41: dp4 r3.y, cb2[40].xyzw, r1.xyzw
  42: dp4 r3.z, cb2[41].xyzw, r1.xyzw
  43: add r2.xyz, r2.xyzx, r3.xyzx
  44: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: log r2.xyz, r2.xyzx
  46: mul r2.xyz, r2.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  47: exp r2.xyz, r2.xyzx
  48: mad r2.xyz, r2.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  49: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  50: add r3.xyzw, -r0.yyyy, cb2[4].xyzw
  51: mul r4.xyzw, r1.yyyy, r3.xyzw
  52: mul r3.xyzw, r3.xyzw, r3.xyzw
  53: add r5.xyzw, -r0.xxxx, cb2[3].xyzw
  54: add r0.xyzw, -r0.zzzz, cb2[5].xyzw
  55: mad r4.xyzw, r5.xyzw, r1.xxxx, r4.xyzw
  56: mad r1.xyzw, r0.xyzw, r1.zzzz, r4.xyzw
  57: mad r3.xyzw, r5.xyzw, r5.xyzw, r3.xyzw
  58: mad r0.xyzw, r0.xyzw, r0.xyzw, r3.xyzw
  59: max r0.xyzw, r0.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  60: rsq r3.xyzw, r0.xyzw
  61: mad r0.xyzw, r0.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  62: div r0.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r0.xyzw
  63: mul r1.xyzw, r1.xyzw, r3.xyzw
  64: max r1.xyzw, r1.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  65: mul r0.xyzw, r0.xyzw, r1.xyzw
  66: mul r1.xyz, r0.yyyy, cb2[8].xyzx
  67: mad r1.xyz, cb2[7].xyzx, r0.xxxx, r1.xyzx
  68: mad r0.xyz, cb2[9].xyzx, r0.zzzz, r1.xyzx
  69: mad r0.xyz, cb2[10].xyzx, r0.wwww, r0.xyzx
  70: add o6.xyz, r2.xyzx, r0.xyzx
  71: mov o6.w, l(0)
  72: mov o7.xyzw, l(0,0,0,0)
  73: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 63 math, 6 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHAr at 624
  Vector4 unity_SHAg at 640
  Vector4 unity_SHAb at 656
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 6
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mov o2.w, l(0)
  13: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  15: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  16: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  17: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r1.xyzx, r1.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r1.xyzx
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r0.w, r1.xyzx, r1.xyzx
  29: rsq r0.w, r0.w
  30: mul r1.xyz, r0.wwww, r1.xyzx
  31: mov o5.xyz, r1.xyzx
  32: mul r0.w, r1.y, r1.y
  33: mad r0.w, r1.x, r1.x, -r0.w
  34: mul r2.xyzw, r1.yzzx, r1.xyzz
  35: dp4 r3.x, cb2[42].xyzw, r2.xyzw
  36: dp4 r3.y, cb2[43].xyzw, r2.xyzw
  37: dp4 r3.z, cb2[44].xyzw, r2.xyzw
  38: mad r2.xyz, cb2[45].xyzx, r0.wwww, r3.xyzx
  39: mov r1.w, l(1.000000)
  40: dp4 r3.x, cb2[39].xyzw, r1.xyzw
  41: dp4 r3.y, cb2[40].xyzw, r1.xyzw
  42: dp4 r3.z, cb2[41].xyzw, r1.xyzw
  43: add r2.xyz, r2.xyzx, r3.xyzx
  44: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: log r2.xyz, r2.xyzx
  46: mul r2.xyz, r2.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
  47: exp r2.xyz, r2.xyzx
  48: mad r2.xyz, r2.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
  49: max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  50: add r3.xyzw, -r0.yyyy, cb2[4].xyzw
  51: mul r4.xyzw, r1.yyyy, r3.xyzw
  52: mul r3.xyzw, r3.xyzw, r3.xyzw
  53: add r5.xyzw, -r0.xxxx, cb2[3].xyzw
  54: add r0.xyzw, -r0.zzzz, cb2[5].xyzw
  55: mad r4.xyzw, r5.xyzw, r1.xxxx, r4.xyzw
  56: mad r1.xyzw, r0.xyzw, r1.zzzz, r4.xyzw
  57: mad r3.xyzw, r5.xyzw, r5.xyzw, r3.xyzw
  58: mad r0.xyzw, r0.xyzw, r0.xyzw, r3.xyzw
  59: max r0.xyzw, r0.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  60: rsq r3.xyzw, r0.xyzw
  61: mad r0.xyzw, r0.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  62: div r0.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r0.xyzw
  63: mul r1.xyzw, r1.xyzw, r3.xyzw
  64: max r1.xyzw, r1.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  65: mul r0.xyzw, r0.xyzw, r1.xyzw
  66: mul r1.xyz, r0.yyyy, cb2[8].xyzx
  67: mad r1.xyz, cb2[7].xyzx, r0.xxxx, r1.xyzx
  68: mad r0.xyz, cb2[9].xyzx, r0.zzzz, r1.xyzx
  69: mad r0.xyz, cb2[10].xyzx, r0.wwww, r0.xyzx
  70: add o6.xyz, r2.xyzx, r0.xyzx
  71: mov o6.w, l(0)
  72: mov o7.xyzw, l(0,0,0,0)
  73: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb2[1].xyzx
  15: mad r1.xyz, cb2[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb2[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb2[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r1.x, v1.xyzx, cb2[4].xyzx
  24: dp3 r1.y, v1.xyzx, cb2[5].xyzx
  25: dp3 r1.z, v1.xyzx, cb2[6].xyzx
  26: dp3 r1.w, r1.xyzx, r1.xyzx
  27: rsq r1.w, r1.w
  28: mul o5.xyz, r1.wwww, r1.xyzx
  29: mov o6.xyzw, l(0,0,0,0)
  30: mul r0.y, r0.y, cb1[5].x
  31: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  32: mov o7.zw, r0.zzzw
  33: add o7.xy, r1.zzzz, r1.xwxx
  34: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH _EMISSION VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 55 math, 6 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 6
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r2.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r2.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r2.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r2.xyzx, r2.xyzx
  27: rsq r1.w, r1.w
  28: mul r2.xyz, r1.wwww, r2.xyzx
  29: mov o5.xyz, r2.xyzx
  30: add r3.xyzw, -r1.xxxx, cb2[3].xyzw
  31: add r4.xyzw, -r1.yyyy, cb2[4].xyzw
  32: add r1.xyzw, -r1.zzzz, cb2[5].xyzw
  33: mul r5.xyzw, r2.yyyy, r4.xyzw
  34: mul r4.xyzw, r4.xyzw, r4.xyzw
  35: mad r4.xyzw, r3.xyzw, r3.xyzw, r4.xyzw
  36: mad r3.xyzw, r3.xyzw, r2.xxxx, r5.xyzw
  37: mad r3.xyzw, r1.xyzw, r2.zzzz, r3.xyzw
  38: mad r1.xyzw, r1.xyzw, r1.xyzw, r4.xyzw
  39: max r1.xyzw, r1.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  40: rsq r4.xyzw, r1.xyzw
  41: mad r1.xyzw, r1.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  42: div r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyzw
  43: mul r3.xyzw, r3.xyzw, r4.xyzw
  44: max r3.xyzw, r3.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: mul r1.xyzw, r1.xyzw, r3.xyzw
  46: mul r3.xyz, r1.yyyy, cb2[8].xyzx
  47: mad r3.xyz, cb2[7].xyzx, r1.xxxx, r3.xyzx
  48: mad r1.xyz, cb2[9].xyzx, r1.zzzz, r3.xyzx
  49: mad r1.xyz, cb2[10].xyzx, r1.wwww, r1.xyzx
  50: mad r3.xyz, r1.xyzx, l(0.305306, 0.305306, 0.305306, 0.000000), l(0.682171, 0.682171, 0.682171, 0.000000)
  51: mad r3.xyz, r1.xyzx, r3.xyzx, l(0.012523, 0.012523, 0.012523, 0.000000)
  52: mul r1.w, r2.y, r2.y
  53: mad r1.w, r2.x, r2.x, -r1.w
  54: mul r2.xyzw, r2.yzzx, r2.xyzz
  55: dp4 r4.x, cb2[42].xyzw, r2.xyzw
  56: dp4 r4.y, cb2[43].xyzw, r2.xyzw
  57: dp4 r4.z, cb2[44].xyzw, r2.xyzw
  58: mad r2.xyz, cb2[45].xyzx, r1.wwww, r4.xyzx
  59: mad o6.xyz, r1.xyzx, r3.xyzx, r2.xyzx
  60: mov o6.w, l(0)
  61: mul r0.y, r0.y, cb1[5].x
  62: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  63: mov o7.zw, r0.zzzw
  64: add o7.xy, r1.zzzz, r1.xwxx
  65: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN LIGHTPROBE_SH VERTEXLIGHT_ON 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 55 math, 6 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_4LightPosX0 at 48
  Vector4 unity_4LightPosY0 at 64
  Vector4 unity_4LightPosZ0 at 80
  Vector4 unity_4LightAtten0 at 96
  Vector4 unity_LightColor[8] at 112
  Vector4 unity_SHBr at 672
  Vector4 unity_SHBg at 688
  Vector4 unity_SHBb at 704
  Vector4 unity_SHC at 720
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[46], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 6
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mov o2.w, l(0)
  14: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  16: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  17: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  18: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  19: mov r1.w, l(0)
  20: mov o3.xyzw, r1.wwwx
  21: mov o4.xyzw, r1.wwwy
  22: mov o5.w, r1.z
  23: dp3 r2.x, v1.xyzx, cb3[4].xyzx
  24: dp3 r2.y, v1.xyzx, cb3[5].xyzx
  25: dp3 r2.z, v1.xyzx, cb3[6].xyzx
  26: dp3 r1.w, r2.xyzx, r2.xyzx
  27: rsq r1.w, r1.w
  28: mul r2.xyz, r1.wwww, r2.xyzx
  29: mov o5.xyz, r2.xyzx
  30: add r3.xyzw, -r1.xxxx, cb2[3].xyzw
  31: add r4.xyzw, -r1.yyyy, cb2[4].xyzw
  32: add r1.xyzw, -r1.zzzz, cb2[5].xyzw
  33: mul r5.xyzw, r2.yyyy, r4.xyzw
  34: mul r4.xyzw, r4.xyzw, r4.xyzw
  35: mad r4.xyzw, r3.xyzw, r3.xyzw, r4.xyzw
  36: mad r3.xyzw, r3.xyzw, r2.xxxx, r5.xyzw
  37: mad r3.xyzw, r1.xyzw, r2.zzzz, r3.xyzw
  38: mad r1.xyzw, r1.xyzw, r1.xyzw, r4.xyzw
  39: max r1.xyzw, r1.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
  40: rsq r4.xyzw, r1.xyzw
  41: mad r1.xyzw, r1.xyzw, cb2[6].xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  42: div r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyzw
  43: mul r3.xyzw, r3.xyzw, r4.xyzw
  44: max r3.xyzw, r3.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  45: mul r1.xyzw, r1.xyzw, r3.xyzw
  46: mul r3.xyz, r1.yyyy, cb2[8].xyzx
  47: mad r3.xyz, cb2[7].xyzx, r1.xxxx, r3.xyzx
  48: mad r1.xyz, cb2[9].xyzx, r1.zzzz, r3.xyzx
  49: mad r1.xyz, cb2[10].xyzx, r1.wwww, r1.xyzx
  50: mad r3.xyz, r1.xyzx, l(0.305306, 0.305306, 0.305306, 0.000000), l(0.682171, 0.682171, 0.682171, 0.000000)
  51: mad r3.xyz, r1.xyzx, r3.xyzx, l(0.012523, 0.012523, 0.012523, 0.000000)
  52: mul r1.w, r2.y, r2.y
  53: mad r1.w, r2.x, r2.x, -r1.w
  54: mul r2.xyzw, r2.yzzx, r2.xyzz
  55: dp4 r4.x, cb2[42].xyzw, r2.xyzw
  56: dp4 r4.y, cb2[43].xyzw, r2.xyzw
  57: dp4 r4.z, cb2[44].xyzw, r2.xyzw
  58: mad r2.xyz, cb2[45].xyzx, r1.wwww, r4.xyzx
  59: mad o6.xyz, r1.xyzx, r3.xyzx, r2.xyzx
  60: mov o6.w, l(0)
  61: mul r0.y, r0.y, cb1[5].x
  62: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  63: mov o7.zw, r0.zzzw
  64: add o7.xy, r1.zzzz, r1.xwxx
  65: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL _EMISSION 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 25 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb2[1].xyzw
   1: mad r0.xyzw, cb2[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb2[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb3[18].xyzw
   5: mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb2[1].xyzx
  13: mad r0.xyz, cb2[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb2[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb2[3].xyzx, v0.wwww, r0.xyzx
  16: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  17: dp3 r1.w, r1.xyzx, r1.xyzx
  18: rsq r1.w, r1.w
  19: mul o2.xyz, r1.wwww, r1.xyzx
  20: mov o2.w, l(0)
  21: mov r0.w, l(0)
  22: mov o3.xyzw, r0.wwwx
  23: mov o4.xyzw, r0.wwwy
  24: mov o5.w, r0.z
  25: dp3 r0.x, v1.xyzx, cb2[4].xyzx
  26: dp3 r0.y, v1.xyzx, cb2[5].xyzx
  27: dp3 r0.z, v1.xyzx, cb2[6].xyzx
  28: dp3 r0.w, r0.xyzx, r0.xyzx
  29: rsq r0.w, r0.w
  30: mul o5.xyz, r0.wwww, r0.xyzx
  31: mov o6.xyzw, l(0,0,0,0)
  32: mov o7.xyzw, l(0,0,0,0)
  33: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// No shader variant for this keyword set. The closest match will be used instead.

 }


 // Stats for Vertex shader:
 //        d3d11: 31 avg math (26..34)
 // Stats for Fragment shader:
 //        d3d11: 50 avg math (33..99), 3 avg texture (3..5), 1 avg branch (0..2)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: POINT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 34 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add r2.xyz, r1.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r2.xyzx, r2.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r2.xyzx
  21: mov o2.w, l(0)
  22: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  23: mov o6.xyz, r1.xyzx
  24: dp3 r1.x, r2.xyzx, r2.xyzx
  25: rsq r1.x, r1.x
  26: mul r1.xyz, r1.xxxx, r2.xyzx
  27: mov r1.w, l(0)
  28: mov o3.xyzw, r1.wwwx
  29: mov o4.xyzw, r1.wwwy
  30: mov o5.w, r1.z
  31: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  32: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  33: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  34: dp3 r1.w, r1.xyzx, r1.xyzx
  35: rsq r1.w, r1.w
  36: mul o5.xyz, r1.wwww, r1.xyzx
  37: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  38: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  39: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  40: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  41: mov o8.xyzw, l(0,0,0,0)
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 39 math, 6 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 2 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 6
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: dp3 r1.w, v5.xyzx, v5.xyzx
   6: rsq r1.w, r1.w
   7: mul r2.xyz, r1.wwww, v5.xyzx
   8: mul r3.xyz, v6.yyyy, cb0[12].xyzx
   9: mad r3.xyz, cb0[11].xyzx, v6.xxxx, r3.xyzx
  10: mad r3.xyz, cb0[13].xyzx, v6.zzzz, r3.xyzx
  11: add r3.xyz, r3.xyzx, cb0[14].xyzx
  12: eq r1.w, cb2[0].x, l(1.000000)
  13: if_nz r1.w
  14:   eq r1.w, cb2[0].y, l(1.000000)
  15:   mul r4.xyz, v6.yyyy, cb2[2].xyzx
  16:   mad r4.xyz, cb2[1].xyzx, v6.xxxx, r4.xyzx
  17:   mad r4.xyz, cb2[3].xyzx, v6.zzzz, r4.xyzx
  18:   add r4.xyz, r4.xyzx, cb2[4].xyzx
  19:   movc r4.xyz, r1.wwww, r4.xyzx, v6.xyzx
  20:   add r4.xyz, r4.xyzx, -cb2[6].xyzx
  21:   mul r4.yzw, r4.xxyz, cb2[5].xxyz
  22:   mad r1.w, r4.y, l(0.250000), l(0.750000)
  23:   mad r2.w, cb2[0].z, l(0.500000), l(0.750000)
  24:   max r4.x, r1.w, r2.w
  25:   sample r4.xyzw, r4.xzwx, t3.xyzw, s0
  26: else 
  27:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  28: endif 
  29: dp4_sat r1.w, r4.xyzw, cb1[46].xyzw
  30: dp3 r2.w, r3.xyzx, r3.xyzx
  31: sample r3.xyzw, r2.wwww, t1.xyzw, s3
  32: mul r1.w, r1.w, r3.x
  33: mul r3.xyz, r1.wwww, cb0[2].xyzx
  34: dp3 r1.w, -v2.xyzx, r2.xyzx
  35: add r1.w, r1.w, r1.w
  36: mad r4.xyz, r2.xyzx, -r1.wwww, -v2.xyzx
  37: mov r5.x, v3.w
  38: mov r5.y, v4.w
  39: mov r5.z, v5.w
  40: dp3_sat r1.w, r2.xyzx, r5.xyzx
  41: dp3 r2.x, r4.xyzx, r5.xyzx
  42: mul r2.x, r2.x, r2.x
  43: mul r2.x, r2.x, r2.x
  44: add r2.y, -cb0[8].w, l(1.000000)
  45: sample r2.xyzw, r2.xyxx, t2.xyzw, s1
  46: mul r2.x, r2.x, l(16.000000)
  47: mul r0.xyz, r0.xyzx, r2.xxxx
  48: mad r0.xyz, r1.xyzx, r0.wwww, r0.xyzx
  49: mul r1.xyz, r1.wwww, r3.xyzx
  50: mul o0.xyz, r0.xyzx, r1.xyzx
  51: mov o0.w, l(1.000000)
  52: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 26 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: eq r0.x, cb0[9].w, l(0.000000)
   9: movc r0.xy, r0.xxxx, v2.xyxx, v3.xyxx
  10: mad o1.zw, r0.xxxy, cb0[7].xxxy, cb0[7].zzzw
  11: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  12: mul r0.xyz, v0.yyyy, cb3[1].xyzx
  13: mad r0.xyz, cb3[0].xyzx, v0.xxxx, r0.xyzx
  14: mad r0.xyz, cb3[2].xyzx, v0.zzzz, r0.xyzx
  15: mad r0.xyz, cb3[3].xyzx, v0.wwww, r0.xyzx
  16: add r1.xyz, r0.xyzx, -cb1[4].xyzx
  17: dp3 r0.w, r1.xyzx, r1.xyzx
  18: rsq r0.w, r0.w
  19: mul o2.xyz, r0.wwww, r1.xyzx
  20: mov o2.w, l(0)
  21: mad r1.xyz, -r0.xyzx, cb2[0].wwww, cb2[0].xyzx
  22: mov o6.xyz, r0.xyzx
  23: mov r1.w, l(0)
  24: mov o3.xyzw, r1.wwwx
  25: mov o4.xyzw, r1.wwwy
  26: mov o5.w, r1.z
  27: dp3 r0.x, v1.xyzx, cb3[4].xyzx
  28: dp3 r0.y, v1.xyzx, cb3[5].xyzx
  29: dp3 r0.z, v1.xyzx, cb3[6].xyzx
  30: dp3 r0.w, r0.xyzx, r0.xyzx
  31: rsq r0.w, r0.w
  32: mul o5.xyz, r0.wwww, r0.xyzx
  33: mov o7.xyzw, l(0,0,0,0)
  34: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 33 math, 6 temp registers, 3 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "unity_NHxRoughness" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[9], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 6
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: dp3 r1.w, v5.xyzx, v5.xyzx
   6: rsq r1.w, r1.w
   7: mul r2.xyz, r1.wwww, v5.xyzx
   8: eq r1.w, cb2[0].x, l(1.000000)
   9: if_nz r1.w
  10:   eq r1.w, cb2[0].y, l(1.000000)
  11:   mul r3.xyz, v6.yyyy, cb2[2].xyzx
  12:   mad r3.xyz, cb2[1].xyzx, v6.xxxx, r3.xyzx
  13:   mad r3.xyz, cb2[3].xyzx, v6.zzzz, r3.xyzx
  14:   add r3.xyz, r3.xyzx, cb2[4].xyzx
  15:   movc r3.xyz, r1.wwww, r3.xyzx, v6.xyzx
  16:   add r3.xyz, r3.xyzx, -cb2[6].xyzx
  17:   mul r3.yzw, r3.xxyz, cb2[5].xxyz
  18:   mad r1.w, r3.y, l(0.250000), l(0.750000)
  19:   mad r2.w, cb2[0].z, l(0.500000), l(0.750000)
  20:   max r3.x, r1.w, r2.w
  21:   sample r3.xyzw, r3.xzwx, t2.xyzw, s0
  22: else 
  23:   mov r3.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  24: endif 
  25: dp4_sat r1.w, r3.xyzw, cb1[46].xyzw
  26: mul r3.xyz, r1.wwww, cb0[2].xyzx
  27: dp3 r1.w, -v2.xyzx, r2.xyzx
  28: add r1.w, r1.w, r1.w
  29: mad r4.xyz, r2.xyzx, -r1.wwww, -v2.xyzx
  30: mov r5.x, v3.w
  31: mov r5.y, v4.w
  32: mov r5.z, v5.w
  33: dp3_sat r1.w, r2.xyzx, r5.xyzx
  34: dp3 r2.x, r4.xyzx, r5.xyzx
  35: mul r2.x, r2.x, r2.x
  36: mul r2.x, r2.x, r2.x
  37: add r2.y, -cb0[8].w, l(1.000000)
  38: sample r2.xyzw, r2.xyxx, t1.xyzw, s1
  39: mul r2.x, r2.x, l(16.000000)
  40: mul r0.xyz, r0.xyzx, r2.xxxx
  41: mad r0.xyz, r1.xyzx, r0.wwww, r0.xyzx
  42: mul r1.xyz, r1.wwww, r3.xyzx
  43: mul o0.xyz, r0.xyzx, r1.xyzx
  44: mov o0.w, l(1.000000)
  45: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: SPOT 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 34 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float   xyzw
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add r2.xyz, r1.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r2.xyzx, r2.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r2.xyzx
  21: mov o2.w, l(0)
  22: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  23: mov o6.xyz, r1.xyzx
  24: dp3 r1.x, r2.xyzx, r2.xyzx
  25: rsq r1.x, r1.x
  26: mul r1.xyz, r1.xxxx, r2.xyzx
  27: mov r1.w, l(0)
  28: mov o3.xyzw, r1.wwwx
  29: mov o4.xyzw, r1.wwwy
  30: mov o5.w, r1.z
  31: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  32: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  33: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  34: dp3 r1.w, r1.xyzx, r1.xyzx
  35: rsq r1.w, r1.w
  36: mul o5.xyz, r1.wwww, r1.xyzx
  37: mul r1.xyzw, r0.yyyy, cb0[12].xyzw
  38: mad r1.xyzw, cb0[11].xyzw, r0.xxxx, r1.xyzw
  39: mad r1.xyzw, cb0[13].xyzw, r0.zzzz, r1.xyzw
  40: mad o7.xyzw, cb0[14].xyzw, r0.wwww, r1.xyzw
  41: mov o8.xyzw, l(0,0,0,0)
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 45 math, 6 temp registers, 5 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texture3d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 6
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: dp3 r1.w, v5.xyzx, v5.xyzx
   6: rsq r1.w, r1.w
   7: mul r2.xyz, r1.wwww, v5.xyzx
   8: mul r3.xyzw, v6.yyyy, cb0[12].xyzw
   9: mad r3.xyzw, cb0[11].xyzw, v6.xxxx, r3.xyzw
  10: mad r3.xyzw, cb0[13].xyzw, v6.zzzz, r3.xyzw
  11: add r3.xyzw, r3.xyzw, cb0[14].xyzw
  12: eq r1.w, cb2[0].x, l(1.000000)
  13: if_nz r1.w
  14:   eq r1.w, cb2[0].y, l(1.000000)
  15:   mul r4.xyz, v6.yyyy, cb2[2].xyzx
  16:   mad r4.xyz, cb2[1].xyzx, v6.xxxx, r4.xyzx
  17:   mad r4.xyz, cb2[3].xyzx, v6.zzzz, r4.xyzx
  18:   add r4.xyz, r4.xyzx, cb2[4].xyzx
  19:   movc r4.xyz, r1.wwww, r4.xyzx, v6.xyzx
  20:   add r4.xyz, r4.xyzx, -cb2[6].xyzx
  21:   mul r4.yzw, r4.xxyz, cb2[5].xxyz
  22:   mad r1.w, r4.y, l(0.250000), l(0.750000)
  23:   mad r2.w, cb2[0].z, l(0.500000), l(0.750000)
  24:   max r4.x, r1.w, r2.w
  25:   sample r4.xyzw, r4.xzwx, t4.xyzw, s0
  26: else 
  27:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  28: endif 
  29: dp4_sat r1.w, r4.xyzw, cb1[46].xyzw
  30: lt r2.w, l(0.000000), r3.z
  31: and r2.w, r2.w, l(0x3f800000)
  32: div r4.xy, r3.xyxx, r3.wwww
  33: add r4.xy, r4.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  34: sample r4.xyzw, r4.xyxx, t1.xyzw, s3
  35: mul r2.w, r2.w, r4.w
  36: dp3 r3.x, r3.xyzx, r3.xyzx
  37: sample r3.xyzw, r3.xxxx, t2.xyzw, s4
  38: mul r2.w, r2.w, r3.x
  39: mul r1.w, r1.w, r2.w
  40: mul r3.xyz, r1.wwww, cb0[2].xyzx
  41: dp3 r1.w, -v2.xyzx, r2.xyzx
  42: add r1.w, r1.w, r1.w
  43: mad r4.xyz, r2.xyzx, -r1.wwww, -v2.xyzx
  44: mov r5.x, v3.w
  45: mov r5.y, v4.w
  46: mov r5.z, v5.w
  47: dp3_sat r1.w, r2.xyzx, r5.xyzx
  48: dp3 r2.x, r4.xyzx, r5.xyzx
  49: mul r2.x, r2.x, r2.x
  50: mul r2.x, r2.x, r2.x
  51: add r2.y, -cb0[8].w, l(1.000000)
  52: sample r2.xyzw, r2.xyxx, t3.xyzw, s1
  53: mul r2.x, r2.x, l(16.000000)
  54: mul r0.xyz, r0.xyzx, r2.xxxx
  55: mad r0.xyz, r1.xyzx, r0.wwww, r0.xyzx
  56: mul r1.xyz, r1.wwww, r3.xyzx
  57: mul o0.xyz, r0.xyzx, r1.xyzx
  58: mov o0.w, l(1.000000)
  59: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 34 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add r2.xyz, r1.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r2.xyzx, r2.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r2.xyzx
  21: mov o2.w, l(0)
  22: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  23: mov o6.xyz, r1.xyzx
  24: dp3 r1.x, r2.xyzx, r2.xyzx
  25: rsq r1.x, r1.x
  26: mul r1.xyz, r1.xxxx, r2.xyzx
  27: mov r1.w, l(0)
  28: mov o3.xyzw, r1.wwwx
  29: mov o4.xyzw, r1.wwwy
  30: mov o5.w, r1.z
  31: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  32: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  33: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  34: dp3 r1.w, r1.xyzx, r1.xyzx
  35: rsq r1.w, r1.w
  36: mul o5.xyz, r1.wwww, r1.xyzx
  37: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  38: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  39: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  40: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  41: mov o8.xyzw, l(0,0,0,0)
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 40 math, 6 temp registers, 5 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texturecube (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texture3d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 6
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: dp3 r1.w, v5.xyzx, v5.xyzx
   6: rsq r1.w, r1.w
   7: mul r2.xyz, r1.wwww, v5.xyzx
   8: mul r3.xyz, v6.yyyy, cb0[12].xyzx
   9: mad r3.xyz, cb0[11].xyzx, v6.xxxx, r3.xyzx
  10: mad r3.xyz, cb0[13].xyzx, v6.zzzz, r3.xyzx
  11: add r3.xyz, r3.xyzx, cb0[14].xyzx
  12: eq r1.w, cb2[0].x, l(1.000000)
  13: if_nz r1.w
  14:   eq r1.w, cb2[0].y, l(1.000000)
  15:   mul r4.xyz, v6.yyyy, cb2[2].xyzx
  16:   mad r4.xyz, cb2[1].xyzx, v6.xxxx, r4.xyzx
  17:   mad r4.xyz, cb2[3].xyzx, v6.zzzz, r4.xyzx
  18:   add r4.xyz, r4.xyzx, cb2[4].xyzx
  19:   movc r4.xyz, r1.wwww, r4.xyzx, v6.xyzx
  20:   add r4.xyz, r4.xyzx, -cb2[6].xyzx
  21:   mul r4.yzw, r4.xxyz, cb2[5].xxyz
  22:   mad r1.w, r4.y, l(0.250000), l(0.750000)
  23:   mad r2.w, cb2[0].z, l(0.500000), l(0.750000)
  24:   max r4.x, r1.w, r2.w
  25:   sample r4.xyzw, r4.xzwx, t4.xyzw, s0
  26: else 
  27:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  28: endif 
  29: dp4_sat r1.w, r4.xyzw, cb1[46].xyzw
  30: dp3 r2.w, r3.xyzx, r3.xyzx
  31: sample r4.xyzw, r2.wwww, t1.xyzw, s4
  32: sample r3.xyzw, r3.xyzx, t2.xyzw, s3
  33: mul r2.w, r3.w, r4.x
  34: mul r1.w, r1.w, r2.w
  35: mul r3.xyz, r1.wwww, cb0[2].xyzx
  36: dp3 r1.w, -v2.xyzx, r2.xyzx
  37: add r1.w, r1.w, r1.w
  38: mad r4.xyz, r2.xyzx, -r1.wwww, -v2.xyzx
  39: mov r5.x, v3.w
  40: mov r5.y, v4.w
  41: mov r5.z, v5.w
  42: dp3_sat r1.w, r2.xyzx, r5.xyzx
  43: dp3 r2.x, r4.xyzx, r5.xyzx
  44: mul r2.x, r2.x, r2.x
  45: mul r2.x, r2.x, r2.x
  46: add r2.y, -cb0[8].w, l(1.000000)
  47: sample r2.xyzw, r2.xyxx, t3.xyzw, s1
  48: mul r2.x, r2.x, l(16.000000)
  49: mul r0.xyz, r0.xyzx, r2.xxxx
  50: mad r0.xyz, r1.xyzx, r0.wwww, r0.xyzx
  51: mul r1.xyz, r1.wwww, r3.xyzx
  52: mul o0.xyz, r0.xyzx, r1.xyzx
  53: mov o0.w, l(1.000000)
  54: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 31 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float   xy  
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xy
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add r2.xyz, r1.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r2.xyzx, r2.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r2.xyzx
  21: mov o2.w, l(0)
  22: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  23: mov o6.xyz, r1.xyzx
  24: mov r2.w, l(0)
  25: mov o3.xyzw, r2.wwwx
  26: mov o4.xyzw, r2.wwwy
  27: mov o5.w, r2.z
  28: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  29: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  30: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  31: dp3 r1.w, r1.xyzx, r1.xyzx
  32: rsq r1.w, r1.w
  33: mul o5.xyz, r1.wwww, r1.xyzx
  34: mul r1.xy, r0.yyyy, cb0[12].xyxx
  35: mad r0.xy, cb0[11].xyxx, r0.xxxx, r1.xyxx
  36: mad r0.xy, cb0[13].xyxx, r0.zzzz, r0.xyxx
  37: mad o7.xy, cb0[14].xyxx, r0.wwww, r0.xyxx
  38: mov o8.xyzw, l(0,0,0,0)
  39: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 38 math, 6 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 2 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 2 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[47], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 6
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s2
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: dp3 r1.w, v5.xyzx, v5.xyzx
   6: rsq r1.w, r1.w
   7: mul r2.xyz, r1.wwww, v5.xyzx
   8: mul r3.xy, v6.yyyy, cb0[12].xyxx
   9: mad r3.xy, cb0[11].xyxx, v6.xxxx, r3.xyxx
  10: mad r3.xy, cb0[13].xyxx, v6.zzzz, r3.xyxx
  11: add r3.xy, r3.xyxx, cb0[14].xyxx
  12: eq r1.w, cb2[0].x, l(1.000000)
  13: if_nz r1.w
  14:   eq r1.w, cb2[0].y, l(1.000000)
  15:   mul r4.xyz, v6.yyyy, cb2[2].xyzx
  16:   mad r4.xyz, cb2[1].xyzx, v6.xxxx, r4.xyzx
  17:   mad r4.xyz, cb2[3].xyzx, v6.zzzz, r4.xyzx
  18:   add r4.xyz, r4.xyzx, cb2[4].xyzx
  19:   movc r4.xyz, r1.wwww, r4.xyzx, v6.xyzx
  20:   add r4.xyz, r4.xyzx, -cb2[6].xyzx
  21:   mul r4.yzw, r4.xxyz, cb2[5].xxyz
  22:   mad r1.w, r4.y, l(0.250000), l(0.750000)
  23:   mad r2.w, cb2[0].z, l(0.500000), l(0.750000)
  24:   max r4.x, r1.w, r2.w
  25:   sample r4.xyzw, r4.xzwx, t3.xyzw, s0
  26: else 
  27:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  28: endif 
  29: dp4_sat r1.w, r4.xyzw, cb1[46].xyzw
  30: sample r3.xyzw, r3.xyxx, t1.xyzw, s3
  31: mul r1.w, r1.w, r3.w
  32: mul r3.xyz, r1.wwww, cb0[2].xyzx
  33: dp3 r1.w, -v2.xyzx, r2.xyzx
  34: add r1.w, r1.w, r1.w
  35: mad r4.xyz, r2.xyzx, -r1.wwww, -v2.xyzx
  36: mov r5.x, v3.w
  37: mov r5.y, v4.w
  38: mov r5.z, v5.w
  39: dp3_sat r1.w, r2.xyzx, r5.xyzx
  40: dp3 r2.x, r4.xyzx, r5.xyzx
  41: mul r2.x, r2.x, r2.x
  42: mul r2.x, r2.x, r2.x
  43: add r2.y, -cb0[8].w, l(1.000000)
  44: sample r2.xyzw, r2.xyxx, t2.xyzw, s1
  45: mul r2.x, r2.x, l(16.000000)
  46: mul r0.xyz, r0.xyzx, r2.xxxx
  47: mad r0.xyz, r1.xyzx, r0.wwww, r0.xyzx
  48: mul r1.xyz, r1.wwww, r3.xyzx
  49: mul o0.xyz, r0.xyzx, r1.xyzx
  50: mov o0.w, l(1.000000)
  51: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 34 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float   xyzw
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add r2.xyz, r1.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r2.xyzx, r2.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r2.xyzx
  21: mov o2.w, l(0)
  22: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  23: mov o6.xyz, r1.xyzx
  24: dp3 r1.x, r2.xyzx, r2.xyzx
  25: rsq r1.x, r1.x
  26: mul r1.xyz, r1.xxxx, r2.xyzx
  27: mov r1.w, l(0)
  28: mov o3.xyzw, r1.wwwx
  29: mov o4.xyzw, r1.wwwy
  30: mov o5.w, r1.z
  31: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  32: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  33: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  34: dp3 r1.w, r1.xyzx, r1.xyzx
  35: rsq r1.w, r1.w
  36: mul o5.xyz, r1.wwww, r1.xyzx
  37: mul r1.xyzw, r0.yyyy, cb0[12].xyzw
  38: mad r1.xyzw, cb0[11].xyzw, r0.xxxx, r1.xyzw
  39: mad r1.xyzw, cb0[13].xyzw, r0.zzzz, r1.xyzw
  40: mad o7.xyzw, cb0[14].xyzw, r0.wwww, r1.xyzw
  41: mov o8.xyzw, l(0,0,0,0)
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 40 math, 3 temp registers, 4 textures
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityShadows" (416 bytes) on slot 1 {
  Matrix4x4 unity_WorldToShadow[4] at 128
  Vector4 _LightShadowData at 384
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyzw        7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[25], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texture2d (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v6.yyyy, cb0[12].xyzw
   1: mad r0.xyzw, cb0[11].xyzw, v6.xxxx, r0.xyzw
   2: mad r0.xyzw, cb0[13].xyzw, v6.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb0[14].xyzw
   4: div r1.xy, r0.xyxx, r0.wwww
   5: add r1.xy, r1.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
   6: sample r1.xyzw, r1.xyxx, t1.xyzw, s3
   7: lt r0.w, l(0.000000), r0.z
   8: dp3 r0.x, r0.xyzx, r0.xyzx
   9: sample r2.xyzw, r0.xxxx, t2.xyzw, s4
  10: and r0.x, r0.w, l(0x3f800000)
  11: mul r0.x, r1.w, r0.x
  12: mul r0.x, r2.x, r0.x
  13: mul r1.xyzw, v6.yyyy, cb1[9].xyzw
  14: mad r1.xyzw, cb1[8].xyzw, v6.xxxx, r1.xyzw
  15: mad r1.xyzw, cb1[10].xyzw, v6.zzzz, r1.xyzw
  16: add r1.xyzw, r1.xyzw, cb1[11].xyzw
  17: div r0.yzw, r1.xxyz, r1.wwww
  18: sample_c_lz r0.y, r0.yzyy, t4.xxxx, s1, r0.w
  19: add r0.z, -cb1[24].x, l(1.000000)
  20: mad r0.y, r0.y, r0.z, cb1[24].x
  21: mul r0.x, r0.y, r0.x
  22: mul r0.xyz, r0.xxxx, cb0[2].xyzx
  23: dp3 r0.w, v5.xyzx, v5.xyzx
  24: rsq r0.w, r0.w
  25: mul r1.xyz, r0.wwww, v5.xyzx
  26: mov r2.x, v3.w
  27: mov r2.y, v4.w
  28: mov r2.z, v5.w
  29: dp3_sat r0.w, r1.xyzx, r2.xyzx
  30: mul r0.xyz, r0.wwww, r0.xyzx
  31: dp3 r0.w, -v2.xyzx, r1.xyzx
  32: add r0.w, r0.w, r0.w
  33: mad r1.xyz, r1.xyzx, -r0.wwww, -v2.xyzx
  34: dp3 r0.w, r1.xyzx, r2.xyzx
  35: mul r0.w, r0.w, r0.w
  36: mul r1.x, r0.w, r0.w
  37: add r1.y, -cb0[8].w, l(1.000000)
  38: sample r1.xyzw, r1.xyxx, t3.xyzw, s0
  39: mul r0.w, r1.x, l(16.000000)
  40: sample r1.xyzw, v1.xyxx, t0.xyzw, s2
  41: mad r2.xyz, cb0[4].xyzx, r1.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
  42: mul r1.xyz, r1.xyzx, cb0[4].xyzx
  43: mad r2.xyz, cb0[8].zzzz, r2.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
  44: mul r2.xyz, r0.wwww, r2.xyzx
  45: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
  46: mad r1.xyz, r1.xyzx, r0.wwww, r2.xyzx
  47: mul o0.xyz, r0.xyzx, r1.xyzx
  48: mov o0.w, l(1.000000)
  49: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 26 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[10], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb3[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb4[18].xyzw
   5: mad r1.xyzw, cb4[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb4[19].xyzw, r0.zzzz, r1.xyzw
   7: mad r0.xyzw, cb4[20].xyzw, r0.wwww, r1.xyzw
   8: mov o0.xyzw, r0.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add o2.xyz, r1.xyzx, -cb1[4].xyzx
  18: mov o2.w, l(0)
  19: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  20: mov o6.xyz, r1.xyzx
  21: mov r2.w, l(0)
  22: mov o3.xyzw, r2.wwwx
  23: mov o4.xyzw, r2.wwwy
  24: mov o5.w, r2.z
  25: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  26: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  27: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  28: dp3 r1.w, r1.xyzx, r1.xyzx
  29: rsq r1.w, r1.w
  30: mul o5.xyz, r1.wwww, r1.xyzx
  31: mul r0.y, r0.y, cb1[5].x
  32: mul r1.xzw, r0.xxwy, l(0.500000, 0.000000, 0.500000, 0.500000)
  33: mov o7.zw, r0.zzzw
  34: add o7.xy, r1.zzzz, r1.xwxx
  35: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 94 math, 7 temp registers, 3 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "$Globals" (176 bytes) on slot 0 {
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 7   xyzw        7     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[9], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture3d (float,float,float,float) t2
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v7.xyw
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: add r4.xyz, -v6.xyzx, cb1[4].xyzx
  13: mov r5.x, cb4[9].z
  14: mov r5.y, cb4[10].z
  15: mov r5.z, cb4[11].z
  16: dp3 r1.w, r4.xyzx, r5.xyzx
  17: add r4.xyz, v6.xyzx, -cb3[25].xyzx
  18: dp3 r2.w, r4.xyzx, r4.xyzx
  19: sqrt r2.w, r2.w
  20: add r2.w, -r1.w, r2.w
  21: mad r1.w, cb3[25].w, r2.w, r1.w
  22: mad_sat r1.w, r1.w, cb3[24].z, cb3[24].w
  23: eq r2.w, cb5[0].x, l(1.000000)
  24: if_nz r2.w
  25:   eq r2.w, cb5[0].y, l(1.000000)
  26:   mul r4.xyz, v6.yyyy, cb5[2].xyzx
  27:   mad r4.xyz, cb5[1].xyzx, v6.xxxx, r4.xyzx
  28:   mad r4.xyz, cb5[3].xyzx, v6.zzzz, r4.xyzx
  29:   add r4.xyz, r4.xyzx, cb5[4].xyzx
  30:   movc r4.xyz, r2.wwww, r4.xyzx, v6.xyzx
  31:   add r4.xyz, r4.xyzx, -cb5[6].xyzx
  32:   mul r4.yzw, r4.xxyz, cb5[5].xxyz
  33:   mad r2.w, r4.y, l(0.250000), l(0.750000)
  34:   mad r3.w, cb5[0].z, l(0.500000), l(0.750000)
  35:   max r4.x, r2.w, r3.w
  36:   sample r4.xyzw, r4.xzwx, t2.xyzw, s0
  37: else 
  38:   mov r4.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  39: endif 
  40: dp4_sat r2.w, r4.xyzw, cb2[46].xyzw
  41: div r4.xy, v7.xyxx, v7.wwww
  42: sample r4.xyzw, r4.xyxx, t1.xyzw, s2
  43: add r2.w, r2.w, -r4.x
  44: mad r1.w, r1.w, r2.w, r4.x
  45: mul r4.xyz, r1.wwww, cb0[2].xyzx
  46: add r1.w, -cb0[8].w, l(1.000000)
  47: mov r5.x, v3.w
  48: mov r5.y, v4.w
  49: mov r5.z, v5.w
  50: mad r6.xyz, -v2.xyzx, r0.wwww, r5.xyzx
  51: dp3 r0.w, r6.xyzx, r6.xyzx
  52: max r0.w, r0.w, l(0.001000)
  53: rsq r0.w, r0.w
  54: mul r6.xyz, r0.wwww, r6.xyzx
  55: dp3 r0.w, r2.xyzx, -r3.xyzx
  56: dp3_sat r2.w, r2.xyzx, r5.xyzx
  57: dp3_sat r2.x, r2.xyzx, r6.xyzx
  58: dp3_sat r2.y, r5.xyzx, r6.xyzx
  59: mul r2.z, r2.y, r2.y
  60: dp2 r2.z, r2.zzzz, r1.wwww
  61: add r2.z, r2.z, l(-0.500000)
  62: add r3.x, -r2.w, l(1.000000)
  63: mul r3.y, r3.x, r3.x
  64: mul r3.y, r3.y, r3.y
  65: mul r3.x, r3.x, r3.y
  66: mad r3.x, r2.z, r3.x, l(1.000000)
  67: add r3.y, -|r0.w|, l(1.000000)
  68: mul r3.z, r3.y, r3.y
  69: mul r3.z, r3.z, r3.z
  70: mul r3.y, r3.y, r3.z
  71: mad r2.z, r2.z, r3.y, l(1.000000)
  72: mul r2.z, r2.z, r3.x
  73: mul r2.z, r2.w, r2.z
  74: mul r1.w, r1.w, r1.w
  75: max r1.w, r1.w, l(0.002000)
  76: add r3.x, -r1.w, l(1.000000)
  77: mad r3.y, |r0.w|, r3.x, r1.w
  78: mad r3.x, r2.w, r3.x, r1.w
  79: mul r0.w, |r0.w|, r3.x
  80: mad r0.w, r2.w, r3.y, r0.w
  81: add r0.w, r0.w, l(0.000010)
  82: div r0.w, l(0.500000), r0.w
  83: mul r1.w, r1.w, r1.w
  84: mad r3.x, r2.x, r1.w, -r2.x
  85: mad r2.x, r3.x, r2.x, l(1.000000)
  86: mul r1.w, r1.w, l(0.318310)
  87: mad r2.x, r2.x, r2.x, l(0.000000)
  88: div r1.w, r1.w, r2.x
  89: mul r0.w, r0.w, r1.w
  90: mul r0.w, r0.w, l(3.141593)
  91: max r0.w, r0.w, l(0.000100)
  92: sqrt r0.w, r0.w
  93: mul r0.w, r2.w, r0.w
  94: dp3 r1.w, r0.xyzx, r0.xyzx
  95: ne r1.w, r1.w, l(0.000000)
  96: and r1.w, r1.w, l(0x3f800000)
  97: mul r0.w, r0.w, r1.w
  98: mul r2.xzw, r2.zzzz, r4.xxyz
  99: mul r3.xyz, r4.xyzx, r0.wwww
 100: add r0.w, -r2.y, l(1.000000)
 101: mul r1.w, r0.w, r0.w
 102: mul r1.w, r1.w, r1.w
 103: mul r0.w, r0.w, r1.w
 104: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 105: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 106: mul r0.xyz, r0.xyzx, r3.xyzx
 107: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 108: mov o0.w, l(1.000000)
 109: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE SHADOWS_SCREEN 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 32 math, 4 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
  Vector4 _ProjectionParams at 80
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float   xy  
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xy
      dcl_output o8.xyzw
      dcl_temps 4
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad r1.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: mov o0.xyzw, r1.xyzw
  10: eq r2.x, cb0[9].w, l(0.000000)
  11: movc r2.xy, r2.xxxx, v2.xyxx, v3.xyxx
  12: mad o1.zw, r2.xxxy, cb0[7].xxxy, cb0[7].zzzw
  13: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  14: mul r2.xyz, v0.yyyy, cb3[1].xyzx
  15: mad r2.xyz, cb3[0].xyzx, v0.xxxx, r2.xyzx
  16: mad r2.xyz, cb3[2].xyzx, v0.zzzz, r2.xyzx
  17: mad r2.xyz, cb3[3].xyzx, v0.wwww, r2.xyzx
  18: add o2.xyz, r2.xyzx, -cb1[4].xyzx
  19: mov o2.w, l(0)
  20: mad r3.xyz, -r2.xyzx, cb2[0].wwww, cb2[0].xyzx
  21: mov o6.xyz, r2.xyzx
  22: mov r3.w, l(0)
  23: mov o3.xyzw, r3.wwwx
  24: mov o4.xyzw, r3.wwwy
  25: mov o5.w, r3.z
  26: dp3 r2.x, v1.xyzx, cb3[4].xyzx
  27: dp3 r2.y, v1.xyzx, cb3[5].xyzx
  28: dp3 r2.z, v1.xyzx, cb3[6].xyzx
  29: dp3 r2.w, r2.xyzx, r2.xyzx
  30: rsq r2.w, r2.w
  31: mul o5.xyz, r2.wwww, r2.xyzx
  32: mul r2.xy, r0.yyyy, cb0[12].xyxx
  33: mad r0.xy, cb0[11].xyxx, r0.xxxx, r2.xyxx
  34: mad r0.xy, cb0[13].xyxx, r0.zzzz, r0.xyxx
  35: mad o7.xy, cb0[14].xyxx, r0.wwww, r0.xyxx
  36: mul r0.x, r1.y, cb1[5].x
  37: mul r0.w, r0.x, l(0.500000)
  38: mul r0.xz, r1.xxwx, l(0.500000, 0.000000, 0.500000, 0.000000)
  39: mov o8.zw, r1.zzzw
  40: add o8.xy, r0.zzzz, r0.xwxx
  41: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 99 math, 7 temp registers, 4 textures, 2 branches
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 unity_OcclusionMaskSelector at 736
}
Constant Buffer "UnityShadows" (416 bytes) on slot 3 {
  Vector4 _LightShadowData at 384
  Vector4 unity_ShadowFadeCenterAndType at 400
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixV at 144
}
Constant Buffer "UnityProbeVolume" (112 bytes) on slot 5 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 16
  Vector4 unity_ProbeVolumeParams at 0
  Vector3 unity_ProbeVolumeSizeInv at 80
  Vector3 unity_ProbeVolumeMin at 96
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xy          7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float   xy w
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[47], immediateIndexed
      dcl_constantbuffer CB3[26], immediateIndexed
      dcl_constantbuffer CB4[12], immediateIndexed
      dcl_constantbuffer CB5[7], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_default
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texture3d (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_input_ps linear v8.xyw
      dcl_output o0.xyzw
      dcl_temps 7
   0: sample r0.xyzw, v1.xyxx, t0.xyzw, s1
   1: mul r1.xyz, r0.xyzx, cb0[4].xyzx
   2: mad r0.xyz, cb0[4].xyzx, r0.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
   3: mad r0.xyz, cb0[8].zzzz, r0.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
   4: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
   5: mul r1.xyz, r0.wwww, r1.xyzx
   6: dp3 r0.w, v5.xyzx, v5.xyzx
   7: rsq r0.w, r0.w
   8: mul r2.xyz, r0.wwww, v5.xyzx
   9: dp3 r0.w, v2.xyzx, v2.xyzx
  10: rsq r0.w, r0.w
  11: mul r3.xyz, r0.wwww, v2.xyzx
  12: mul r4.xy, v6.yyyy, cb0[12].xyxx
  13: mad r4.xy, cb0[11].xyxx, v6.xxxx, r4.xyxx
  14: mad r4.xy, cb0[13].xyxx, v6.zzzz, r4.xyxx
  15: add r4.xy, r4.xyxx, cb0[14].xyxx
  16: add r5.xyz, -v6.xyzx, cb1[4].xyzx
  17: mov r6.x, cb4[9].z
  18: mov r6.y, cb4[10].z
  19: mov r6.z, cb4[11].z
  20: dp3 r1.w, r5.xyzx, r6.xyzx
  21: add r5.xyz, v6.xyzx, -cb3[25].xyzx
  22: dp3 r2.w, r5.xyzx, r5.xyzx
  23: sqrt r2.w, r2.w
  24: add r2.w, -r1.w, r2.w
  25: mad r1.w, cb3[25].w, r2.w, r1.w
  26: mad_sat r1.w, r1.w, cb3[24].z, cb3[24].w
  27: eq r2.w, cb5[0].x, l(1.000000)
  28: if_nz r2.w
  29:   eq r2.w, cb5[0].y, l(1.000000)
  30:   mul r5.xyz, v6.yyyy, cb5[2].xyzx
  31:   mad r5.xyz, cb5[1].xyzx, v6.xxxx, r5.xyzx
  32:   mad r5.xyz, cb5[3].xyzx, v6.zzzz, r5.xyzx
  33:   add r5.xyz, r5.xyzx, cb5[4].xyzx
  34:   movc r5.xyz, r2.wwww, r5.xyzx, v6.xyzx
  35:   add r5.xyz, r5.xyzx, -cb5[6].xyzx
  36:   mul r5.yzw, r5.xxyz, cb5[5].xxyz
  37:   mad r2.w, r5.y, l(0.250000), l(0.750000)
  38:   mad r3.w, cb5[0].z, l(0.500000), l(0.750000)
  39:   max r5.x, r2.w, r3.w
  40:   sample r5.xyzw, r5.xzwx, t3.xyzw, s0
  41: else 
  42:   mov r5.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  43: endif 
  44: dp4_sat r2.w, r5.xyzw, cb2[46].xyzw
  45: div r4.zw, v8.xxxy, v8.wwww
  46: sample r5.xyzw, r4.zwzz, t1.xyzw, s2
  47: add r2.w, r2.w, -r5.x
  48: mad r1.w, r1.w, r2.w, r5.x
  49: sample r4.xyzw, r4.xyxx, t2.xyzw, s3
  50: mul r1.w, r1.w, r4.w
  51: mul r4.xyz, r1.wwww, cb0[2].xyzx
  52: add r1.w, -cb0[8].w, l(1.000000)
  53: mov r5.x, v3.w
  54: mov r5.y, v4.w
  55: mov r5.z, v5.w
  56: mad r6.xyz, -v2.xyzx, r0.wwww, r5.xyzx
  57: dp3 r0.w, r6.xyzx, r6.xyzx
  58: max r0.w, r0.w, l(0.001000)
  59: rsq r0.w, r0.w
  60: mul r6.xyz, r0.wwww, r6.xyzx
  61: dp3 r0.w, r2.xyzx, -r3.xyzx
  62: dp3_sat r2.w, r2.xyzx, r5.xyzx
  63: dp3_sat r2.x, r2.xyzx, r6.xyzx
  64: dp3_sat r2.y, r5.xyzx, r6.xyzx
  65: mul r2.z, r2.y, r2.y
  66: dp2 r2.z, r2.zzzz, r1.wwww
  67: add r2.z, r2.z, l(-0.500000)
  68: add r3.x, -r2.w, l(1.000000)
  69: mul r3.y, r3.x, r3.x
  70: mul r3.y, r3.y, r3.y
  71: mul r3.x, r3.x, r3.y
  72: mad r3.x, r2.z, r3.x, l(1.000000)
  73: add r3.y, -|r0.w|, l(1.000000)
  74: mul r3.z, r3.y, r3.y
  75: mul r3.z, r3.z, r3.z
  76: mul r3.y, r3.y, r3.z
  77: mad r2.z, r2.z, r3.y, l(1.000000)
  78: mul r2.z, r2.z, r3.x
  79: mul r2.z, r2.w, r2.z
  80: mul r1.w, r1.w, r1.w
  81: max r1.w, r1.w, l(0.002000)
  82: add r3.x, -r1.w, l(1.000000)
  83: mad r3.y, |r0.w|, r3.x, r1.w
  84: mad r3.x, r2.w, r3.x, r1.w
  85: mul r0.w, |r0.w|, r3.x
  86: mad r0.w, r2.w, r3.y, r0.w
  87: add r0.w, r0.w, l(0.000010)
  88: div r0.w, l(0.500000), r0.w
  89: mul r1.w, r1.w, r1.w
  90: mad r3.x, r2.x, r1.w, -r2.x
  91: mad r2.x, r3.x, r2.x, l(1.000000)
  92: mul r1.w, r1.w, l(0.318310)
  93: mad r2.x, r2.x, r2.x, l(0.000000)
  94: div r1.w, r1.w, r2.x
  95: mul r0.w, r0.w, r1.w
  96: mul r0.w, r0.w, l(3.141593)
  97: max r0.w, r0.w, l(0.000100)
  98: sqrt r0.w, r0.w
  99: mul r0.w, r2.w, r0.w
 100: dp3 r1.w, r0.xyzx, r0.xyzx
 101: ne r1.w, r1.w, l(0.000000)
 102: and r1.w, r1.w, l(0x3f800000)
 103: mul r0.w, r0.w, r1.w
 104: mul r2.xzw, r2.zzzz, r4.xxyz
 105: mul r3.xyz, r4.xyzx, r0.wwww
 106: add r0.w, -r2.y, l(1.000000)
 107: mul r1.w, r0.w, r0.w
 108: mul r1.w, r1.w, r1.w
 109: mul r0.w, r0.w, r1.w
 110: add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
 111: mad r0.xyz, r4.xyzx, r0.wwww, r0.xyzx
 112: mul r0.xyz, r0.xyzx, r3.xyzx
 113: mad o0.xyz, r1.xyzx, r2.xzwx, r0.xyzx
 114: mov o0.w, l(1.000000)
 115: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 34 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add r2.xyz, r1.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r2.xyzx, r2.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r2.xyzx
  21: mov o2.w, l(0)
  22: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  23: mov o6.xyz, r1.xyzx
  24: dp3 r1.x, r2.xyzx, r2.xyzx
  25: rsq r1.x, r1.x
  26: mul r1.xyz, r1.xxxx, r2.xyzx
  27: mov r1.w, l(0)
  28: mov o3.xyzw, r1.wwwx
  29: mov o4.xyzw, r1.wwwy
  30: mov o5.w, r1.z
  31: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  32: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  33: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  34: dp3 r1.w, r1.xyzx, r1.xyzx
  35: rsq r1.w, r1.w
  36: mul o5.xyz, r1.wwww, r1.xyzx
  37: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  38: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  39: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  40: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  41: mov o8.xyzw, l(0,0,0,0)
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 38 math, 3 temp registers, 3 textures
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 2 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 3 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
}
Constant Buffer "UnityShadows" (416 bytes) on slot 2 {
  Vector4 _LightShadowData at 384
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[3], immediateIndexed
      dcl_constantbuffer CB2[25], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texture2d (float,float,float,float) t2
      dcl_resource_texturecube (float,float,float,float) t3
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 3
   0: add r0.xyz, v6.xyzx, -cb1[1].xyzx
   1: max r0.w, |r0.y|, |r0.x|
   2: max r0.w, |r0.z|, r0.w
   3: add r0.w, r0.w, -cb1[2].z
   4: max r0.w, r0.w, l(0.000010)
   5: mul r0.w, r0.w, cb1[2].w
   6: div r0.w, cb1[2].y, r0.w
   7: add r0.w, r0.w, -cb1[2].x
   8: add r0.w, -r0.w, l(1.000000)
   9: sample_c_lz r0.x, r0.xyzx, t3.xxxx, s1, r0.w
  10: add r0.y, -cb2[24].x, l(1.000000)
  11: mad r0.x, r0.x, r0.y, cb2[24].x
  12: mul r0.yzw, v6.yyyy, cb0[12].xxyz
  13: mad r0.yzw, cb0[11].xxyz, v6.xxxx, r0.yyzw
  14: mad r0.yzw, cb0[13].xxyz, v6.zzzz, r0.yyzw
  15: add r0.yzw, r0.yyzw, cb0[14].xxyz
  16: dp3 r0.y, r0.yzwy, r0.yzwy
  17: sample r1.xyzw, r0.yyyy, t1.xyzw, s3
  18: mul r0.x, r0.x, r1.x
  19: mul r0.xyz, r0.xxxx, cb0[2].xyzx
  20: dp3 r0.w, v5.xyzx, v5.xyzx
  21: rsq r0.w, r0.w
  22: mul r1.xyz, r0.wwww, v5.xyzx
  23: mov r2.x, v3.w
  24: mov r2.y, v4.w
  25: mov r2.z, v5.w
  26: dp3_sat r0.w, r1.xyzx, r2.xyzx
  27: mul r0.xyz, r0.wwww, r0.xyzx
  28: dp3 r0.w, -v2.xyzx, r1.xyzx
  29: add r0.w, r0.w, r0.w
  30: mad r1.xyz, r1.xyzx, -r0.wwww, -v2.xyzx
  31: dp3 r0.w, r1.xyzx, r2.xyzx
  32: mul r0.w, r0.w, r0.w
  33: mul r1.x, r0.w, r0.w
  34: add r1.y, -cb0[8].w, l(1.000000)
  35: sample r1.xyzw, r1.xyxx, t2.xyzw, s0
  36: mul r0.w, r1.x, l(16.000000)
  37: sample r1.xyzw, v1.xyxx, t0.xyzw, s2
  38: mad r2.xyz, cb0[4].xyzx, r1.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
  39: mul r1.xyz, r1.xyzx, cb0[4].xyzx
  40: mad r2.xyz, cb0[8].zzzz, r2.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
  41: mul r2.xyz, r0.wwww, r2.xyzx
  42: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
  43: mad r1.xyz, r1.xyzx, r0.wwww, r2.xyzx
  44: mul o0.xyz, r0.xyzx, r1.xyzx
  45: mov o0.w, l(1.000000)
  46: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 34 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _MainTex_ST at 96
  Vector4 _DetailAlbedoMap_ST at 112
  Float _UVSec at 156
}
Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
  Vector3 _WorldSpaceCameraPos at 64
}
Constant Buffer "UnityLighting" (768 bytes) on slot 2 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 3 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 4 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xy          3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float   xyz 
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[5], immediateIndexed
      dcl_constantbuffer CB2[1], immediateIndexed
      dcl_constantbuffer CB3[7], immediateIndexed
      dcl_constantbuffer CB4[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_input v2.xy
      dcl_input v3.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyz
      dcl_output o7.xyz
      dcl_output o8.xyzw
      dcl_temps 3
   0: mul r0.xyzw, v0.yyyy, cb3[1].xyzw
   1: mad r0.xyzw, cb3[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb3[2].xyzw, v0.zzzz, r0.xyzw
   3: add r1.xyzw, r0.xyzw, cb3[3].xyzw
   4: mad r0.xyzw, cb3[3].xyzw, v0.wwww, r0.xyzw
   5: mul r2.xyzw, r1.yyyy, cb4[18].xyzw
   6: mad r2.xyzw, cb4[17].xyzw, r1.xxxx, r2.xyzw
   7: mad r2.xyzw, cb4[19].xyzw, r1.zzzz, r2.xyzw
   8: mad o0.xyzw, cb4[20].xyzw, r1.wwww, r2.xyzw
   9: eq r1.x, cb0[9].w, l(0.000000)
  10: movc r1.xy, r1.xxxx, v2.xyxx, v3.xyxx
  11: mad o1.zw, r1.xxxy, cb0[7].xxxy, cb0[7].zzzw
  12: mad o1.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
  13: mul r1.xyz, v0.yyyy, cb3[1].xyzx
  14: mad r1.xyz, cb3[0].xyzx, v0.xxxx, r1.xyzx
  15: mad r1.xyz, cb3[2].xyzx, v0.zzzz, r1.xyzx
  16: mad r1.xyz, cb3[3].xyzx, v0.wwww, r1.xyzx
  17: add r2.xyz, r1.xyzx, -cb1[4].xyzx
  18: dp3 r1.w, r2.xyzx, r2.xyzx
  19: rsq r1.w, r1.w
  20: mul o2.xyz, r1.wwww, r2.xyzx
  21: mov o2.w, l(0)
  22: mad r2.xyz, -r1.xyzx, cb2[0].wwww, cb2[0].xyzx
  23: mov o6.xyz, r1.xyzx
  24: dp3 r1.x, r2.xyzx, r2.xyzx
  25: rsq r1.x, r1.x
  26: mul r1.xyz, r1.xxxx, r2.xyzx
  27: mov r1.w, l(0)
  28: mov o3.xyzw, r1.wwwx
  29: mov o4.xyzw, r1.wwwy
  30: mov o5.w, r1.z
  31: dp3 r1.x, v1.xyzx, cb3[4].xyzx
  32: dp3 r1.y, v1.xyzx, cb3[5].xyzx
  33: dp3 r1.z, v1.xyzx, cb3[6].xyzx
  34: dp3 r1.w, r1.xyzx, r1.xyzx
  35: rsq r1.w, r1.w
  36: mul o5.xyz, r1.wwww, r1.xyzx
  37: mul r1.xyz, r0.yyyy, cb0[12].xyzx
  38: mad r1.xyz, cb0[11].xyzx, r0.xxxx, r1.xyzx
  39: mad r0.xyz, cb0[13].xyzx, r0.zzzz, r1.xyzx
  40: mad o7.xyz, cb0[14].xyzx, r0.wwww, r0.xyzx
  41: mov o8.xyzw, l(0,0,0,0)
  42: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
// Stats: 39 math, 3 temp registers, 4 textures
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "$Globals" (240 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 176
  Vector4 _LightColor0 at 32
  Vector4 _Color at 64
  Float _Metallic at 136
  Float _Glossiness at 140
}
Constant Buffer "UnityLighting" (768 bytes) on slot 1 {
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
}
Constant Buffer "UnityShadows" (416 bytes) on slot 2 {
  Vector4 _LightShadowData at 384
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// TEXCOORD                 2   xyzw        3     NONE   float      w
// TEXCOORD                 3   xyzw        4     NONE   float      w
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyz         6     NONE   float   xyz 
// TEXCOORD                 6   xyz         7     NONE   float       
// TEXCOORD                 7   xyzw        8     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[15], immediateIndexed
      dcl_constantbuffer CB1[3], immediateIndexed
      dcl_constantbuffer CB2[25], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_sampler s1, mode_comparison
      dcl_sampler s2, mode_default
      dcl_sampler s3, mode_default
      dcl_sampler s4, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_resource_texture2d (float,float,float,float) t1
      dcl_resource_texturecube (float,float,float,float) t2
      dcl_resource_texture2d (float,float,float,float) t3
      dcl_resource_texturecube (float,float,float,float) t4
      dcl_input_ps linear v1.xy
      dcl_input_ps linear v2.xyz
      dcl_input_ps linear v3.w
      dcl_input_ps linear v4.w
      dcl_input_ps linear v5.xyzw
      dcl_input_ps linear v6.xyz
      dcl_output o0.xyzw
      dcl_temps 3
   0: add r0.xyz, v6.xyzx, -cb1[1].xyzx
   1: max r0.w, |r0.y|, |r0.x|
   2: max r0.w, |r0.z|, r0.w
   3: add r0.w, r0.w, -cb1[2].z
   4: max r0.w, r0.w, l(0.000010)
   5: mul r0.w, r0.w, cb1[2].w
   6: div r0.w, cb1[2].y, r0.w
   7: add r0.w, r0.w, -cb1[2].x
   8: add r0.w, -r0.w, l(1.000000)
   9: sample_c_lz r0.x, r0.xyzx, t4.xxxx, s1, r0.w
  10: add r0.y, -cb2[24].x, l(1.000000)
  11: mad r0.x, r0.x, r0.y, cb2[24].x
  12: mul r0.yzw, v6.yyyy, cb0[12].xxyz
  13: mad r0.yzw, cb0[11].xxyz, v6.xxxx, r0.yyzw
  14: mad r0.yzw, cb0[13].xxyz, v6.zzzz, r0.yyzw
  15: add r0.yzw, r0.yyzw, cb0[14].xxyz
  16: dp3 r1.x, r0.yzwy, r0.yzwy
  17: sample r2.xyzw, r0.yzwy, t2.xyzw, s3
  18: sample r1.xyzw, r1.xxxx, t1.xyzw, s4
  19: mul r0.y, r2.w, r1.x
  20: mul r0.x, r0.x, r0.y
  21: mul r0.xyz, r0.xxxx, cb0[2].xyzx
  22: dp3 r0.w, v5.xyzx, v5.xyzx
  23: rsq r0.w, r0.w
  24: mul r1.xyz, r0.wwww, v5.xyzx
  25: mov r2.x, v3.w
  26: mov r2.y, v4.w
  27: mov r2.z, v5.w
  28: dp3_sat r0.w, r1.xyzx, r2.xyzx
  29: mul r0.xyz, r0.wwww, r0.xyzx
  30: dp3 r0.w, -v2.xyzx, r1.xyzx
  31: add r0.w, r0.w, r0.w
  32: mad r1.xyz, r1.xyzx, -r0.wwww, -v2.xyzx
  33: dp3 r0.w, r1.xyzx, r2.xyzx
  34: mul r0.w, r0.w, r0.w
  35: mul r1.x, r0.w, r0.w
  36: add r1.y, -cb0[8].w, l(1.000000)
  37: sample r1.xyzw, r1.xyxx, t3.xyzw, s0
  38: mul r0.w, r1.x, l(16.000000)
  39: sample r1.xyzw, v1.xyxx, t0.xyzw, s2
  40: mad r2.xyz, cb0[4].xyzx, r1.xyzx, l(-0.220916, -0.220916, -0.220916, 0.000000)
  41: mul r1.xyz, r1.xyzx, cb0[4].xyzx
  42: mad r2.xyz, cb0[8].zzzz, r2.xyzx, l(0.220916, 0.220916, 0.220916, 0.000000)
  43: mul r2.xyz, r0.wwww, r2.xyzx
  44: mad r0.w, -cb0[8].z, l(0.779084), l(0.779084)
  45: mad r1.xyz, r1.xyzx, r0.wwww, r2.xyzx
  46: mul o0.xyz, r0.xyzx, r1.xyzx
  47: mov o0.w, l(1.000000)
  48: ret 
// Approximately 0 instruction slots used


 }


 // Stats for Vertex shader:
 //        d3d11: 29 avg math (27..31)
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_DEPTH 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 31 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"

Constant Buffer "UnityLighting" (768 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityShadows" (416 bytes) on slot 1 {
  Vector4 unity_LightShadowBias at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[1], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_output_siv o0.xyzw, position
      dcl_temps 3
   0: dp3 r0.x, v1.xyzx, cb2[4].xyzx
   1: dp3 r0.y, v1.xyzx, cb2[5].xyzx
   2: dp3 r0.z, v1.xyzx, cb2[6].xyzx
   3: dp3 r0.w, r0.xyzx, r0.xyzx
   4: rsq r0.w, r0.w
   5: mul r0.xyz, r0.wwww, r0.xyzx
   6: mul r1.xyzw, v0.yyyy, cb2[1].xyzw
   7: mad r1.xyzw, cb2[0].xyzw, v0.xxxx, r1.xyzw
   8: mad r1.xyzw, cb2[2].xyzw, v0.zzzz, r1.xyzw
   9: mad r1.xyzw, cb2[3].xyzw, v0.wwww, r1.xyzw
  10: mad r2.xyz, -r1.xyzx, cb0[0].wwww, cb0[0].xyzx
  11: dp3 r0.w, r2.xyzx, r2.xyzx
  12: rsq r0.w, r0.w
  13: mul r2.xyz, r0.wwww, r2.xyzx
  14: dp3 r0.w, r0.xyzx, r2.xyzx
  15: mad r0.w, -r0.w, r0.w, l(1.000000)
  16: sqrt r0.w, r0.w
  17: mul r0.w, r0.w, cb1[5].z
  18: mad r0.xyz, -r0.xyzx, r0.wwww, r1.xyzx
  19: ne r0.w, cb1[5].z, l(0.000000)
  20: movc r0.xyz, r0.wwww, r0.xyzx, r1.xyzx
  21: mul r2.xyzw, r0.yyyy, cb3[18].xyzw
  22: mad r2.xyzw, cb3[17].xyzw, r0.xxxx, r2.xyzw
  23: mad r0.xyzw, cb3[19].xyzw, r0.zzzz, r2.xyzw
  24: mad r0.xyzw, cb3[20].xyzw, r1.wwww, r0.xyzw
  25: div r1.x, cb1[5].x, r0.w
  26: min r1.x, r1.x, l(0.000000)
  27: max r1.x, r1.x, l(-1.000000)
  28: add r0.z, r0.z, r1.x
  29: min r1.x, r0.w, r0.z
  30: mov o0.xyw, r0.xyxw
  31: add r0.x, -r0.z, r1.x
  32: mad o0.z, cb1[5].y, r0.x, r0.z
  33: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_output o0.xyzw
   0: mov o0.xyzw, l(0,0,0,0)
   1: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_CUBE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "d3d11":
// Stats: 27 math, 3 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"

Constant Buffer "UnityLighting" (768 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
}
Constant Buffer "UnityShadows" (416 bytes) on slot 1 {
  Vector4 unity_LightShadowBias at 80
}
Constant Buffer "UnityPerDraw" (176 bytes) on slot 2 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TEXCOORD                 0   xy          2     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[1], immediateIndexed
      dcl_constantbuffer CB1[6], immediateIndexed
      dcl_constantbuffer CB2[7], immediateIndexed
      dcl_constantbuffer CB3[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyz
      dcl_output_siv o0.xyzw, position
      dcl_temps 3
   0: dp3 r0.x, v1.xyzx, cb2[4].xyzx
   1: dp3 r0.y, v1.xyzx, cb2[5].xyzx
   2: dp3 r0.z, v1.xyzx, cb2[6].xyzx
   3: dp3 r0.w, r0.xyzx, r0.xyzx
   4: rsq r0.w, r0.w
   5: mul r0.xyz, r0.wwww, r0.xyzx
   6: mul r1.xyzw, v0.yyyy, cb2[1].xyzw
   7: mad r1.xyzw, cb2[0].xyzw, v0.xxxx, r1.xyzw
   8: mad r1.xyzw, cb2[2].xyzw, v0.zzzz, r1.xyzw
   9: mad r1.xyzw, cb2[3].xyzw, v0.wwww, r1.xyzw
  10: mad r2.xyz, -r1.xyzx, cb0[0].wwww, cb0[0].xyzx
  11: dp3 r0.w, r2.xyzx, r2.xyzx
  12: rsq r0.w, r0.w
  13: mul r2.xyz, r0.wwww, r2.xyzx
  14: dp3 r0.w, r0.xyzx, r2.xyzx
  15: mad r0.w, -r0.w, r0.w, l(1.000000)
  16: sqrt r0.w, r0.w
  17: mul r0.w, r0.w, cb1[5].z
  18: mad r0.xyz, -r0.xyzx, r0.wwww, r1.xyzx
  19: ne r0.w, cb1[5].z, l(0.000000)
  20: movc r0.xyz, r0.wwww, r0.xyzx, r1.xyzx
  21: mul r2.xyzw, r0.yyyy, cb3[18].xyzw
  22: mad r2.xyzw, cb3[17].xyzw, r0.xxxx, r2.xyzw
  23: mad r0.xyzw, cb3[19].xyzw, r0.zzzz, r2.xyzw
  24: mad r0.xyzw, cb3[20].xyzw, r1.wwww, r0.xyzw
  25: min r1.x, r0.w, r0.z
  26: add r1.x, -r0.z, r1.x
  27: mad o0.z, cb1[5].y, r1.x, r0.z
  28: mov o0.xyw, r0.xyxw
  29: ret 
// Approximately 0 instruction slots used


-- Hardware tier variant: Tier 1
-- Fragment shader for "d3d11":
Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_output o0.xyzw
   0: mov o0.xyzw, l(0,0,0,0)
   1: ret 
// Approximately 0 instruction slots used


 }
}
CustomEditor "StandardShaderGUI"
Fallback "VertexLit"
}