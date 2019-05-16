// (C) 2011 Jan-Willem Krans (janwillem32 <at> hotmail.com)
// This file is part of Video pixel shader pack.
// This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 2.
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
// You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

// brightness, contrast, grayscale gamma, colorfulness gamma, hue and saturation controls for SD&HD video input
// This shader should not be run as a screen space pixel shader.
// This shader requires compiling with ps_2_0, but higher is better, see http://en.wikipedia.org/wiki/Pixel_shader to look up what PS version your video card supports.
// If possible, avoid compiling with the software emulation modes (ps_?_sw). Pixel shaders require a lot of processing power to run in real-time software mode.
// If used in combination with other shaders and filters, place this and other Y'CbCr-type shaders at the beginning of the processing chain.

// fractions, either decimal or not, are allowed
// Brightness, interval [-10, 10], default 0
#define Brightness -0.01
// Contrast, interval [0, 10], default 1
#define Contrast 1.1
// GrayscaleGamma and ColorfulnessGamma, interval (0, 10], default 1
#define GrayscaleGamma 0.8
#define ColorfulnessGamma 0.9
// Hue, interval [-180, 180], default 0
#define Hue 0
// Saturation, interval [0, 10], default 1
#define Saturation 1.1

sampler s0;
float2 c0;

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float3 s1 = tex2D(s0, tex).rgb;// original pixel
	if(c0.x < 1120 && c0.y < 630) s1 = float3(dot(float3(.299, .587, .114), s1), dot(float3(-.1495/.886, -.2935/.886, .5), s1), dot(float3(.5, -.2935/.701, -.057/.701), s1));// SD RGB to Y'CbCr
	else s1 = float3(dot(float3(.2126, .7152, .0722), s1), dot(float3(-.1063/.9278, -.3576/.9278, .5), s1), dot(float3(.5, -.3576/.7874, -.0361/.7874), s1));// HD RGB to Y'CbCr

	s1.x = s1.x*Contrast+Brightness;// process contrast and brightness
	s1.yz = 2*mul(float2x2(cos(radians(Hue)), sin(radians(Hue)), -sin(radians(Hue)), cos(radians(Hue))), s1.yz)*Saturation;// process saturation and hue, extend the chroma interval from [-.5, .5] to [-1, 1] for gamma processing
	// preserve the sign bits of Y'CbCr values
	float3 sb = sign(s1);
	s1 *= sb;
	s1 = sb*pow(s1, float3(GrayscaleGamma, ColorfulnessGamma, ColorfulnessGamma));// gamma processing

	if(c0.x < 1120 && c0.y < 630) return float3(s1.x+.5*1.402*s1.z, dot(s1, float3(1, -.5*.202008/.587, -.5*.419198/.587)), s1.x+.5*1.772*s1.y).rgbb;// SD Y'CbCr to RGB output, compensate for the chroma ranges
	return float3(s1.x+.5*1.5748*s1.z, dot(s1, float3(1, -.5*.1674679/.894, -.5*.4185031/.894)), s1.x+.5*1.8556*s1.y).rgbb;// HD Y'CbCr to RGB output, compensate for the chroma ranges
}