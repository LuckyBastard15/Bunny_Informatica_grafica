Shader "Custom/4"
{
    Properties{
       
        _Range("RimPower", Range(0, 1)) = 1
        _MainTex("Texture",2D) = "white"{}
    }

        SubShader{
        CGPROGRAM
        #pragma surface surf Lambert
        
        half _Range;
        sampler2D _MainTex;
        struct Input {
           float3 viewDir;
           float3 worldPos;
           float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o) {
          half rim = 1 - saturate(dot(IN.viewDir, o.Normal));
          o.Emission.g = pow(rim, _Range);
          o.Emission.r = frac(IN.worldPos.y * 5 * _Range) > 0.5;
          o.Albedo = tex2D(_MainTex, IN.uv_MainTex);

            

        }
       ENDCG
    }
        FallBack "Diffuse"
}