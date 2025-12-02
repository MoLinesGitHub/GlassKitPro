#include <metal_stdlib>
using namespace metal;

kernel void glassNoise(texture2d<float, access::write> outTexture [[texture(0)]],
                       uint2 gid [[thread_position_in_grid]]) {
    float2 uv = float2(gid) / float2(outTexture.get_width(), outTexture.get_height());
    float noise = fract(sin(dot(uv, float2(12.9898, 78.233))) * 43758.5453);
    float3 color = float3(noise * 0.35);
    outTexture.write(float4(color, 1.0), gid);
}
