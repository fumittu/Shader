﻿Shader "Custom/Texture" {
	Properties {
		//インスペクタからテクスチャを設定できるようにPropertiesブロックにテクスチャファイルを宣言
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		//sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		//half _Glossiness;
		//half _Metallic;
		//fixed4 _Color;
	    //テクスチャを使用するため、テクスチャ格納用の変数（sampler2D型の_MainTex変数）を宣言
	    sampler2D _MainTex;

		// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
		// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
		// #pragma instancing_options assumeuniformscaling
		//UNITY_INSTANCING_BUFFER_START(Props)
			// put more per-instance properties here
		//UNITY_INSTANCING_BUFFER_END(Props)

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			//出力する色としてAlbedoに指定
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
