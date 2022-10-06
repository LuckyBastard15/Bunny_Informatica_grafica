Shader "Unlit/Rim_Line2"
{
    Properties
    {
        _Color("Alpha", Color)= (1,1,1,1)
        _Range("Range",Range(0,5)) = 1

    }
    SubShader{

          CGPROGRAM
          #pragma surface surf Lambert
          half _Range;
          float4 _Color;
          struct Input {
             float3 viewDir;
             
          };

          void surf(Input IN, inout SurfaceOutput o) {
             half rim = 1 -saturate(dot(IN.viewDir, o.Normal));
                //o.Albedo = float3(1 - rim, 0,0) * _Range;
                //o.Emission = float3(1 - rim, 1, 1-rim) * _Range;
                  o.Emission = pow(rim,2) * _Color * _Range;

          }
          ENDCG
    }
        FallBack "Diffuse"
}