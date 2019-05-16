// semi-random colored surface noise
// This shader can be run as a screen space pixel shader.
// This shader requires compiling with ps_2_a, but higher is better, see http://en.wikipedia.org/wiki/Pixel_shader to look up what PS version your video card supports.
// If possible, avoid compiling with the software emulation modes (ps_?_sw). Pixel shaders require a lot of processing power to run in real-time software mode.
// This shader benefits from converting to linear RGB, instead of using video gamma input directly.
// Use this shader to add noise on surfaces in an image, by using contour color detection and random colored noise.

// fractions, either decimal or not, are allowed
// maximum noise strength, interval [0, 1]
#define NoiseStrength .125

sampler s0;
float4 c0;
float2 c1;

#define sp(a, b, c) float4 a = tex2D(s0, tex+c1*float2(b, c));
// RandomFactors; randomization factors, almost every type of input for each of the three components is allowed
#define RandomFactors float4(pow(acos(-1), 4), exp(5), pow(13, acos(-1)/2.), sqrt(1997))
#define rd(a) rn.a = frac(dot(rn, RandomFactors));

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	sp(s1, 0, 0)// original pixel
	sp(s2, -1, -1) sp(s3, 0, -1) sp(s4, 1, -1) sp(s5, -1, 0) sp(s6, 1, 0) sp(s7, -1, 1) sp(s8, 0, 1) sp(s9, 1, 1)// sample surrounding pixels
	float4 dv = smoothstep(.25, .125, abs(s2+s3+s4-s7-s8-s9)+abs(s2+s5+s7-s4-s6-s9)+abs(s2+s3+s5-s6-s8-s9)+abs(s3+s4+s6-s5-s7-s8));// color contour detection

	float4 rn = float4(tex, c0.zw/65536.+exp(5));// input coordinates and time factors
	for(int j = 0; j < 3; j++) {rd(w) rd(z) rd(y) rd(x)}// randomize, a low run count will make patterned noise
	return s1+(rn-.5)*dv*NoiseStrength;// minimize the dithering on contours, add colored noise and output
}