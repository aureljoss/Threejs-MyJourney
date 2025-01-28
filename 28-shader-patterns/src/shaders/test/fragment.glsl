#define PI 3.1415926535897932384626433832795

varying vec2 vUv;

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

//	Classic Perlin 2D Noise 
//	by Stefan Gustavson (https://github.com/stegu/webgl-noise)
//
vec4 permute(vec4 x)
{
    return mod(((x*34.0)+1.0)*x, 289.0);
}

vec2 fade(vec2 t) {return t*t*t*(t*(t*6.0-15.0)+10.0);}

float cnoise(vec2 P){
  vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
  vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
  Pi = mod(Pi, 289.0); // To avoid truncation effects in permutation
  vec4 ix = Pi.xzxz;
  vec4 iy = Pi.yyww;
  vec4 fx = Pf.xzxz;
  vec4 fy = Pf.yyww;
  vec4 i = permute(permute(ix) + iy);
  vec4 gx = 2.0 * fract(i * 0.0243902439) - 1.0; // 1/41 = 0.024...
  vec4 gy = abs(gx) - 0.5;
  vec4 tx = floor(gx + 0.5);
  gx = gx - tx;
  vec2 g00 = vec2(gx.x,gy.x);
  vec2 g10 = vec2(gx.y,gy.y);
  vec2 g01 = vec2(gx.z,gy.z);
  vec2 g11 = vec2(gx.w,gy.w);
  vec4 norm = 1.79284291400159 - 0.85373472095314 * 
    vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11));
  g00 *= norm.x;
  g01 *= norm.y;
  g10 *= norm.z;
  g11 *= norm.w;
  float n00 = dot(g00, vec2(fx.x, fy.x));
  float n10 = dot(g10, vec2(fx.y, fy.y));
  float n01 = dot(g01, vec2(fx.z, fy.z));
  float n11 = dot(g11, vec2(fx.w, fy.w));
  vec2 fade_xy = fade(Pf.xy);
  vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
  float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
  return 2.3 * n_xy;
}

