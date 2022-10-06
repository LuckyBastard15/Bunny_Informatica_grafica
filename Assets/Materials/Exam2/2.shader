Shader "Custom/2"
{
   
    Properties
    {
       

    }
        SubShader{
           CGPROGRAM
           #pragma surface surf Lambert

           struct Input {
              float3 viewDir;
           };

           void surf(Input IN, inout SurfaceOutput o) {
              half rim = 1-dot(IN.viewDir, o.Normal);
              o.Albedo = float3(1-rim,rim,0);


           }
           ENDCG
    }
        FallBack "Diffuse"
}