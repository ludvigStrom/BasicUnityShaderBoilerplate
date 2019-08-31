//This is a boiler plate for Unity Shaders with descriptive comments for all basic functionallity

//Shader path, this is where the shader shows up in unity
Shader "Custom/BoilerPlateShader" 
{
	Properties
	{
		//inputs like textures and color
	}

	//This is where the actual shader starts, contains vertex shader and fragment shader
	SubShader 
	{
		Tags { "RenderType" = "Opaque" }

		Pass
		{
			//indicator that tells us that from here on we write CG-code
			CGPROGRAM 

			//pre compiler step that tells you the name of vertex and fragment shader
			//(corresponds to functions down below)
			#pragma vertex vert 
			#pragma fragment frag 

			//include unity specific functions and macros
			#include "UnityCG.cginc" 
			//#include "Lighting.cginc"
			//#include "AutoLight.cginc"


			//Mesh data: vertex position, vertex normal, UVs, tangets, vertex colors
			//more descriptive name woudl be VertexInput()
			struct VertexInput 
			{
				float4 vertex : POSITION; //Local space vertex from the mesh data
				//float4 colors : COLOR;
				//float3 normal : NORMAL;
				//float4 tanget : TANGENT;
				//float2 uv0 : TEXTCOORD0;
				//float2 uv1 : TEXCOORD1;
			};

			//output of the vertex shader going into the fragment shader
			struct VertexOutput
			{
				//SV_POSITION is a special semantic that reads as the clip postion 
				//in the shader
				//should be called vertex for Unity macros to function properly
				float4 vertex : SV_POSITION; 
			};

			//Variables Usually tied to the properties 
			//sampler2D _MainTex;
			//float4 _MainTex_ST;

			//Vertex  shader
			VertexOutput vert(VertexInput v) {
				VertexOutput o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			//fragment shader
			float4 frag(float4 o : SV_POSITION) : SV_Target
			{
				//Return a color for every pixel
				return float4(1,1,1,0);
			}

			ENDCG //ends CG code
		}
	}
}
