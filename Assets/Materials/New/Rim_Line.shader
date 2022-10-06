Shader "Custom/Rim_Line"
{
	
        SubShader{
           CGPROGRAM
           #pragma surface surf Lambert

           struct Input {
              float3 viewDir;
           };

           void surf(Input IN, inout SurfaceOutput o) {
              half rim = dot(IN.viewDir, o.Normal);
              o.Albedo = float3(rim, 1, 1 - rim);
             
           }
           ENDCG
        }
            FallBack "Diffuse"
    }


