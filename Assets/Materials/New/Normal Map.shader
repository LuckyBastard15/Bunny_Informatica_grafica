Shader "Example/Diffuse Bump" {
    Properties{
      _MainTex("Texture", 2D) = "white" {}
      _BumpMap("Bumpmap", 2D) = "bump" {}
       _Range("Range",Range(0,3)) = 1

      
    }
        SubShader{
          Tags { "RenderType" = "Opaque" }
          CGPROGRAM
          #pragma surface surf Lambert
       
          struct Input {
            float2 uv_MainTex;
            float2 uv_BumpMap;
           
          };
          half _Range;
          sampler2D _MainTex;
          sampler2D _BumpMap;
          

          void surf(Input IN, inout SurfaceOutput o) {
              o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
              o.Normal *= UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap) * _Range);
              o.Normal *= float3(_Range, _Range, 1);
          }
          ENDCG
    }
        Fallback "Diffuse"
}