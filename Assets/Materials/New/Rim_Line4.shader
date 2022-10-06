Shader "Custom/Rim_Line4"
{
    Properties
    {
        _Color("Alpha", Color) = (1,1,1,1)
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
                 half rim = saturate(dot(IN.viewDir, o.Normal));
                 o.Albedo = float3(1 - rim,rim,rim) * _Range;
                 //o.Emission = float3(1 - rim, 1, 1-rim) * _Range;
                   o.Emission = pow(rim, 1) * _Color * _Range;

           }
           ENDCG
    }
        FallBack "Diffuse"
}