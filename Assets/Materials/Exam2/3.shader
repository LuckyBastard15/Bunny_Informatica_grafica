Shader "Custom/3"
{
    Properties{
      _MainTex("Texture", 2D) = "white" {}
      _BumpMap("Bumpmap", 2D) = "bump" {}
      _Range("Range",Range(0,3)) = 1
      _Cube("Cube", CUBE) = ""{}
      _Color("Color",Color) = (1,1,1,1)


    }
        SubShader{
          
          CGPROGRAM
          #pragma surface surf Lambert
          float4 _Color;
          struct Input {
            float2 uv_MainTex;
            float2 uv_BumpMap;
            float3 worldRefl;
            
            INTERNAL_DATA

          };
          half _Range;
          sampler2D _MainTex;
          sampler2D _BumpMap;
          samplerCUBE _Cube;

          void surf(Input IN, inout SurfaceOutput o) {

              o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
              o.Normal *= UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap) * _Range);
              o.Normal *= float3(_Range, _Range, 1);
              
              
          }
          ENDCG
       }
           Fallback "Diffuse"
}