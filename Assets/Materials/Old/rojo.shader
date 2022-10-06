Shader"Clase/DifuseColor"{
    Properties{
        _Color("Color",Color) = (1,1,1,1)
        _Emission("Emission",Color) = (1,1,1,1)
        //Propiedad ranura o espacio de textura en unity
        _MainTex("Texture",2D) = "white"{}
    }
        SubShader{
            CGPROGRAM
            #pragma surface surf Lambert
            float4 _Color;
            float4 _Emission;
            //Variable para conectar con CG
            sampler2D  _MainTex;
            struct Input
            {
                //Colocar textura a traves del UV
                float2 uv_MainTex;
            };
            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = tex2D(_MainTex,IN.uv_MainTex);
                o.Emission.r = 255;
            }
            ENDCG
    }
}