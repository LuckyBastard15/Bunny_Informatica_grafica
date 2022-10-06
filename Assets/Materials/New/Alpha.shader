Shader "Custom/Alpha"
{
  
    Properties
    {

        _MainTex("Texture",2D) = "white"{}
        _Color("Color",Color) = (1,1,1,1)
        _Cube("Cube", CUBE) = ""{}
        _Range("Range",Range(0,2)) = 1
        

    }
        SubShader
        {   
            Tags{"RenderType" = "Transparent"}
            CGPROGRAM
            #pragma surface surf Lambert alpha
            float4 _Color;
            sampler2D _MainTex;
            samplerCUBE _Cube;
            half _Range;
            struct Input
            {
                float2 uv_MainTex;
                float3 worldRefl;

            };
            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo.gb = texCUBE(_Cube,IN.worldRefl);
                o.Emission = texCUBE(_Cube,IN.worldRefl);
                o.Alpha = _Range;
               
            }
            ENDCG
        }

}