void main()
{
    //01
    // gl_FragColor = vec4(vUv.x, vUv.y 1.0, 1.0);
    //02
    // gl_FragColor = vec4(vUv.x, vUv.y, 0.0, 1.0);
    //03
    // float strength= vUv.x;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //04
    // float strength= vUv.y;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //05
    // float strength= 1.0-vUv.y;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //06
    // float strength= vUv.y*10.0;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //07
    // float strength= mod(vUv.y*10.0, 1.0);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //08
    // float strength= mod(vUv.y*10.0, 1.0);
    // strength= step(0.5,strength);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //09
    // float strength= mod(vUv.y*10.0, 1.0)-0.3;
    // strength= step(0.5,strength);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //10
    // float strength= mod(vUv.x*10.0, 1.0)-0.3;
    // strength= step(0.5,strength);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //11
    // float strengthA= mod(vUv.y*10.0, 1.0)-0.3;
    // strengthA= step(0.5,strengthA);
    // float strengthB= mod(vUv.x*10.0, 1.0)-0.3;
    // strengthB= step(0.5,strengthB);
    // float strength=strengthA+strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0); 
    //12
    // float strengthA= mod(vUv.y*10.0, 1.0)-0.3;
    // strengthA= step(0.5,strengthA);
    // float strengthB= mod(vUv.x*10.0, 1.0)-0.3;
    // strengthB= step(0.5,strengthB);
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0); 
    //13
    // float strengthA= mod(vUv.y*10.0, 1.0)-0.3;
    // strengthA= step(0.5,strengthA);
    // float strengthB= mod(vUv.x*10.0, 1.0)-0.3;
    // strengthB= step(0.5,strengthB);
    // float strength=strengthA-strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0); 
    // //14
    // float strengthA= step(0.4,mod(vUv.x*10.0, 1.0));
    // strengthA *= step(0.8,mod(vUv.y*10.0, 1.0));
    // float strengthB= step(0.4,mod(vUv.y*10.0, 1.0));
    // strengthB *= step(0.8,mod(vUv.x*10.0, 1.0));
    //15
    // float strengthA= step(0.4,mod(vUv.x*10.0-0.2, 1.0));
    // strengthA *= step(0.8,mod(vUv.y*10.0, 1.0));
    // float strengthB= step(0.4,mod(vUv.y*10.0-0.2, 1.0));
    // strengthB *= step(0.8,mod(vUv.x*10.0, 1.0));
    // //16
    // float strength= abs(vUv.x-0.5);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //17
    // float strength=min(abs(vUv.x-0.5),abs(vUv.y-0.5));
    //18
    // float strength=max(abs(vUv.x-0.5),abs(vUv.y-0.5));
    // //19
    // float strength=step(0.2,(max(abs(vUv.x-0.5),abs(vUv.y-0.5))));
    // //20
    // float strengthA=1.0-step(0.25,(max(abs(vUv.x-0.5),abs(vUv.y-0.5))));
    // float strengthB=step(0.20,(max(abs(vUv.x-0.5),abs(vUv.y-0.5))));
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //21
    // float strength= floor(vUv.x*10.0)/10.0;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //22
    // float strength= floor(vUv.x*10.0)/10.0;
    // strength*= floor(vUv.y*10.0)/10.0;
    // //23
    // float strength= random(vUv);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //24
    // vec2 gridUv=vec2(floor(vUv.x*10.0)/10.0,
    //                 floor(vUv.y*10.0)/10.0
    // );
    // float strength= random(gridUv);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //25
    // vec2 gridUv=vec2(floor(vUv.x*10.0)/10.0,
    //                 floor(vUv.y*10.0+vUv.x*5.0)/10.0
    // );
    // float strength= random(gridUv);
    // //26
    // float strength= length(vUv);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //27
    // float strength= distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //28 
    // float strength= 1.0-distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //29
    // float strength= 0.015/distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //30
    // vec2 lightUv=vec2(vUv.x*0.2+0.4,vUv.y);
    // float strength= 0.015/distance(lightUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //31
    // vec2 lightUvX=vec2(vUv.x*0.1+0.45,vUv.y*0.5+0.25);
    // float strengthA= 0.015/distance(lightUvX, vec2(0.5));
    // vec2 lightUvY=vec2(vUv.y*0.1+0.45,vUv.x*0.5+0.25);
    // float strengthB= 0.015/distance(lightUvY, vec2(0.5));
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //32
    // vec2 rotatedUv= rotate(vUv, 1.0, vec2(0.5));
    // vec2 lightUvX=vec2(rotatedUv.x*0.1+0.45,rotatedUv.y*0.5+0.25);
    // float strengthA= 0.015/distance(lightUvX, vec2(0.5));
    // vec2 lightUvY=vec2(rotatedUv.y*0.1+0.45,rotatedUv.x*0.5+0.25);
    // float strengthB= 0.015/distance(lightUvY, vec2(0.5));
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //33
    // float strength= step(0.25,distance(vUv, vec2(0.5)));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //34
    // float strength= abs(distance(vUv, vec2(0.5))-0.25);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //35
    // float strength= step(0.01,abs(distance(vUv, vec2(0.5))-0.25));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //36
    // float strength= 1.0-step(0.01,abs(distance(vUv, vec2(0.5))-0.25));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //37
    // vec2 wavedUv= vec2(
    //     vUv.x,
    //     vUv.y+sin(vUv.x*30.0)*0.1
    // );
    // float strength= 1.0-step(0.01,abs(distance(wavedUv, vec2(0.5))-0.25));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //38
    // vec2 wavedUv= vec2(
    //     vUv.x+sin(vUv.y*30.0)*0.1,
    //     vUv.y+sin(vUv.x*30.0)*0.1
    // );
    // float strength= 1.0-step(0.01,abs(distance(wavedUv, vec2(0.5))-0.25));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //39
    // vec2 wavedUv= vec2(
    //     vUv.x+sin(vUv.y*60.0)*0.1,
    //     vUv.y+sin(vUv.x*60.0)*0.1
    // );
    // float strength= 1.0-step(0.01,abs(distance(wavedUv, vec2(0.5))-0.25));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //40
    // float angle=atan(vUv.x, vUv.y);
    // float strength=angle;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //41
    // float angle=atan(vUv.x-0.5, vUv.y-0.5);
    // float strength=angle;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //42
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5) / (PI * 2.0) + 0.5;
    // angle /= PI * 2.0;
    // angle += 0.5;
    // float strength = angle;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //43
    // float angle=atan(vUv.x-0.5, vUv.y-0.5);
    // angle /= PI *2.0;
    // angle += 0.5;
    // angle*=20.0;
    // angle=mod(angle, 1.0);
    // float strength = angle;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //44
    // float angle=atan(vUv.x-0.5, vUv.y-0.5);
    // angle /= PI *2.0;
    // angle += 0.5;
    // float strength = sin(angle*200.0);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //46
    // float strength=cnoise(vUv*10.0);
    // //47
    // float strength=step(0.0,cnoise(vUv*10.0));
    // //48
    // float strength=1.0-abs(cnoise(vUv*10.0));
    // //49
    // float strength=sin(cnoise(vUv*10.0)*40.0);
    //50
    float strength=step(0.9,sin(cnoise(vUv*10.0)*40.0));

    //Clamp the strength
    strength=clamp(strength, 0.0, 1.0);

    //Colored version
    vec3 blackColor=vec3(0.0);
    vec3 uvColor=vec3(vUv, 1.0);
    vec3 mixedColor=mix(blackColor,uvColor,strength);
    gl_FragColor=vec4(mixedColor, 1.0);

    //BW version
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
}