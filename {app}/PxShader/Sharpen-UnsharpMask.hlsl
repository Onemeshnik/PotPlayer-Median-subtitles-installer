// (C) 2011 Jan-Willem Krans (janwillem32 <at> hotmail.com)
// This file is part of Video pixel shader pack.
// This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 2.
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
// You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

// unsharp luma mask for SD&HD video
// This shader should not be run as a screen space pixel shader.
// This shader requires compiling with ps_2_a, but higher is better, see http://en.wikipedia.org/wiki/Pixel_shader to look up what PS version your video card supports.
// If possible, avoid compiling with the software emulation modes (ps_?_sw). Pixel shaders require a lot of processing power to run in real-time software mode.
// If used in combination with other shaders and filters, place this and other Y'CbCr-type shaders at the beginning of the processing chain.
// Use this shader to add a sharpened effect to an image, by using an unsharp mask based on the luma values of a picture.

// fractions, either decimal or not, are allowed
// minimum limit to sharpen, 0 means disabled, low = 8/4096., medium = 12/4096., high = 16/4096.
#define Threshold 12/4096.
// amount of sharpening, 0 means disabled, low = 8/16., medium = 12/16., high = 16/16.
#define Intensity 12/16.
// compensation for black borders, 0 means disabled, low = 8/32., medium = 12/32., high = 16/32.
#define Compensate 12/32.

sampler s0;
float2 c1 : register(c1);
#define sp(a, b, c) float4 a = tex2D(s0, tex+c1*float2(b, c));

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float4 Y;
	if(c1.x < 1/1120. && c1.y < 1/630.) Y = float4(.299, .587, .114, 0);// SD
	else Y = float4(.2126, .7152, .0722, 0);// HD

	// sampling area, circle radius = 1.5, divided into the original pixel and 8 sectors, 9 pixels in total, 1 pixel per sector, 1 radial layer
	//	[ s2 s3 s4 ]
	//	[ s5 s1 s6 ]
	//	[ s7 s8 s9 ]
	sp(s1, 0, 0) sp(s2, -1, -1) sp(s3, 0, -1) sp(s4, 1, -1) sp(s5, -1, 0) sp(s6, 1, 0) sp(s7, -1, 1) sp(s8, 0, 1) sp(s9, 1, 1)

	// calulate the luma
	float r1 = dot(s1, Y);
	float r2 = dot(s2, Y);
	float r3 = dot(s3, Y);
	float r4 = dot(s4, Y);
	float r5 = dot(s5, Y);
	float r6 = dot(s6, Y);
	float r7 = dot(s7, Y);
	float r8 = dot(s8, Y);
	float r9 = dot(s9, Y);

	// reduce sharpening of the black borders by discarding border pixels
	bool q2 = r2 < Compensate;
	bool q4 = r4 < Compensate;
	if (q2 && r3 < Compensate && q4) return s1;
	bool q7 = r7 < Compensate;
	if (q2 && r5 < Compensate && q7) return s1;
	bool q9 = r9 < Compensate;
	if (q7 && r6 < Compensate && q9) return s1;
	if (q4 && r8 < Compensate && q9) return s1;

	float su = (r1*4+(r3+r5+r6+r8)*2+r2+r4+r7+r9)/16.;// the unsharp mask of 9 pixels
	float dm = su-r1;
	if(abs(dm) < Threshold) return s1;// discard pixels under the sharpening threshold
	return s1-Intensity*dm;// output sharpened pixel
}