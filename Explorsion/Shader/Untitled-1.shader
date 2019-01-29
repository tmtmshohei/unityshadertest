Shader "hoge"
{
    Properties
    {
        //?
        [keywordEnum(Property,Camera)]
        _Methhod("DestructionMethod", Float) = 0
        _TintColor("Tint color",color) = (0.5.,0.5.,0.5,0.5)
        _MainTex("Particle Texture" , 2D) = "white" {}
        _InVFade("Soft Particles Factor" , Range(0.01,3.0,)) = 1.0
        _Destruction("Destruction Factor " , Range(0.0,1.0)) = 0.0
        _PositonFactor("Position Factor" , Range(0.0,1.0)) = 0.0
        _RotationFactor("RotatonFactor", Range(0.0,1.0)) = 0.0
        _ScaleFactro("scale" , Range(0.0,1.0)) = 1.0
        

        SubShader
        {
            Tags
            {
                "RenderType" = "Transparent"
                "Queue" = "Transparent"
                //?
                "IgnoreProjector" = "True"
                //?
                "PreviewType" = "Plane"
            }

            Pass
            {
                Blend SrcAlpha One
                ColorMask RGB
                Cull Off Lighting Off ZWrite Off

                CGPROGRAM
                #pragma vertex vert
                #pragma Geometry geom 
                #pragma fragment frag
                #pragma traget 4.0
                //?
                #pragma multi_compile_Particles
                //?
                #pragma multi_compile_METHOD_PROERTY_METHOD_CAMERA
                #include "unityCG.cginc" 
                #define PI 3.1415926535

                sampler2D _MainTex;
                fixed4 _TintColor;
                
            }

        }
    }
}