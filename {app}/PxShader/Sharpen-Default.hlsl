// (C) 2011 Jan-Willem Krans (janwillem32 <at> hotmail.com)
// This file is part of Video pixel shader pack.
// This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 2.
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
// You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

// sharpen
// This shader should not be run as a screen space pixel shader.
// This shader requires compiling with ps_2_0, but higher is better, see http://en.wikipedia.org/wiki/Pixel_shader to look up what PS version your video card supports.
// If possible, avoid compiling with the software emulation modes (ps_?_sw). Pixel shaders require a lot of processing power to run in real-time software mode.
// This shader is meant to work with linear RGB input and output. Regular R'G'B' with a video gamma encoding will have to be converted with the linear gamma shaders to work properly.
// Use this shader to add a sharpened effect to an image, by using a basic unsharp mask.

// fractions, either decimal or not, are allowed
// Sharpen, interval [0, 2], amount of sharpening, 0 means disabled
#define Sharpen .75

sampler s0;
float2 c1 : register(c1);
#define sp(a, b) tex2D(s0, tex+c1*float2(a, b))

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	return sp(0, 0)*(1+Sharpen)-(sp(-1, -1)+sp(0, -1)+sp(1, -1)+sp(1, 0)+sp(0, 1)+sp(-1, 1)+sp(0, 1)+sp(1, 1))/8.*Sharpen;// apply an unsharp mask and output
}