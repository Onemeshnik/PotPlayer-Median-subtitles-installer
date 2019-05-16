/*Deband filter from mpv's haasn algorithm, ported by mbah.primbon, searched by Dreamject*/

/* --- Settings --- */

#define Threshold 200 //0-4096 (Default 64)
#define Range 16 //1-64 (Default 16)
#define Grain 48 //0-4096 (Default 48)
#define Iterations 1 //1-16 (Default 1)

/* ---  Defining Constants --- */
#define myTex2D(s,p) tex2D(s,p)

#ifndef s0
  sampler s0 : register(s0);
  #define s1 s0
//sampler s1 : register(s1);

  float4 p0 : register(c0);
  float4 p1 : register(c1);

//  #define width (p0[0])
//  #define height (p0[1])
//  #define counter (p0[2])
  #define clock (p0[3])
//  #define px (p1[0]) //one_over_width 
//  #define py (p1[1]) //one_over_height

  #define px (p1.x) //one_over_width 
  #define py (p1.y) //one_over_height
  
  #define screen_size float2(p0.x,p0.y)

  #define pixel float2(px,py)

//#define pxy float2(p1.xy)

//#define PI acos(-1)
#endif


/* ---  Main code --- */

   /*-----------------------------------------------------------.   
  /                     Deband Filter                           /
  '-----------------------------------------------------------*/

float permute(float x) { return ((34.0 * x + 1.0) * x) % 289.0; }
float rand(float x)    { return frac(x * 0.024390243); }


float3 average(sampler2D tex, float2 pos, float range, inout float h) 
{
    // Compute a random rangle and distance
    float dist = rand(h) * range;     h = permute(h);
    float dir  = rand(h) * 6.2831853; h = permute(h);

    float2 pt = dist * pixel;
    float2 o = float2(cos(dir), sin(dir));

    // Sample at quarter-turn intervals around the source pixel
    float3 ref[4];
    ref[0] = tex2D(tex, pos + pt * float2( o.x,  o.y)).rgb;
    ref[1] = tex2D(tex, pos + pt * float2(-o.y,  o.x)).rgb;
    ref[2] = tex2D(tex, pos + pt * float2(-o.x, -o.y)).rgb;
    ref[3] = tex2D(tex, pos + pt * float2( o.y, -o.x)).rgb;

    // Return the (normalized) average
    return (ref[0] + ref[1] + ref[2] + ref[3]) * 0.25;
}


/* --- Main --- */

float4 main(float2 texcoord : TEXCOORD0) : COLOR 
{   
	float h;
    // Initialize the PRNG by hashing the position + a random uniform
    float3 m = float3(texcoord, clock * 0.0002) + 1.0;
    h = permute(permute(permute(m.x) + m.y) + m.z);

    // Sample the source pixel
    float3 col = tex2D(s0, texcoord).rgb;
	float3 avg; float3 diff;
	
	#if (Iterations == 1)
		[unroll]
	#endif
    for (int i = 1; i <= Iterations; i++) {
        // Sample the average pixel and use it instead of the original if the difference is below the given threshold
        avg = average(s0, texcoord, i * Range, h);
        diff = abs(col - avg);
        col = lerp(avg, col, diff > Threshold * 0.00006103515625 * i);
    }

    if (Grain > 0.0) {
		// Add some random noise to smooth out residual differences
		float3 noise;
		noise.x = rand(h); h = permute(h);
		noise.y = rand(h); h = permute(h);
		noise.z = rand(h); h = permute(h);
		col += (Grain * 0.000122070313) * (noise - 0.5);
	}

    return float4(col, 1.0);
}