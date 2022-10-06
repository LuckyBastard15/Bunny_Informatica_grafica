Shader "Unlit/Rim_Line3"
{
    Properties
    {
        _MainTex("Texture", 2D) = "White" {}
        _Color("Color", Color) = (1,1,1,1)
        _Range("Range",Range(0,5)) = 1

    }
        SubShader{

              CGPROGRAM
              #pragma surface surf Lambert
              half _Range;
              float4 _Color;
              sampler2D _MainTex;
              struct Input {
                 //float3 viewDir;
                 float2 uv_MainTex;
                 float3 worldRefl;
              };

              void surf(Input IN, inout SurfaceOutput o) {
                 half rim = 1 - saturate(dot(IN.worldRefl, o.Normal));
                 o.Albedo = tex2D(_MainTex, IN.uv_MainTex * _Range);
                 //o.Emission = float3(1 - rim, 1, 1-rim) * _Range;
                   o.Emission = _Color * pow(rim,1) * _Range;

           }
           ENDCG
    }
        FallBack "Diffuse"
}