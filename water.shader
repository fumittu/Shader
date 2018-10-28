Shader "Custom/water" {
	Properties {
		//インスペクタからテクスチャを設定できるようにする
		_MainTex ("water texture", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;
	    //サーフェイスシェーダが処理するテクスチャ座標を受け取る
		struct Input {
			float2 uv_MainTex;
		};

		// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
		// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
		// #pragma instancing_options assumeuniformscaling
		//UNITY_INSTANCING_BUFFER_START(Props)
			// put more per-instance properties here
		//UNITY_INSTANCING_BUFFER_END(Props)

		void surf (Input IN, inout SurfaceOutputStandard o) {
			//テクスチャのどの部分を使うか
			fixed2 uv = IN.uv_MainTex;

			//uv変数に対してどれだけのオフセットをたすのかを指定
			//スクロール速度✕時間（＝移動距離）」で計算
			uv.x += 0.5 * _Time;
			uv.y += 0.6 * _Time;
			o.Albedo = tex2D(_MainTex, uv);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
