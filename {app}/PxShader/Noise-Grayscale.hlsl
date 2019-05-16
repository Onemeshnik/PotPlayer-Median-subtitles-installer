// semi-random grayscale noise
// This shader can be run as a screen space pixel shader.
// This shader requires compiling with ps_2_0, but higher is better, see http://en.wikipedia.org/wiki/Pixel_shader to look up what PS version your video card supports.
// If possible, avoid compiling with the software emulation modes (ps_?_sw). Pixel shaders require a lot of processing power to run in real-time software mode.
// This shader benefits from converting to linear RGB, instead of using video gamma input directly.
// Use this shader to add some basic noise that is randomized over time and space to a video.

// fractions, either decimal or not, are allowed
// NoiseStrength, interval [0, 1]
#define NoiseStrength 7/64.
// RandomFactors, randomization factors, almost every type of input for each of the four components is allowed
#define RandomFactors float4(pow(acos(-1), 4), exp(5), pow(13, acos(-1)/2.), sqrt(1997))

sampler s0;
float4 c0;
#define rd(a) rn.a = frac(dot(rn, RandomFactors));

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float4 rn = float4(tex, c0.zw/65536.+exp(5));// input coordinates and time factors
	for(int i = 0; i < 3; i++) {rd(x) rd(y) rd(z) rd(w)}// randomize, a low run count will make patterned noise
	float gn = (1.5*NoiseStrength)-dot(1, rn)*NoiseStrength;// relate the randomized numbers to the noise strength
	float4 s1 = tex2D(s0, tex);// original pixel
	//s1 = .5;// uncomment this line to only display the generated noise
	return s1+gn*(.25+dot(.25, s1));// output a brightness-balanced noise map over the original pixel
}