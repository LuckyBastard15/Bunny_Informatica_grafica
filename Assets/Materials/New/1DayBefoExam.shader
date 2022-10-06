Shader "2doParc/Rim"
{
    
    Properties{
        _Range("Range",Range(0,5)) = 1
        _MainTex("Texture", 2D)= "White"{}

    }
    SubShader{
        CGPROGRAM

        #pragma surface surf Lambert alpha
        float4 _RimColor;
        half _Range;
        sampler _MainTex;

        struct Input {
            float3 viewDir;
            float3 worldPos;
            float2 uv_MainTex;

        };

        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            //o.Emission = frac(IN.worldPos.x * 5) > 0.9 ? float3(1, 1, 0) : frac(IN.worldPos.y * 5) > 0.9 ? float3(1, 0, 1) : 0;
            o.Alpha = frac(IN.worldPos.x * 10) > 0.6 ? float3(1, 1, 0) : frac(IN.worldPos.y * 10) > 0.6 ? float3(1, 0, 1) : 0 * _Range;
        }
        ENDCG
    }
}